#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/dotnet/core"
TOOL_NAME="dotnet"
TOOL_TEST="dotnet --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if dotnet is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

# taken from  asdf-dotnet-core plugin
RELEASES_URI=https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases-index.json
FILE="releases.json"
KEY="latest-sdk"

download() {
  curl -s $RELEASES_URI
}

match_key() {
  grep -Eo '"'$1'": \".*\"'
}

sanitize() {
  sed -e 's/"'$1'": \"//;s/\"//'
}

gnutac() {
  if hash tac 2>/dev/null; then
    tac "$@"
  else
    tail -r "$@"
  fi
}

list_all_versions() {
  echo $(download | match_key $FILE | sanitize $FILE | xargs -n 1 -P 0 curl | match_key $KEY | sanitize $KEY | sort -r) | sed 's/ /\n/g'
}

download_installer() {
  local downloader
  downloader=$1
  echo "* Downloading $TOOL_NAME installer..."
  $downloader -sSL https://dot.net/v1/dotnet-install.sh >"$ASDF_DOWNLOAD_PATH/dotnet-install.sh"
  chmod +x "$ASDF_DOWNLOAD_PATH/dotnet-install.sh"

}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  # TODO: Adapt the release URL convention for dotnet
  url="$GH_REPO/archive/v${version}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"

    "$ASDF_DOWNLOAD_PATH/dotnet-install.sh" --install-dir "$ASDF_INSTALL_PATH" --channel STS --version "$ASDF_INSTALL_VERSION" --no-path

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    rm -rf "$ASDF_DOWNLOAD_PATH/dotnet-install.sh"
    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}

#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="dotnet"
TOOL_TEST="dotnet --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

RELEASES_URI=https://raw.githubusercontent.com/hensou/asdf-dotnet/main/versions.txt

download() {
  curl "${curl_opts[@]}" $RELEASES_URI
}

list_all_versions() {
  download | tr '\n' ' '
}

download_installer() {
  local downloader
  downloader=$1
  echo "* Downloading $TOOL_NAME installer..."
  $downloader -sSL https://dot.net/v1/dotnet-install.sh >"$ASDF_DOWNLOAD_PATH/dotnet-install.sh"
  chmod +x "$ASDF_DOWNLOAD_PATH/dotnet-install.sh"

}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    rm -rf "$install_path"

    install_path="${install_path%/*}/all-in-one"

    mkdir -p "$install_path"

    "$ASDF_DOWNLOAD_PATH/dotnet-install.sh" --install-dir "$install_path" --channel STS --version "$ASDF_INSTALL_VERSION" --no-path

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

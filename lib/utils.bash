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
  local versions="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"

    IFS=','
    for version in $ASDF_INSTALL_VERSION; do
      if [ -d "$ASDF_INSTALL_PATH/../$version" ] && [ ! -z "$(ls -Aq "$ASDF_INSTALL_PATH/../$version")" ]; then
        echo "asdf-$TOOL_NAME skip install $version: already installed in [$ASDF_INSTALL_PATH/../$version]"
      else
        echo "asdf-$TOOL_NAME installing $version to [$ASDF_INSTALL_PATH/../$version]..."
        "$ASDF_DOWNLOAD_PATH/dotnet-install.sh" --install-dir "$ASDF_INSTALL_PATH/../$version" --channel STS --version "$version" --no-path
      fi
    done

    if [[ "$ASDF_INSTALL_VERSION" == *"$IFS"* ]]; then
      for version in $ASDF_INSTALL_VERSION; do
        # NOTE: we cant use '--symbolic-link' - the dotnet command does not see all sdks with this option.
        cp -ra --update=none "$ASDF_INSTALL_PATH/../$version/." "$ASDF_INSTALL_PATH/"
      done
    fi

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    rm -rf "$ASDF_DOWNLOAD_PATH/dotnet-install.sh"
    echo "$TOOL_NAME $versions installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $versions."
  )
}

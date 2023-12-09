asdf_update_dotnet_home() {
  local dotnet_path
  dotnet_path="$(asdf which dotnet)"
  if [[ -n "${dotnet_path}" ]]; then
    export DOTNET_ROOT
    DOTNET_ROOT="$(dirname "$(realpath "${dotnet_path}")")"
    export MSBuildSDKsPath
    DOTNET_VERSION="$(dotnet --version)"
    export MSBuildSDKsPath="$DOTNET_ROOT/sdk/$DOTNET_VERSION/Sdks"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_dotnet_home

#!/usr/bin/env bash

asdf_update_dotnet_home() {
  local dotnet_path
  dotnet_path="$(asdf which dotnet 2>/dev/null)"
  if [[ -n "${dotnet_path}" ]]; then
    export DOTNET_ROOT
    DOTNET_ROOT="$(dirname "$(realpath "${dotnet_path}")")"
    export MSBuildSDKsPath
    DOTNET_VERSION="$(dotnet --version)"
    export MSBuildSDKsPath="$DOTNET_ROOT/sdk/$DOTNET_VERSION/Sdks"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
  fi
}

prompt_command() {
  asdf_update_dotnet_home
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND}; prompt_command}"
export PROMPT_COMMAND="${PROMPT_COMMAND:-prompt_command}"

function asdf_update_dotnet_home --on-event fish_prompt
    set --local dotnet_path (asdf which dotnet)
    if test -n "$dotnet_path"
        set --local full_path (realpath "$dotnet_path")
        set -gx DOTNET_ROOT (dirname "$full_path")
        set --local dotnet_version (string replace -r '.*/installs/dotnet/(.+)/[.].*' '$1' $dotnet_path)
        set -gx MSBuildSDKsPath (realpath "$DOTNET_ROOT/sdk/$dotnet_version/Sdks")
        set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
    end
end

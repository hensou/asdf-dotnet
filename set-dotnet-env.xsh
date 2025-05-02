#!/usr/bin/env xonsh

def asdf_update_dotnet_home() -> None:
    dotnet_path=$(asdf which dotnet 2>/dev/null).rstrip('\n')
    if dotnet_path:
        $DOTNET_ROOT=$(dirname $(realpath @(dotnet_path))).rstrip('\n')
        dotnet_version=$(dotnet --version).rstrip('\n')
        $MSBuildSDKsPath=$DOTNET_ROOT + "/sdk/" + dotnet_version + "/Sdks"

@events.on_chdir
def update_dotnet_home_on_chdir(olddir, newdir, **kw) -> None:
    asdf_update_dotnet_home()

@events.on_post_init
def update_dotnet_home_on_post_init() -> None:
    asdf_update_dotnet_home()

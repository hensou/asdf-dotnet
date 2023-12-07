<div align="center">

# asdf-dotnet [![Build](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml) [![Lint](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml)


[dotnet](https://github.com/hensou/asdf-dotnet) plugin for the [asdf version manager](https://asdf-vm.com). This repo is inspired by [asdf-dotnet-core](https://github.com/emersonsoares/asdf-dotnet-core) by @emersonsoares.

</div>

> :warning: Currently, as reported in #6, there could be some issues with [csharp-ls](https://github.com/razzmatazz/csharp-language-server) failing to detect the dotnet installation.

# Contents

- [Dependencies](#dependencies)
- [Telemetry](#telemetry)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)
- [Updating DOTNET_ROOT and MsBuildSDksPath](#updating-variables)

# Dependencies

- `bash`, `curl`, `grep`, `sed`, `git`: generic POSIX utilities.

# Telemetry

> :warning: Once installed, the .NET SDK will collect telemetry by default ([learn more](https://learn.microsoft.com/en-us/dotnet/core/tools/telemetry#how-to-opt-out)). If you don't want to send analytics data to Microsoft, follow the instructions below before (or after) installing the SDK.

To disable telemetry, add the following line to your shell profile (`~/.bashrc`, `~/.zshrc`, `~/.config/fish/config.fish`, etc.):

```shell
export DOTNET_CLI_TELEMETRY_OPTOUT=1
```

Once added, reload your profile for the changes to take effect.

```shell
exec $SHELL
```

# Install

Installing this plugin:

```shell
asdf plugin add dotnet
# or
asdf plugin add dotnet https://github.com/hensou/asdf-dotnet.git
```

Installing a dotnet version:

```shell
# Show all installable versions
asdf list-all dotnet

# Install specific version
asdf install dotnet latest

# Set a version globally (on your ~/.tool-versions file)
asdf global dotnet latest

# Now dotnet commands are available
dotnet --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# <a id="updating-variables"></a>Updating DOTNET_ROOT and MsBuildSDksPath

According to your shell, add the following instructions to update or set the DOTNET_ROOT and MsBuildSDksPath environment variables:

For bash, use:

`. ~/.asdf/plugins/dotnet/set-dotnet-env.bash`

For zsh shell, instead use:

`. ~/.asdf/plugins/dotnet/set-dotnet-env.zsh`

For fish shell, instead use:

`source ~/.asdf/plugins/dotnet/set-dotnet-env.fish`

For xonsh shell, instead use:

`source ~/.asdf/plugins/dotnet/set-dotnet-env.xsh`

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/hensou/asdf-dotnet/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Henrique](https://github.com/hensou/)

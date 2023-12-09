<div align="center">

# asdf-dotnet [![Build](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml) [![Lint](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml)


[dotnet](https://github.com/hensou/asdf-dotnet) plugin for the [asdf version manager](https://asdf-vm.com). This repo is inspired by [asdf-dotnet-core](https://github.com/emersonsoares/asdf-dotnet-core) by @emersonsoares.

</div>

> :warning: Currently, as reported in #6, there could be some issues with [csharp-ls](https://github.com/razzmatazz/csharp-language-server) failing to detect the dotnet installation.

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)
- [Updating global environment variables](#updating-variables)

# Dependencies

- `bash`, `curl`, `grep`, `sed`, `git`: generic POSIX utilities.

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

# <a id="updating-variables"></a>Updating global environment variables

If you need to:

- update/set `DOTNET_ROOT` variable
- update/set `MsBuildSDksPath` variable
- disable telemetry (i.e. set `DOTNET_CLI_TELEMETRY_OPTOUT` to 1)

then, according to your shell, execute one of the following commands:

For bash, use:

`. ~/.asdf/plugins/dotnet/set-dotnet-env.bash`

For zsh shell, instead use:

`. ~/.asdf/plugins/dotnet/set-dotnet-env.zsh`

For fish shell, instead use:

`source ~/.asdf/plugins/dotnet/set-dotnet-env.fish`

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/hensou/asdf-dotnet/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Henrique](https://github.com/hensou/)

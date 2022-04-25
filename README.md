<div align="center">

# asdf-dotnet [![Build](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/build.yml) [![Lint](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml/badge.svg)](https://github.com/hensou/asdf-dotnet/actions/workflows/lint.yml)


[dotnet](https://github.com/hensou/asdf-dotnet) plugin for the [asdf version manager](https://asdf-vm.com). This repo is inspired by [asdf-dotnet-core](https://github.com/emersonsoares/asdf-dotnet-core) by @emersonsoares.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add dotnet
# or
asdf plugin add dotnet https://github.com/hensou/asdf-dotnet.git
```

dotnet:

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

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/hensou/asdf-dotnet/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Henrique](https://github.com/hensou/)

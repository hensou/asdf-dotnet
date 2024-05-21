# Changelog

## [1.3.0](https://www.github.com/hensou/asdf-dotnet/compare/v1.2.1...v1.3.0) (2024-05-21)


### Features

* makes asdf-dotnet list all versions and improves performance ([ab4759e](https://www.github.com/hensou/asdf-dotnet/commit/ab4759e1e51092c3907df65be93227bfa9fb9294))


### Bug Fixes

* remove sort_versions call ([5aa24bb](https://www.github.com/hensou/asdf-dotnet/commit/5aa24bbdf380d35c33ec46ad348a36f80b393bb3))

### [1.2.1](https://www.github.com/hensou/asdf-dotnet/compare/v1.2.0...v1.2.1) (2024-05-10)


### Bug Fixes

* use curl_options when using curl in download function ([28750fe](https://www.github.com/hensou/asdf-dotnet/commit/28750fede28d27efdb584f9fae5007b4ef3d146c)), closes [#28](https://www.github.com/hensou/asdf-dotnet/issues/28)

## [1.2.0](https://www.github.com/hensou/asdf-dotnet/compare/v1.1.0...v1.2.0) (2024-02-06)


### Features

* adds a set-dotnet-env script for xonsh ([#20](https://www.github.com/hensou/asdf-dotnet/issues/20)) ([1675206](https://www.github.com/hensou/asdf-dotnet/commit/1675206288dbcdfd1157534338e35076b0da55d3))

## [1.1.0](https://www.github.com/hensou/asdf-dotnet/compare/v1.0.3...v1.1.0) (2023-12-26)


### Features

* disable telemetry when setting global environment variables ([ebe399c](https://www.github.com/hensou/asdf-dotnet/commit/ebe399cd5400dfb11158824fa06d1a1b2a28dd1b))

### [1.0.3](https://www.github.com/hensou/asdf-dotnet/compare/v1.0.2...v1.0.3) (2023-07-31)


### Bug Fixes

* remove "Current" channel warning by specifying  "STS" channel ([05bb284](https://www.github.com/hensou/asdf-dotnet/commit/05bb284dc82c958fe3e73579db997c0e4bfd32a1))

### [1.0.2](https://www.github.com/hensou/asdf-dotnet/compare/v1.0.1...v1.0.2) (2023-06-24)


### Bug Fixes

* use regex instead of 'dotnet version' to speed up fish prompt ([39651fb](https://www.github.com/hensou/asdf-dotnet/commit/39651fb3db7f867080efd5f85b0809a3ed33ba0f))

### [1.0.1](https://www.github.com/hensou/asdf-dotnet/compare/v1.0.0...v1.0.1) (2023-03-16)


### Bug Fixes

* wrong case on the dotnet_version variable ([b5c6d51](https://www.github.com/hensou/asdf-dotnet/commit/b5c6d512cf8444b61a41e313d87ee80cb7dd20c3))

## 1.0.1 (2022-04-27)


### Bug Fixes

* Add scripts to set DOTNET_ROOT env variable ([5cf95a5](https://github.com/hensou/asdf-dotnet/commit/5cf95a50477a052bbb440d2fb4657f6f6794b6ed))


## 1.0.0 (2022-04-27)


### Features

* Add scripts to set DOTNET_ROOT env variable ([45074c0](https://www.github.com/hensou/asdf-dotnet/commit/45074c0c65416db4f765818545aa7ca93656e2b0))
* Added suport for fish terminal ([927fb2d](https://www.github.com/hensou/asdf-dotnet/commit/927fb2d3a4f2715e8f5b04296de476061b6feaa4))
* Implements download and install features ([392575c](https://www.github.com/hensou/asdf-dotnet/commit/392575c7459c16441152a26f7979b4a9905ca9c1))
* Implements list-all feature ([fa8678b](https://www.github.com/hensou/asdf-dotnet/commit/fa8678b0203eb6c68403d126bc8add852c7d744a))


### Bug Fixes

* Correctly returns releases from dotnet ([f3128d0](https://www.github.com/hensou/asdf-dotnet/commit/f3128d0df4db0bf57b3b15ab9dfc8f927d20465d))
* Export the MSBuildSDKsPath env var when installation complete ([c9d407f](https://www.github.com/hensou/asdf-dotnet/commit/c9d407f6d6c963a6c77bcaa68cf4521b79c2313f))
* Force the shim to be created at the root of dotnet folder ([65b5b7a](https://www.github.com/hensou/asdf-dotnet/commit/65b5b7a8934c3e7f69b4d2aa6fc37d5ee04b2745))

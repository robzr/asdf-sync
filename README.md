<div align="center">

# asdf-sync [![Build](https://github.com/robzr/asdf-sync/actions/workflows/build.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/build.yml) [![Lint](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml)

[sync](https://github.com/robzr/asdf-sync) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add sync
# or
asdf plugin add sync https://github.com/robzr/asdf-sync.git
```

sync:

```shell
# Show all installable versions
asdf list-all sync

# Install specific version
asdf install sync latest

# Set a version globally (on your ~/.tool-versions file)
asdf global sync latest

# Now sync commands are available
asdf-sync --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/robzr/asdf-sync/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Rob Zwissler](https://github.com/robzr/)

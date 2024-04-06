<div align="center">

# asdf-sync [![Build](https://github.com/robzr/asdf-sync/actions/workflows/build.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/build.yml) [![Lint](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml)

`asdf sync` plugin for the [asdf version manager](https://asdf-vm.com) providing Semantic Versioning constraint support and more.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Usage](#usage)
- [Credits](#credits)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

If `asdf` works, so does this. All it needs is Bash v3 or newer.

# Install

Plugin:

```shell
asdf plugin add sync
# or
asdf plugin add sync https://github.com/robzr/asdf-sync.git
```

sync:

```shell
# asdf-sync has hooks to run via asdf
asdf sync help
```

# Usage

asdf-sync extends the functionality of [asdf](https://github.com/asdf-vm/asdf),
using the standard syntax [.tool-versions asdf config file](https://asdf-vm.com/manage/configuration.html#tool-versions),
with optional additional configuration embedeed in specially formatted comments
to provides the following functionality:
- automatically installs and updates any plugins by interpreting .tool-versions syntax
- can read standard format version constraints embeded in .tool-verisons comments
- can auto-update .tool-versions file, effectively using it as a version lockfile
- can read and use custom plugin URLs embedded in .tool-version comments

## Configuration

A standard syntax .tool-versions file is all that is needed for basic asdf-sync
functionality.
```
sver 1.2.0
terraform 1.5.7
terragrunt 0.51.5
```
Now, running `asdf sync` will ensure these plugins are installed.

## Version Constraint Interpretation

asdf is great, but there is no native format for intelligent version constraints.
Version constraints can be a power mechanism to enable automatic updates while
preventing breaking changes. If a program is versioned in accordance with
[Semantic Versioning](https://semver.org), it should be safe to simply follow
updates within the same major version, as SemVer specifies that breaking changes
necessitate a major version increase.
```
sver 1.2.0        # sync-constraint="~> v1.2, !pre"
terraform 1.5.7   # sync-constraint="~> v1.5, !pre"
terragrunt 0.51.5 # sync-constraint="~> v0.51.5, !pre"
```
Using a `sync-constraint="<constraint>"` token in .tool-versions will assign a
version constraint to a given package. Upon running `asdf sync`, the latest
versions matching the constraint will be determined, the .tool-versions file
will be updated accordingly, and the packages will automatically be installed.

## asdf Plugin URLs

If a plugin is not in [asdf plugin registry](https://github.com/asdf-vm/asdf-plugins),
the only way to install it is to manually specify the URL. Anyone running asdf
out of CI/CD, for example, will need to manually manage these plugin URLs,
and run `asdf plugin add <name> <url>` for each plugin. By using another token
embedded in .tool-versions comments, asdf-sync can take care of this
automatically.
```
sver 1.2.0        # sync-url=https://github.com/robzr/asdf-sver
terraform 1.5.7   # sync-constraint="~> v1.5, !pre" sync-url=https://github.com/blah/blah
terragrunt 0.51.5 # 
```

## asdf Plugin refs

Although not yet supported by asdf, the `sync-ref=<ref>` token can also be
used to override a default plugin git ref.
```
sver 1.2.0        # sync-url=https://github.com/robzr/asdf-sver sver-ref=development
terraform 1.5.7   # sync-constraint="~> v1.5, !pre" sync-url=https://github.com/blah/blah
terragrunt 0.51.5 # 
```

## Help!

At any time, just run `asdf sync help` for detailed usage instructions.

# Credits

- asdf-sync was inspired by Nicholas Christopher's
[syncher](https://github.com/nwillc/syncher/tree/master) program.
- My [sver](https://github.com/robzr/sver) embeddable Semantic Version utility
library is embedded in, and used by asdf-sync.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/robzr/asdf-sync/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Rob Zwissler](https://github.com/robzr/)

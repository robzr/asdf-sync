<div align="center">

# asdf-sync [![Build](https://github.com/robzr/asdf-sync/actions/workflows/build.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/build.yml) [![Lint](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml/badge.svg)](https://github.com/robzr/asdf-sync/actions/workflows/lint.yml)

`asdf sync` plugin for the [asdf version manager](https://asdf-vm.com) providing Semantic Versioning constraint support and more.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Usage](#usage)
- [GitHub Action](#github-action)
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

That's it!

# Usage

`asdf sync` runs exclusively as an asdf extension command, and extends the
functionality of [asdf](https://github.com/asdf-vm/asdf) by automatically
installing plugins, interpreting version constraints to auto-update 
.tool-versions, and adds the ability to specify plugin URLs and refs in
the .tool-versions file.

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

asdf is great, but there is no native syntax for version constraints, which can
be a powerful mechanism to enable automatic updates while preventing breaking
changes. If a program is versioned in accordance with
[Semantic Versioning](https://semver.org), it should be safe to simply follow
updates within the same major version, as SemVer specifies that breaking changes
require a major version increment.
```
sver 1.2.0        # sync-constraint="~> v1.2, !pre"
terraform 1.5.7   # sync-constraint="~> v1.5, !pre"
terragrunt 0.51.5 # sync-constraint="~> v0.51.5, !pre"
```
Using a `sync-constraint="<constraint>"` token in .tool-versions will assign a
version constraint to a given package. Upon running `asdf sync`, the latest
versions matching the constraint will be determined, and the .tool-versions file
will be updated accordingly. The double quotes are optional, but needed if the
constraint contains any whitespace.

Typically after this, you will also want to run `asdf install` to install the new
versions.

## asdf Plugin URLs

If a plugin is not in [asdf plugin registry](https://github.com/asdf-vm/asdf-plugins),
the only way to install it is to manually specify the URL. Anyone running asdf
out of CI/CD, for example, will need to manually manage these plugin URLs,
and run `asdf plugin add <name> <url>` for each plugin. By using another token
embedded in .tool-versions comments, asdf-sync can take care of this
automatically.
```
sver 1.2.0        # sync-url=https://github.com/robzr/asdf-sver
terraform 1.5.7   # sync-constraint="~> v1.5, !pre" sync-url="https://github.com/blah/blah"
```

## asdf Plugin refs

The `sync-ref=<ref>` token can also be used to override the default plugin git ref.
```
sver 1.2.0        # sync-url=https://github.com/robzr/asdf-sver sver-ref=development
terraform 1.5.7   # sync-ref="dev/new_plugins"
```

## Help!

At any time, just run `asdf sync help` for detailed usage instructions.

# GitHub Action

A composite GitHub action exists, which can be called from workflows, and will
take care of installing `asdf`, installing `asdf-sync`, running `asdf sync`,
and running `asdf install. It incorporates caching, and the default behavior
will simply run previously installed tools out of the cache, unless a change
in `.tool-versions` is detected.

Usage is simple, just make sure you checkout your own repo first, so it can read
your `.tool-versions`.
```
    steps:
      - uses: actions/checkout@v4

      - uses: robzr/asdf-sync@v0.4
```

See [action.yaml](action.yaml) for advanced usage options.

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

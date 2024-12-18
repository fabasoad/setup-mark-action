# Setup mark action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-mark-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-mark-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-mark-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-mark-action/actions/workflows/linting.yml/badge.svg)

This action installs [mark](https://github.com/kovetskiy/mark) CLI tool.

Supported OS: Linux and macOS.

## Prerequisites

The following tools have to be available on a runner prior using this GitHub
action:

- [curl](https://curl.se/)
- [tar](https://www.gnu.org/software/tar/)

## Inputs

```yaml
- uses: fabasoad/setup-mark-action@v1
  with:
    # (Optional) mark version. Defaults to "latest".
    version: "11.3.0"
```

## Outputs

None.

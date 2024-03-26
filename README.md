# Setup mark action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-mark-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-mark-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-mark-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-mark-action/actions/workflows/linting.yml/badge.svg)

This action installs [mark](https://github.com/kovetskiy/mark) CLI tool.

Supported OS: Linux and macOS.

## Inputs

<!-- prettier-ignore-start -->
| Name    | Required | Description                                                                                 | Default  |
|---------|----------|---------------------------------------------------------------------------------------------|----------|
| version | No       | Version of `mark` tool that can be found [here](https://github.com/kovetskiy/mark/releases) | `9.11.1` |
<!-- prettier-ignore-end -->

## Example usage

### Workflow configuration

```yaml
name: Test

on: push

jobs:
  setup:
    name: Print version
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: fabasoad/setup-mark-action@main
      - name: Run command
        run: mark --version
```

### Result

```shell
Run mark --version
mark version 9.11.1
```

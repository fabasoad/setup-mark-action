# Setup mark action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-mark-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-mark-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-mark-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-mark-action/actions/workflows/linting.yml/badge.svg)

This action installs [mark](https://github.com/kovetskiy/mark) CLI tool.

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :x:                |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Prerequisites

None.

## Inputs

```yaml
- uses: fabasoad/setup-mark-action@v1
  with:
    # (Optional) mark version. Defaults to "latest".
    version: "11.3.0"
    # (Optional) If "false" skips installation if mark is already installed.
    # If "true" installs mark in any case. Defaults to "false".
    force: "false"
    # (Optional) GitHub token that is used to send requests to GitHub API such
    # as downloading asset. Defaults to the token provided by GitHub Actions
    # environment.
    github-token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                       | Example |
|-----------|-----------------------------------|---------|
| installed | Whether mark was installed or not | `true`  |
<!-- prettier-ignore-end -->

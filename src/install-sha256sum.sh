#!/usr/bin/env sh

install_sha256sum() {
  echo "::group::Installing sha256sum"
  if [ "${RUNNER_OS}" = "macOS" ]; then
    brew install coreutils
  fi
  echo "::endgroup::"
}

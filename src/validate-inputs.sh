#!/usr/bin/env sh

# Validates value to be a valid semver string.
# Parameters:
# 1. (Required) Param name to display it correctly in the error message for the
#    users.
# 2. (Required) Param value that will be validated.
#
# Usage examples:
# check_semver "my-valid-semver-1" "1.2.3"
# check_semver "my-valid-semver-3" "latest"
# check_semver "my-invalid-semver" "1.2.3-rc1"
check_semver() {
  if ! echo "${2}" | grep -Eq '^(latest|[0-9]+(\.[0-9]+){0,2})$'; then
    msg="\"${1}\" parameter is invalid. \"${2}\" is not a valid semver."
    echo "::error title=Invalid parameter::${msg}"
    exit 30
  fi
}

main() {
  input_version="${1}"

  check_semver "version" "${input_version}"
}

main "$@"

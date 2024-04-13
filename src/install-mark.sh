#!/usr/bin/env sh

mark_version="$1"

# shellcheck disable=SC2039
if command -v mark >/dev/null 2>&1; then
  msg="$(mark --version) is already installed. Skipping installation."
  printf "[setup-mark-action] %s level=info %s\n" "$(date +'%Y-%m-%d %T')" "${msg}"
  exit 0
fi

if [ "${mark_version}" = "latest" ]; then
  url_prefix="https://github.com/kovetskiy/mark/releases/latest/download"
else
  url_prefix="https://github.com/kovetskiy/mark/releases/download/${mark_version}"
fi

url=""
if [ "${RUNNER_OS}" = "macOS" ]; then
  if [ "${RUNNER_ARCH}" = "X64" ]; then
    url="${url_prefix}/mark_Darwin_x86_64.tar.gz"
  elif [ "${RUNNER_ARCH}" = "ARM64" ]; then
    url="${url_prefix}/mark_Darwin_arm64.tar.gz"
  fi
elif [ "${RUNNER_OS}" = "Linux" ]; then
  if [ "${RUNNER_ARCH}" = "X64" ]; then
    url="${url_prefix}/mark_Linux_x86_64.tar.gz"
  elif [ "${RUNNER_ARCH}" = "ARM64" ]; then
    url="${url_prefix}/mark_Linux_arm64.tar.gz"
  fi
fi

if [ -z "${url}" ]; then
  echo "::error title=OS is not supported::${RUNNER_OS} ${RUNNER_ARCH} is not supported"
  exit 1
fi

bin_path="${RUNNER_TEMP}/bin"
mkdir -p "${bin_path}"
tar_path="${bin_path}/mark.tar.gz"
checksums_path="${bin_path}/checksums.txt"
curl -sL "${url}" -o "${tar_path}"
curl -sL "${url_prefix}/checksums.txt" -o "${checksums_path}"

#if ! command -v sha256sum >/dev/null 2>&1; then
#  echo "::group::Installing sha256sum"
#  if [ "${RUNNER_OS}" = "macOS" ]; then
#    brew install coreutils
#  else
#    msg="sha256sum was not installed on the current ${RUNNER_OS} machine"
#    printf "[setup-mark-action] %s level=warn %s\n" "$(date +'%Y-%m-%d %T')" "${msg}"
#  fi
#  echo "::endgroup::"
#fi

if ! grep -qF "$(shasum -a 256 "${tar_path}" | cut -d ' ' -f 1)" "${checksums_path}"; then
  echo "::error title=Checksum error::Checksum is different from the downloaded binary"
  exit 1
fi

tar -xf "${tar_path}" -C "${bin_path}"
rm -f "${tar_path}"
echo "${bin_path}" >> "$GITHUB_PATH"

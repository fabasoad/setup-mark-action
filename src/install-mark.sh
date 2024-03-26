#!/usr/bin/env sh

mark_version="$1"

# shellcheck disable=SC2039
if command -v mark &> /dev/null; then
  msg="$(mark --version) is already installed. Skipping installation."
  printf "[setup-mark-action] %s level=info %s\n" "$(date +'%Y-%m-%d %T')" "${msg}"
  exit 0
fi

url=""
if [ "${RUNNER_OS}" = "macOS" ]; then
  if [ "${RUNNER_ARCH}" = "X64" ]; then
    url="https://github.com/kovetskiy/mark/releases/download/${mark_version}/mark_Darwin_x86_64.tar.gz"
  elif [ "${RUNNER_ARCH}" = "ARM64" ]; then
    url="https://github.com/kovetskiy/mark/releases/download/${mark_version}/mark_Darwin_arm64.tar.gz"
  fi
elif [ "${RUNNER_OS}" = "Linux" ]; then
  if [ "${RUNNER_ARCH}" = "X64" ]; then
    url="https://github.com/kovetskiy/mark/releases/download/${mark_version}/mark_Linux_x86_64.tar.gz"
  elif [ "${RUNNER_ARCH}" = "ARM64" ]; then
    url="https://github.com/kovetskiy/mark/releases/download/${mark_version}/mark_Linux_arm64.tar.gz"
  fi
fi

if [ -z "${url}" ]; then
  echo "::error title=OS is not supported::${RUNNER_OS} ${RUNNER_ARCH} is not supported"
  exit 1
fi

bin_path="${RUNNER_TEMP}/bin"
mkdir -p "${bin_path}"
tar_path="${bin_path}/mark.tar.gz"
curl -sL "${url}" -o "${tar_path}"
tar -xf "${tar_path}" -C "${bin_path}"
rm -f "${tar_path}"
echo "${bin_path}" >> "$GITHUB_PATH"

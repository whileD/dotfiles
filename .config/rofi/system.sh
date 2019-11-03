#!/bin/bash

set -euCo pipefail

declare -Ar menu=(
  ["look"]="i3lock-next"

  ["reboot"]="systemctl reboot"
  ["suspend"]="systemctl suspend"
  ["shutdown"]="systemctl poweroff"
)

function main() {
  # 区切り文字の変更
  local -r IFS=$'\n'

  [[ $# -ne 0 ]] && eval "${menu[$1]}" || echo "${!menu[*]}"
}

main $@

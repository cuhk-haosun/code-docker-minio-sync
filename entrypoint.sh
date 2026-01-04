#!/usr/bin/env bash
set -euo pipefail

insecure_option=""
if [[ "${YA_INSECURE:-false}" == "true" ]]; then
  insecure_option="--insecure"
fi

recursive_option=""
if [[ "${YA_RECURSIVE:-false}" == "true" ]]; then
  recursive_option="--recursive"
fi

mc alias set ${insecure_option:+"$insecure_option"} target "$YA_ENDPOINT" "$YA_ACCESS_KEY" "$YA_SECRET_KEY"

case "${YA_DIRECTION:-download}" in
  download)
    mc ${insecure_option:+"$insecure_option"} cp ${recursive_option:+"$recursive_option"} "target/$1" "$2"
    ;;
  upload)
    mc ${insecure_option:+"$insecure_option"} cp ${recursive_option:+"$recursive_option"} "$2" "target/$1"
    ;;
  *)
    echo "Error: Unknown YA_DIRECTION value '${YA_DIRECTION:-}'. Use 'download' or 'upload'."
    exit 1
    ;;
esac

mc ls -r "target/$1"

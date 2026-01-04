#!/bin/sh -l

insecure_option=""
if [[ "$YA_INSECURE" == "true" ]]; then
  insecure_option="--insecure"
fi

recursive_option=""
if [[ "$YA_RECURSIVE" == "true" ]]; then
  recursive_option="--recursive"
fi

mc alias set ${insecure_option:+"$insecure_option"} target "$YA_ENDPOINT" "$YA_ACCESS_KEY" "$YA_SECRET_KEY"

# Switch behavior based on YA_DIRECTION variable
if [[ "$YA_DIRECTION" == "download" ]]; then
  mc ${insecure_option:+"$insecure_option"} cp ${recursive_option:+"$recursive_option"} "target/$1" "$2"
elif [[ "$YA_DIRECTION" == "upload" ]]; then
  mc ${insecure_option:+"$insecure_option"} cp ${recursive_option:+"$recursive_option"} "$2" "target/$1"
else
  echo "Error: Unknown YA_DIRECTION value. Use 'download' or 'upload'."
  exit 1
fi
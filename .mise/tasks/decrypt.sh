#!/usr/bin/env bash
#MISE description="Decrypt a file with sops"
set -e

ENC_FILE=$1

# Check if ENC_FILE is provided
if [ -z "$1" ]; then
  echo "Error: file not specified"
  echo "Usage: mise run encrypt path/to/file.dec.yaml"
  exit 1
fi

# Check if the file exists
if [ ! -f "${ENC_FILE}" ]; then
  echo "Error: file not found"
  exit 1
fi

# Create the output filename with proper quoting
DEC_FILE="${ENC_FILE//.enc/.dec}"

# Decrypt the file
sops --decrypt "${ENC_FILE}" > "${DEC_FILE}"

echo "Decrypted ${ENC_FILE} to ${DEC_FILE}"
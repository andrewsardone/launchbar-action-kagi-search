#!/usr/bin/env bash
#
# LaunchBar Action Script for a simple kagi.com search

# Snagged from a basic ChatGPT prompt:
# https://chat.openai.com/share/165098f1-aa89-4400-8f63-1f33d6c14cf8
# I did need to fix a bug. The original `urlencode` function was only grabbing
# the first parameter of the function.
urlencode() {
  local string="$@"
  local encoded=""
  local i

  for ((i = 0; i < ${#string}; i++)); do
    local char="${string:$i:1}"
    case "$char" in
      [a-zA-Z0-9.~_-])
        encoded+="$char"
        ;;
      *)
        encoded+="%$(printf "%02X" "'$char")"
        ;;
    esac
  done

  echo "$encoded"
}

url_encoded_input=$(urlencode "$@")
open "https://kagi.com/search?q=$url_encoded_input"

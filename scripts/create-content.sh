#!/bin/bash

# Script for generating random data of a specific amount and putting it into a file

while true; do
  echo "Please enter a filename you wish the output to be directed to:"
  read filename

  if [[ -z "$filename" ]]; then
    echo "Filename cannot be empty. Please try again."
  elif [[ -e "$filename" ]]; then
    echo "File '$filename' already exists. Please choose a different filename."
  else
    break
  fi
done

while true; do
  echo "How many bytes would you like the file to be?"
  read byte_amount

  if ! [[ "$byte_amount" =~ ^[0-9]+$ ]]; then
    echo "Amount must be an integer greater than 0. Please try again."
  elif [[ "$byte_amount" -le 0 ]]; then
    echo "Amount must be greater than 0. Please try again."
  else
    break
  fi
done

# Generate random data
random_data=$(dd if=/dev/urandom bs="$byte_amount" count=1 2>/dev/null | tr -cd '[:print:]')

echo -n "$random_data" > "$filename"

echo "Data has been written to $filename - operation finished"
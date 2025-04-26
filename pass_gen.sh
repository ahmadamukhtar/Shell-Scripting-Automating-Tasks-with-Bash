#!/bin/bash

# Password generation script

# Prompt the user for the desired password length
read -p "Enter the desired password length: " password_length

# Check if the entered length is a valid number
if ! [[ "$password_length" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Generate a random password using /dev/urandom, and filter alphanumeric and special characters
password=$(< /dev/urandom tr -dc 'A-Za-z0-9@#$%^&*()_+=' | head -c "$password_length")

# Print the generated password
echo "Generated Password: $password"


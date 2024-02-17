#!/bin/bash

# Read configuration from JSON file
config="config.json"

# Extract values from JSON
config_file=$(jq -r '.config_file' "$config")
username=$(jq -r '.username' "$config")
password=$(jq -r '.password' "$config")
enable_2fa=$(jq -r '.enable_2fa' "$config")
key=$(jq -r '.key' "$config")

# Check if 2FA is enabled
if [ "$enable_2fa" == "true" ]; then
    # If 2FA is enabled, calculate 2FA code based on current time
    twofa_code=$(oathtool --totp --base32 "$key")
    
    # Append 2FA code to the password
    password="${password}${twofa_code}"
fi

# Connect to OpenVPN
echo -e "$username\n$password" | sudo openvpn --config "$config_file" --auth-user-pass /dev/stdin



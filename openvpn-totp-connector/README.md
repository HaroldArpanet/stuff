# This section contains the sctipts that allow you connect to a openvpn server with totp protection in password section
## Any config store in a file with name config.json

## Dependencies
    - oath-toolkit
    - jq

## Make config file: `config.json`
```
{
  "config_file": "sample-for-linux.ovpn",
  "username": "sample-username",
  "password": "sample-main-password",
  "enable_2fa": true, # Option if false the openvpn just connect with main password
  "key": "sample-totp-token-in-base32"
}
```

## At the end just run:
```
sudo bash connect.sh
```

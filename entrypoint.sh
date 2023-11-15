#!/bin/sh
# Start the WireGuard interface
wg-quick up /etc/wireguard/wg0.conf

# Check if the WireGuard interface is up and running
if [ $? -ne 0 ]; then
    echo "Failed to bring up WireGuard interface."
    exit 1
fi

# Execute the gost command with the passed environment variables
exec ./gost -L=${GOST_USER}:${GOST_PASS}@${GOST_HOST}:${GOST_PORT}

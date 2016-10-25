#!/bin/bash
echo "[+] Connecting to streisand OpenConnect..."
CURRENT_IP="$(curl icanhazip.com)"
echo "[+] Current IP: ${CURRENT_IP}"
openconnect --cafile ca-cert.pem --certificate /Users/Centauri/Documents/streisand/openconnect/client.p12 --key-password 'milliners-undauntednesses' --pfs 178.62.202.182:4443
sleep 15
NEW_IP="$(curl icanhazip.com)"
echo "[+] New IP: ${NEW_IP}"
echo "[+] Connected"


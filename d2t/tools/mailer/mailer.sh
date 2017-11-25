#!/bin/bash
curl "$(cat config/server.txt)?to=$(cat config/emailaddr.txt)"
echo "[+] Warning message sent to: $(cat config/emailaddr.txt)"
echo ""
exit

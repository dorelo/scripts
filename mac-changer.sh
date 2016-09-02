#!/bin/bash
# dorelo 2016
CURRENT="$(ifconfig en0 |grep ether)"
echo "Current MAC : ${CURRENT}"
/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/./0/2; s/.$//')
networksetup -detectnewhardware
NEW="$(ifconfig en0 |grep ether)"
echo "New MAC     : ${NEW}"

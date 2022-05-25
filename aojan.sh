#!/bin/bash

rm -f web config.json
wget -N https://raw.githubusercontent.com/yuiosa/aAX/main/web
chmod +x ./web

if [[ -z $id ]]; then
    id="1eb6e917-774b-4a84-aff6-b058577c60a5"
fi

cat <<EOF > ~/config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "592c5fd3-20b0-41ce-8010-b5baf4ee0d62"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/wsg"
                 }   
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

./web -config=config.json

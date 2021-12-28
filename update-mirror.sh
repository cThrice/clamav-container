#!/bin/sh
# vim:sw=4:ts=4:et

set -e

CVD_DIR=/usr/share/nginx/html

if [ ! -e $CVD_DIR/config.json ]; then
    echo "Missing CVD configuration. Creating..."
    /usr/local/bin/cvd config set --config $CVD_DIR/config.json --dbdir $CVD_DIR/databases --logdir $CVD_DIR/logs
    echo "CVD configuration created..."
fi

echo "Updating ClamAV Database..."
/usr/local/bin/cvd update --config $CVD_DIR/config.json
echo "ClamAV Database updated..."

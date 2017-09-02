#!/bin/sh
set -e

echo "[I] Setting file permissions."
chown root:root ./conf/config.inc.php
chmod +r ./conf/config.inc.php

echo "[I] Entrypoint tasks complete. Starting Self Service Password."
exec "$@"

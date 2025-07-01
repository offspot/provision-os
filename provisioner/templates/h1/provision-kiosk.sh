#!/bin/sh
set -e

# TODO: handle properly
# wait a few seconds for network to be up
echo "Starting up..."
sleep 3

/usr/local/lib/provision-env/bin/provisioner
ret=$?

if [[ $ret -neq 0 ]] then
  echo "Hotspot Provioner exited with status=${ret}."
  read -p "Press ENTER when ready to halt." </dev/tty
fi
systemctl halt

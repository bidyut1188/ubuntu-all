#!/bin/bash -x 
set -e

# Check sudo priv.
# Do not require sudo when already root
if [ "$(id -u)" = 0 ]; then
	SUDO=
else
	SUDO=sudo
fi

# Do not require sudo with android
if [ "$(uname -o)" = Android ]; then
	SUDO=
else
	SUDO=sudo
fi

echo "UBUNTU-ALL made by proot"
sleep 3
echo "Trying update..."
$SUDO apt update
echo "Trying install proot..."
$SUDO apt install proot -y

for ver in 0.1 0.3 0.7 1.1 1.3 1.4 1.5; do
	cd ubuntu-in-termux-$ver
	bash ubuntu.sh
	cd ..
done


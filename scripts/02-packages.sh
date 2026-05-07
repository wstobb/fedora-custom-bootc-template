#!/bin/bash

set -ouex pipefail

if [ -s "/build/config/install_packages.list" ]; then
	dnf install -y $(tr '\n' ' ' < /build/config/install_packages.list)
fi

if [ -s "/build/config/remove_packages.list" ]; then
	dnf remove -y $(tr '\n' ' ' < /build/config/remove_packages.list)
fi

if [ -s "/build/config/swap_packages.list" ]; then
	while IFS= read -r entry; do
		dnf swap -y $entry
	done < /build/config/swap_packages.list
fi
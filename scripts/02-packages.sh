#!/bin/bash

set -ouex pipefail

if [ -s "/ctx/config/install_packages.list" ]; then
	dnf install -y $(tr '\n' ' ' < /ctx/config/install_packages.list)
fi

if [ -s "/ctx/config/remove_packages.list" ]; then
	dnf remove -y $(tr '\n' ' ' < /ctx/config/remove_packages.list)
fi
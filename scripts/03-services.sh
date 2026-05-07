#!/bin/bash

set -ouex pipefail

if [ -s "/build/config/enable_services.list" ]; then
	systemctl enable $(tr '\n' ' ' < /build/config/enable_services.list)
fi

if [ -s "/build/config/disable_services" ]; then
	systemctl disable $(tr '\n' ' ' < /build/config/disable_services.list)
fi
#!/bin/bash

set -ouex pipefail

# Copy system root to container
cp -rv /ctx/sys_root/* /

/ctx/scripts/01-repos.sh
/ctx/scripts/02-packages.sh
/ctx/scripts/03-services.sh
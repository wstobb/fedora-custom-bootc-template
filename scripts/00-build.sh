#!/bin/bash

set -ouex pipefail

# Copy system root to container
cp -rv /build/sys_root/* /

/build/scripts/01-repos.sh
/build/scripts/02-packages.sh
/build/scripts/03-services.sh
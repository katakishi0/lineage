#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs

echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/katakishi0/local_manifests --depth 1 -b 11.0 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Katakishi
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_channel-ap2a-userdebug
echo "============="

# Build rom
mka bacon
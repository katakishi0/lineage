#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android.git -b 11.0 -g default,-mips,-darwin,-notdefault

echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/katakishi0/local_manifest --depth 1 -b main .repo/local_manifests
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
lunch lineage_channel-userdebug
echo "============="

# Build rom
mka bacon

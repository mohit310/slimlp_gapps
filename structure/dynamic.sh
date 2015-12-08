#!/sbin/sh

# PrebuiltGmsCore
cp -rf /tmp/PrebuiltGmsCore/arm/* /system

# SetupWizard
cp -rf /tmp/SetupWizard/phone/* /system

# LatinIME swypelib
cp -rf /tmp/LatinIME_swypelib/lib/* /system/lib

# FaceLock #zero
cp -rf /tmp/FaceLock/arm/* /system #zero

# Velvet #zero
cp -rf /tmp/Velvet/arm/* /system #zero

exit 0

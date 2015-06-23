#!/sbin/sh

# PrebuiltGmsCore
# COPY 430 (ARM VERSION) TO SYSTEM
cp -af /tmp/PrebuiltGmsCore/430/* /system
cp -af /tmp/PrebuiltGmsCore/arm/* /system

# Swypelib
cp -af /tmp/Swypelib/lib/* /system/lib

# FaceLock #zero
cp -af /tmp/FaceLock/arm/* /system #zero
# Velvet #zero
cp -af /tmp/Velvet/arm/* /system #zero
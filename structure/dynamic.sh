#!/sbin/sh

# PrebuiltGmsCore
# COPY 430 (ARM VERSION) TO SYSTEM
cp -af /tmp/PrebuiltGmsCore/430/* /system
cp -af /tmp/PrebuiltGmsCore/arm/* /system
# Swypelib
cp -af /tmp/Swypelib/lib/* /system/lib
cp -af /tmp/FaceLock/arm/* /system #mini
# Velvet #mini
cp -af /tmp/Velvet/arm/* /system #mini
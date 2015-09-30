#!/sbin/sh

# PrebuiltGmsCore
cp -af /tmp/PrebuiltGmsCore/arm/* /system

# Swypelib
cp -af /tmp/Swypelib/lib/* /system/lib

# FaceLock #zero
cp -af /tmp/FaceLock/arm/* /system #zero
cp -af /tmp/FaceLock/vendor/* /system/vendor #zero

# Velvet #zero
cp -af /tmp/Velvet/usr/* /system/usr #zero
cp -af /tmp/Velvet/arm/* /system #zero

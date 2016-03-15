#!/sbin/sh

# PrebuiltGmsCore
cp -rf /tmp/PrebuiltGmsCore/arm/* /system

# SetupWizard
cp -rf /tmp/SetupWizard/phone/* /system

# LatinIME swypelib
cp -rf /tmp/LatinIME_swypelib/lib/* /system/lib
mkdir -p /system/app/LatinIME/lib/arm
ln -s /system/lib/libjni_latinime.so /system/app/LatinIME/lib/arm/libjni_latinime.so
ln -s /system/lib/libjni_latinimegoogle.so /system/app/LatinIME/lib/arm/libjni_latinimegoogle.so

# libfrsdk
cp -rf /tmp/libfrsdk/arm/* /system

# FaceLock #zero
cp -rf /tmp/FaceLock/arm/* /system #zero
mkdir -p /system/app/FaceLock/lib/arm #zero
ln -s /system/lib/libfacelock_jni.so /system/app/FaceLock/lib/arm/libfacelock_jni.so #zero

# Velvet #zero
cp -rf /tmp/Velvet/arm/* /system #zero

exit 0
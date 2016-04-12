#!/sbin/sh
# 
# /system/addon.d/80-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
@file.list@
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Re-remove conflicting apks
    rm -rf /system/app/PartnerBookmarksProvider
    rm -rf /system/app/PicoTts
    rm -rf /system/app/Provision
    rm -rf /system/app/QuickSearchBox
    rm -rf /system/priv-app/PartnerBookmarksProvider
    rm -rf /system/priv-app/PicoTts
    rm -rf /system/priv-app/Provision
    rm -rf /system/priv-app/QuickSearchBox
    mkdir -p /system/app/FaceLock/lib/arm #zero
    ln -s /system/lib/libfacelock_jni.so /system/app/FaceLock/lib/arm/libfacelock_jni.so #zero
    mkdir -p /system/app/LatinIME/lib/arm
    ln -s /system/lib/libjni_latinime.so /system/app/LatinIME/lib/arm/libjni_latinime.so
    ln -s /system/lib/libjni_latinimegoogle.so /system/app/LatinIME/lib/arm/libjni_latinimegoogle.so
  ;;
esac

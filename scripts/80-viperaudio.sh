#!/sbin/sh
#
# Script: /system/addon.d/80-viperaudio.sh
# This addon.d script restores Viper4Android after doing a dirty ROM flash:

. /tmp/backuptool.functions

list_files() {
cat << EOF
etc/audio_effects.conf
etc/audio_policy.conf
priv-app/Viper4Android/ViPER4Android_FX.apk
vendor/etc/audio_effects.conf
vendor/lib/libgnustl_shared.so
lib/soundfx/libv4a_fx_ics.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # remove conflicting apps
    rm /system/priv-app/AudioFX/AudioFX.apk
  ;;
  post-restore)
    # Stub
  ;;
esac

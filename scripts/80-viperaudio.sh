#!/sbin/sh
#
# Script: /system/addon.d/80-viperaudio.sh
# This addon.d script restores MaxAudioFX after doing a dirty ROM flash:

. /tmp/backuptool.functions

list_files() {
cat << EOF
etc/audio_effects.conf
etc/audio_policy.conf
priv-app/Viper4Android/ViPER4Android_FX.apk
vendor/etc/audio_effects.conf
vendor/lib/libgnustl_shared.so
vendor/lib/libMA3-wavesfx-Coretex_A9.so
vendor/lib/libMA3-wavesfx-Qualcomm.so
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
    rm /system/priv-app/AudioFX/AudioFX.apk
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
    # Stub
  ;;
esac

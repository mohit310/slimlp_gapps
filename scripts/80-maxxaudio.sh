#!/sbin/sh
#
# Script: /system/addon.d/80-maxxaudio.sh
# This addon.d script restores MaxAudioFX after doing a dirty ROM flash:

. /tmp/backuptool.functions

list_files() {
cat << EOF
etc/waves/default.mps
priv-app/MaxxAudioFX/MaxxAudioFX.apk
vendor/etc/audio_effects.conf
vendor/lib/soundfx/libmaxxeffect-cembedded.so
vendor/lib/soundfx/libqcbassboost.so
vendor/lib/soundfx/libqcreverb.so
vendor/lib/soundfx/libqcvirt.so
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

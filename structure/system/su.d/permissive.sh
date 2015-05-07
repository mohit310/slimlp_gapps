su
mount -o remount,rw /system
mkdir -p /system/su.d
echo "#!/system/bin/sh" > /system/su.d/permissive.sh
echo "setenforce 0" > /system/su.d/permissive.sh
echo "0" > /sys/fs/selinux/enforce
chmod 755 /system/su.d/permissive.sh

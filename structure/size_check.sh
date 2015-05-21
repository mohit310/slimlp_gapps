#!/sbin/sh

spaceFileName=/tmp/apps_space.prop

# get file descriptor for output
OUTFD=$(ps | grep -v grep | grep -oE "update-binary(.*)" | cut -d " " -f 3)

# same as ui_print command in updater_script, for example:
#
# ui_print "hello world!"
#
# will output "hello world!" to recovery, while
#
# ui_print
#
# outputs an empty line

ui_print() {
    if [ "$OUTFD" != "" ]; then
        echo "ui_print ${1} " 1>&$OUTFD;
        echo "ui_print " 1>&$OUTFD;
    else
        echo "${1}";
    fi;
}


sumZip=0
sumSystem=0

while read filePathSize
do
  fileName=`echo $filePathSize | awk '{split($0,a,":"); print a[1]}'`
  fileSize=`echo $filePathSize | awk '{split($0,a,":"); print a[2]}'`
  if [ -e $fileName ]; then
    sizeInKBytes=`du -sk $fileName | awk 'END{print $1}'`
    sumSystem=`/sbin/dc $sumSystem $sizeInKBytes + p`
  fi
  sumZip=`/sbin/dc $sumZip $fileSize + p`
done < $spaceFileName
totalSize=`/sbin/dc $sumSystem $sumZip - p`
if [ "0" -gt "$totalSize" ]; then
 totalSize=`/sbin/dc $totalSize -1 mul p`
fi
#add 1MB for buffer because of script
totalSize=`/sbin/dc $totalSize 1000 + p`
freeSpace=`df -k /system | awk 'END{ print $3}'`
ui_print "FreeSpace(KB): $freeSpace TotalGappsSize(KB):$totalSize"
failed=0
if [ "$freeSpace" -ge "$totalSize" ]; then
 ui_print "Space available"
else
 ui_print "Space not available-Aborting"
 failed=1
fi
echo "ro.gapps.install.failed=$failed" >> /tmp/build.prop

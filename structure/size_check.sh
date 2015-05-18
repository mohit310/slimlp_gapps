#!/sbin/sh

spaceFileName=apps.space.properties

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
echo "FreeSpace(KB): $freeSpace TotalGappsSize(KB):$totalSize"
failed=0
if [ "$freeSpace" -ge "$totalSize" ]; then
 echo "Space available"
else
 echo "Space not available-Aborting"
 failed=1
fi
echo "ro.gapps.install.failed=$failed" >> /tmp/build.prop
exit 0

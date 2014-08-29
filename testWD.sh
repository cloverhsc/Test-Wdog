#!/bin/bash
touch /rooti/nasroot
declare -i mega=0
declare -i count=0
echo `date +"%Y %m %d %H:%M"` >>/var/log/wdog.log
echo "hwdog init start" >>/var/log/wdog.log
hwdog init
for ((;;))
do
sleep 120
hwdog clear
echo `date +"%Y %m %d %H:%M"` >>/var/log/wdog.log
echo "hwdog clear !" >>/var/log/wdog.log

mega=`ls /var/log/wdog.log -l |awk '{print $5}'`
#if log file's content over 1M , will change name.
if [ "$mega" -gt "1000000" ];then
        `mv /var/log/wdog.log /var/log/wdog$count.log`
        count=$(( $count + 1 ))
fi
done

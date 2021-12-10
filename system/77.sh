#!/bin/bash
tekegram_id="96500923"
telegram_msg="Reboot CM"
reboot_str=`echo -n "$3"| xxd -r -p`
reboot_file=/storage/RebootTimer.txt
#Проверка существования файла
if [ ! -f $reboot_file ]; then
echo "1" > $reboot_file
fi

reboot_timer=`head -1 $reboot_file`
reboot_number=2160 #через сколько таймеров перезагружка 1таймер = 20 минут
#echo $reboot_str

#добавляем счетчик
if [ "$reboot_str" = "IncrementTimer" ]; then
	#счетчик при каждом запуске файла
	reboot_timer=$((reboot_timer+1))
	echo $reboot_timer> $reboot_file
fi
#cat ${reboot_file}

if [ "$reboot_str" = "RebootCM" ]; then	
	if [ $reboot_timer -ge  $reboot_number ]; then
	echo "1" > $reboot_file	
	wget -q  -O - "http://tg.smart48.ru/tg.php?bot=Smart48&chat_id=tekegram_id&text=telegram_msg" 	

	#перечисляем какие СМ надо перегрузить.
	cd /home/sh2/update;./updater c9 175 updater \& \(sleep 2\; kill \$\{\!\}\)\;
	cd /home/sh2/update;./updater c9 508 updater \& \(sleep 2\; kill \$\{\!\}\)\;
	cd /home/sh2/update;./updater c9 563 updater \& \(sleep 2\; kill \$\{\!\}\)\;
	cd /home/sh2/update;./updater c9 571 updater \& \(sleep 2\; kill \$\{\!\}\)\;
	cd /home/sh2/update;./updater c9 585 updater \& \(sleep 2\; kill \$\{\!\}\)\;
	cd /home/sh2/update;./updater c9 586 updater \& \(sleep 2\; kill \$\{\!\}\)\;	

	fi
fi

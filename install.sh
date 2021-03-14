#!/bin/bash
#Smart48.ru Telegram bot v2.0
#Данный скрип сделан для отправки уведомлений в телеграм бот @Smart48_bot  на Cuarm3, Cuarm5M
#Для работы вам нужно подписаться на бота @Smart48_bot и узнать Ваш id
#
#Добавлено:
#1.Автоматическая установка всех компонентов
#2.Возможность отправки в бот скриншота с камер внедренных в систему Mimismart (протестирован rtsp поток)
#3.Возможность записывания видио продолжительностью до 60 секунд (больше не тестировали) и отправки его

#Установка
#Закачать файл 90.sh в папку /home/sh2/ext
#Установить права на запуск выполнив команду chmod +x 90.sh
#Запустить ./install.sh install - если у Вас cuarm5, micro (OMEGA)
#Запустить ./install.sh install5m - если у Вас cuarm5m (Rastberry)
#везде где надо нажать "Y" для установки нужных компонентов, если компоненты уже установлены на экран выведется 
#
#				!!ВНИМАНИЕ!! БЕЗ УСТАНОВКИ ВСЕХ КОМПОНЕНТОВ БОТ РАБОТАТЬ НЕ БУДЕТ!
#
#Истользование
#Для вызова бота в коде 
#setStatus(1000:90, "telegram_id||Текст сообщения||Id:subid камеры||время записи в секундах"); 
#Пример: на id  12345678 получите сообщение "Тестовое сообщение" с прикрепленным видео с камеры 2048:1 продолжительностью 10 секунд  
#setStatus(1000:90, "12345678||Тестовое сообщение||2048:1||10");
#на id  96500921 получите сообщение "Тестовое сообщение" с прикрепленным фото с камеры 2048:1
#setStatus(1000:90, "12345678||Тестовое сообщение||2048:1||");
#на id  96500921 получите сообщение "Тестовое сообщение"
#setStatus(1000:90, "12345678||Тестовое сообщение||||");
#

case "$1" in
"install5m")

##проверка установки всех компонентов
		#проверка установки ffmpeg
if [ ! -e /usr/bin/ffmpeg ]
then
	echo "ffmpeg не установлен"
	wget tg.smart48.ru/distr/ffmpeg_3.1.1-1_armhf.deb
	dpkg -i ffmpeg_3.1.1-1_armhf.deb			
	rm ffmpeg_3.1.1-1_armhf.deb
fi
#Проверка установки curl
if [ ! -e /usr/bin/curl ]
then
	echo "curl не установлен"
	apt-get update
	apt-get install curl			
fi

#Проверка установки perl
if [ ! -e /usr/bin/perl ]
then
	echo "perl не установлен"
	apt-get update
	apt-get install perl
fi
wget -O /home/sh2/ext/90.sh tg.smart48.ru/distr/90m.sh 
;;


"install")

##проверка установки всех компонентов
#проверка установки ffmpeg
if [ ! -e /usr/bin/ffmpeg ]
then
	echo "ffmpeg не установлен"
	opkg update
	opkg install ffmpeg
fi
#Проверка установки curl
if [ ! -e /usr/bin/curl ]
then
	echo "curl не установлен"
	opkg update
	opkg install curl			
fi

#Проверка установки perl
if [ ! -e /usr/bin/perl ]
then
	echo "perl не установлен"
	opkg update
	opkg install perl
fi
wget -O /mimismart/ext/90.sh tg.smart48.ru/distr/90.sh 
;;


*)
  echo "start $0 install|install5m "
  echo "ash $0 install - start instalation from Cuarm5, Micro (OMEGA)"
  echo "bash $0 install5m - start instalation from Cuarm5m, Cuarm4, Cuarm3 (RASTBERRY)" 
esac

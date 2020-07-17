#!/bin/bash

open_firefox()
{
firefox $1 &
sleep 7
firefoxid=`xdotool search --sync --name firefox`
xdotool windowfocus $firefoxid
xdotool key ctrl+l
sleep 2
xdotool type "$2"
sleep 1
xdotool key KP_Enter
xdotool windowminimize $firefoxid
xdotool windowkill $firefoxid
}

gedit_type_text()
{
	if [ -f /tmp/automatedtext ]
	then
		rm -f /tmp/automatedtext
	fi
	gedit /tmp/automatedtext &
	sleep 2
	editorid=`xdotool search --name automated`
	xdotool windowsize --sync  $editorid 50% 70%
	xdotool mousemove 150 150
	xdotool click 1
	xdotool type "hello pykid" && xdotool key KP_Enter
	for i in {1..9}
	do
		xdotool type "working in loop" && xdotool key KP_Enter
		sleep 1
		if [ $i -eq 5 ]
		then
			xdotool windowminimize --sync $editorid
			sleep 3
			xdotool windowactivate --sync $editorid
			xdotool type --delay 30 "Mere mehboob....Qayamat Hogi... aaj ruswa teri galiyo.... mein mohobbat hogi..... Mere Mehboob Qayamat Hogi
Aaj Rusva Teri Galiyon Mein Mohabbat Hogi
Meri Nazrein To Gila Karti Hain
Tere Dil Ko Bhi Sanam Tujhse Shikayat Hogi
Mere Mehboob...

Teri Gali Maein Aata Sanam
Nagma Wafa Ka Gaata Sanam
Tujhse Suna Na Jaata Sanam
Phir Aaj Idhar Aaya Hoon Magar Yeh Kehne Maein Deewana
Khatm Bas Aaj Yeh dahshat Hogi
Aaj Rusva Teri Galiyon Mein Mohabbat Hogi
Mere Mehboob...

Meri Tarah Tu Aahen Bhare
Tu Bhi Kisise Pyar Kare
Aur Rahe Voh Tujhse Parey
Toone O Sanam Dhaye Hain Sitam To Yeh Tu Bhool Na Jaana

Ki Na Tujhse Bhi Inayat Hogi
Aaj Rusva Teri Galiyon Mein Mohabbat Hogi
Mere Mehboob... " && xdotool key KP_Enter
		fi
		sleep 1
	done
	xdotool key ctrl+s
	sleep 2
	xdotool windowkill $editorid
}

moving_window()
{
	if [ -d /tmp/car1 ]
	then 
		rmdir /tmp/car1
	fi
	mkdir /tmp/car1
	nautilus /tmp/car1 &
	sleep 2
	car=`xdotool search --name car`
	xdotool windowsize $car 30% 30%
	# l ~> r
	for((i=10;i<1000;i+=5))
	do
		xdotool windowmove --sync $car $i 100
	done
	# u ~> d
	for((i=100;i<691;i+=5))
	do
		xdotool windowmove --sync $car 995 $i
	done
	# r ~> l
	for((i=1000;i>100;i-=5))
	do
		xdotool windowmove --sync $car $i 690
	done
	# d ~> u
	for((i=690;i>=100;i-=5))
	do
		xdotool windowmove --sync $car 170 $i
	done
	xdotool windowsize --sync $car 90% 100%
	sleep 1
	xdotool windowkill $car
}

echo "starting automation script"
open_firefox https://www.google.com https://www.facebook.com
sleep 3
gedit_type_text
sleep 2
moving_window
sleep 1
open_firefox https://www.linkedin.com https://www.google.com
echo "Hope I would have been of your help"

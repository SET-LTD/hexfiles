#!/bin/sh
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
sudo /sbin/ip link set can0 up type can bitrate 500000
#sudo ip link set can0 up type can bitrate 500000


screen -d -m -S ack
screen -d -m -S ifconfx
screen -d -m -S dmsg
screen -d -m -S recov
screen -d -m -S ipdet
screen -d -m -S processing
screen -S ack -X stuff 'sudo //home/pi/Laurence/can_soft_ack can0 localhost 7FF 1251 1298 0'
screen -S ack -X stuff '\015'
screen -S recov -X stuff 'sudo //home/pi/auto_restart_can.sh'
screen -S recov -X stuff '\015'
screen -S dmsg -X stuff 'while true; do clear; dmesg; sleep 0.1; done'
screen -S dmsg -X stuff '\015'
screen -S ifconfx -X stuff 'while true; do clear;sudo ifconfig; sleep 0.1; done'
screen -S ifconfx -X stuff '\015'
screen -S ipdet -X stuff 'while true; do clear;sudo ip -det -stat link show can0; sleep 0.1; done'
screen -S ipdet -X stuff '\015'
screen -S processing -X stuff 'cd //home/pi/Laurence; sudo //home/pi/Laurence/launch_services.sh'
screen -S processing -X stuff '\015'

#!/bin/sh

unlink Desktop/Projects 
unlink Documents 
unlink Downloads 
unlink Pictures
unlink Videos 
unlink Music 
unlink Games 

ln -sn /media/vandito/home/Projects/ Desktop/Projects
ln -sn /media/vandito/home/Documents/ Documents 
ln -sn /media/vandito/home/Downloads/ Downloads
ln -sn /media/vandito/home/Pictures/ Pictures
ln -sn /media/vandito/home/Videos/ Videos 
ln -sn /media/vandito/home/Music/ Music 
ln -sn /media/vandito/home/Games/ Games 

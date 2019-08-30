#!/bin/bash

for i in $@
do
	:
	if [ -d  /proc/${i} ]
	then
		cat /proc/${i}/cmdline | awk '{n=split($0,cmd,"-")}END {print cmd[n];}' 
		echo ""
		echo "cat /proc/${i}/status | grep VmHWM"
		state=$(cat /proc/${i}/status | grep State | awk '{split($0,strings," " ); printf("%s \n", strings[2])}')
		if [ $state == 'S' ] ||  [ $state == 'R' ]
		then
			echo Running
		fi	
		cat /proc/${i}/status | grep VmHWM | awk '{split($0,strings," " ); printf("%f MB\n ", strings[2]/1024)}'
	else
		echo ${i} not exist.
	fi
done

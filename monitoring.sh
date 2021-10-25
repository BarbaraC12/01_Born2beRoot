#!/bin/sh

if lvdisplay >/dev/null 2>&1; then
	lvm_usage="no"
else
	lvm_usage="yes"
fi

cpu_user=$(vmstat 1 5 | tail -n1|tr -s ' ' | cut -d ' ' -f 14)
cpu_sys=$(vmstat 1 5 | tail -n1|tr -s ' ' | cut -d ' ' -f 15)
cpu_usage=$((cpu_user + cpu_sys))
mem_total=$(free --mega | grep Mem:|tr -s ' '|cut -d ' ' -f 2)
mem_used=$(free --mega | grep Mem:|tr -s ' '|cut -d ' ' -f 3)
mem_pcent=$((mem_used * 100 / mem_total))
arch=$(uname -a)
cpu_phy=$(nproc)
cpu_vir=$(cat /proc/cpuinfo | grep processor | wc -l)
disk_used=$(df -h --total | grep total | cut -d ' ' -f32)
disk_total=$(df -h --total | grep total | cut -d ' ' -f28)
disk_pcent=$(df -h --total | grep total | cut -d ' ' -f38)
lastboot=$(who -b | cut -d ' ' -f12,13)
nb_tcp_co=$(netstat -an | grep tcp | cut -d ':' -f2 | grep 4242 | wc -l)
nb_user_log=$(who | cut -d ' ' -f1 | sort -u | wc -l)
ip=$(hostname -I)
mac=$(ip link show | grep ether | cut -d " " -f6)
sudo_line=$(sudo cat /var/log/sudo/sudo.log | wc -l)
sudo=$((sudo_line / 2))

print () {
	echo "\t## Architecture: " $arch;
	echo "\t## CPU physical: " $cpu_phy;
	echo "\t## vCPU: " $cpu_vir;
	echo "\t## Memory Usage: $mem_used/$mem_total MB ($mem_pcent%)";
	echo "\t## Disk Usage: $disk_used/$disk_total ($disk_pcent)";
	echo "\t## CPU load: $cpu_usage%";
	echo "\t## Last boot: " $lastboot;
	echo "\t## LVM use: "$lvm_usage;
	echo "\t## TCP connection: " $nb_tcp_co;
	echo "\t## User log:" $nb_user_log;
	echo "\t## Network: IP $ip ($mac)";
	echo "\t## Sudo: "$sudo;
}

print | wall -n

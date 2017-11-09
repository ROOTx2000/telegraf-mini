#!/bin/sh
error_exit()
{
	echo "$3"
	if [ $1 -eq 0 ];then
		func_ts 0  ""; 
	else 
		func_ts 1 "$2"; 
		exit ;
	fi
}

func_ts(){
	tip=$2
	if [ $1 -eq 0 ] ;then
		echo -e ">>>> \033[34m[$tip OK ]\033[0m"
	else
		echo -e ">>>> \033[31m$tip [ ERROR ]\033[0m"
	fi
}

# 复制文件
do_copy(){
	cp -rf  /opt/telegraf/S101telegraf /etc/init.d/
	if [ $? -ne 0 ];then
		exit 1
	fi
}

# 设置文件夹权限
set_permission(){
	chmod 700 /opt/telegraf/telegraf
	chmod 755 /etc/init.d/S101telegraf 
}

# 启动服务
do_start_server(){
	cd /etc/init.d
	./S101telegraf start > /dev/null 2>&1 &
}


echo "====== init telegraf  ======"

# 复制文件
result=$(do_copy 2>&1)
error_exit  $?  "$result" "copy start bat to init.d directory ..."

# 设置权限
result=$(set_permission 2>&1)
error_exit  $?  "$result" "set directory permission ..." 


# 启动服务
result=$(do_start_server 2>&1)
error_exit  $?  "$result" "start server ..."

echo -e "\033[42;37m======[ OK ]======\033[0m"




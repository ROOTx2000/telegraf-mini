# telegraf mini for ARM  

## 简介
这是一个精简版的telegraf mini release 版：

1. 专门为ARM嵌入式环境做了功能裁剪，屏蔽了许多通常不会在ARM环境下使用的Input和Output plugins，对应的配置文件telegraf.conf也做了裁剪
2. 提供编译后的二进制文件，文件大小由原来的20+M减少为7M左右，节省磁盘空间
3. 提供快速安装脚本和自启动脚本


## 安装使用
1. 下载release包，或者所有文件
2. 复制所有文件到目标主机的/opt/telegraf目录下
3. 按自己的需求修改/opt/telegraf/telegraf.conf配置文件。建议修改的包括：
    * [agent]中的"hostname"，可配置为自己主机的名称
    * [outputs.influxdb]默认开启，请按需修改服务配置，或者关闭

4. 运行install.sh，该脚本会复制自启动脚本文件S101telegraf到/etc/init.d目录，并设置可执行权限，并启动服务



## 备注
源码请参阅官方原版： <https://github.com/influxdata/telegraf>

主要修改：
1. 删除input及output plugins目录下中all.go文件中不需要的plugin
2. 替换golang.org/x引用，改为github.com/golang


#!/bin/bash
LANG=zh_cn.UTF.8

# 清除
clear


# 创建一些默认值帮助判断
msg="default message..."
flag="0"

# 获得本机基本信息
echo -e "\e[36m\e[1m====================== 本机信息 ======================\e[0m"
SYS_INFO=$(uname -a)
MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
CPU_INFO=$(getconf _NPROCESSORS_ONLN)
SYS_BIT=$(getconf LONG_BIT)

echo -e "\e[36m当前使用机子\e[0m: ${SYS_INFO}"
echo -e "\e[36m内存:\e[0m ${MEM_TOTAL}M"
echo -e "\e[36mCPU:\e[0m ${CPU_INFO}"
if [ $SYS_BIT == "64" ]; then
	echo -e "\e[36m位数:\e[0m ${SYS_BIT}"
else 
	echo -e "\e[36m位数:\e[0m ${SYS_BIT}\t \e[33m非 64 位系统可能会产生软件兼容问题!\e[0m"
fi

# 判断当前账户名
if [ $(whoami) == "root" ]; then
        echo -e "\e[36m当前账户:\e[0m $(whoami)"
        echo "拥有最高权限，请放心食用~"
else
        echo "非 root 账户！"
        echo "若遇到权限不足的问题，请使用 sudo 或 chmod +x 文件夹/文件名 来提升权限！"
        #exit 1
fi

##向控制台输出各种类型的消息
#	字体颜色	|字符背景颜色
#黑     30		|40
#红	31		|41	
#绿	32		|42
#黄	33		|43
#蓝	34		|44
#紫红	35		|45
#青蓝	36		|46
#白	37		|47
########
#所有属性 OFF(Normal)	|0
#高亮显示(Bright)	|1
#下划线(Underline)	|4
#字体闪烁(Flash)	|5
#反相显示(Inverse)	|7
#不可见(Invisable)	|8
##
success_msg(){
	echo -e "\e[32m\e[1m"
}

error_msg(){
	echo -e "\e[31m\e[7m"
}

warn_msg(){
	echo -e "\e[33m\e[7m"
}

proc_msg(){
	echo -e "\e[36m\e[1m"
}



# 系统更新
echo -e "\e[36m\e[1m====================== 系统更新开始 ======================\e[0m"
sudo apt-get update
update_check=$status
if [ ${update_check}=="0" ]; then
        success_msg
	echo -e "系统更新完毕!\n\e[0m"
else
        error_msg
	echo -e "系统无法更新，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
        exit 1
fi

#系统升级
sudo apt-get upgrade
upgrade_check=$status
if [ ${upgrade_check}=="0" ]; then
        success_msg
	echo -e "系统升级成功!\e[0m"
else
        error_msg
	echo -e "系统无法升级，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
        exit 1
fi

echo -e "\e[36m\e[1m====================== 系统更新结束 ======================\e[0m"


# 通用软件检查
echo -e "\n\n\n\n\n\n\e[36m\e[1m====================== 通用软件检查 ======================\e[0m"
which nginx
nginx_check=$status
echo -e "nginx check 为 $status"
if [ ${nginx_check}=="0" ];then
	success_msg
	echo -e "Nginx 已存在\e[0m"
else
	warn_msg
	echo -e "未安装 Nginx，现在正在安装...\e[0m"
	sudo apt-get install nginx
	which nginx
	nginx_re_check=$status
	if [ $nginx_re_check=="0" ];then
		success_msg
		echo -e "Nginx 安装完成!\e[0m"
	else
		error_msg
		echo -e "Nginx 安装过程出现问题，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
		exit 1
	fi
		
fi	

echo -e "\n\n"
which mycli
mycli_check=$status
echo -e "mycli check 为 $status"
if [ ${mycli_check}!="0" ];then
	warn_msg
	echo -e "未安装 Mycli，现在正在安装...\e[0m"
	sudo apt-get install mycli
	which mycli
        mycli_re_check=$status
        if [ $mycli_re_check=="0" ];then
                success_msg
                echo -e "Mycli 安装完成!\e[0m"
        else
                error_msg
                echo -e "Mycli 安装过程出现问题，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
                exit 1
        fi
else
        success_msg
        echo -e "Mycli 已存在，无需安装\e[0m"

fi












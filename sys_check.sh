#!/bin/bash
LANG=zh_cn.UTF.8

# 创建默认值
msg="default message..."
flag=0
pikachu_ascii_art="\e[33m⠸⣷⣦⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤\n
 ⠙⣿⡄⠈⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠔⠊⠉⣿⡿⠁\n
⠀⠀⠈⠣⡀⠀⠀⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⠀⣰⠟⠀⠀⠀⣀⣀\n
⠀⠀⠀⠀⠈⠢⣄⠀⡈⠒⠊⠉⠁⠀⠈⠉⠑⠚⠀⠀⣀⠔⢊⣠⠤⠒⠊⠉⠀⡜\n
⠀⠀⠀⠀⠀⠀⠀⡽⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠩⡔⠊⠁⠀⠀⠀⠀⠀⠀⠇\n
⠀⠀⠀⠀⠀⠀⠀⡇⢠⡤⢄⠀⠀⠀⠀⠀⡠⢤⣄⠀⡇⠀⠀⠀⠀⠀⠀⠀⢰⠀\n
⠀⠀⠀⠀⠀⠀⢀⠇⠹⠿⠟⠀⠀⠤⠀⠀⠻⠿⠟⠀⣇⠀⠀⡀⠠⠄⠒⠊⠁⠀\n
⠀⠀⠀⠀⠀⠀⢸⣿⣿⡆⠀⠰⠤⠖⠦⠴⠀⢀⣶⣿⣿⠀⠙⢄⠀⠀⠀⠀⠀⠀\n
⠀⠀⠀⠀⠀⠀⠀⢻⣿⠃⠀⠀⠀⠀⠀⠀⠀⠈⠿⡿⠛⢄⠀⠀⠱⣄⠀⠀⠀⠀\n
⠀⠀⠀⠀⠀⠀⠀⢸⠈⠓⠦⠀⣀⣀⣀⠀⡠⠴⠊⠹⡞⣁⠤⠒⠉⠀⠀⠀⠀⠀\n
⠀⠀⠀⠀⠀⠀⣠⠃⠀⠀⠀⠀⡌⠉⠉⡤⠀⠀⠀⠀⢻⠿⠆⠀⠀⠀⠀⠀⠀⠀\n
⠀⠀⠀⠀⠀⠰⠁⡀⠀⠀⠀⠀⢸⠀⢰⠃⠀⠀⠀⢠⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀\n
⠀⠀⠀⢶⣗⠧⡀⢳⠀⠀⠀⠀⢸⣀⣸⠀⠀⠀⢀⡜⠀⣸⢤⣶⠀⠀⠀⠀⠀⠀\n
⠀⠀⠀⠈⠻⣿⣦⣈⣧⡀⠀⠀⢸⣿⣿⠀⠀⢀⣼⡀⣨⣿⡿⠁⠀⠀⠀⠀⠀⠀\n
⠀⠀⠀⠀⠀⠈⠻⠿⠿⠓⠄⠤⠘⠉⠙⠤⢀⠾⠿⣿⠟⠋\e[0m"

welcome_msg="\e[36m欢迎来到今日摸鱼の面板!\e[0m"


##向控制台输出各种类型的消息
#       字体颜色        |字符背景颜色
#黑     30              |40
#红     31              |41
#绿     32              |42
#黄     33              |43
#蓝     34              |44
#紫红   35              |45
#青蓝   36              |46
#白     37              |47
########
#所有属性 OFF(句尾)     |0
#高亮显示(Bright)       |1
#不高亮                 |2
#斜体                   |3
#下划线(Underline)      |4
#字体闪烁(Flash)        |5
#字体闪烁               |6
#反相显示(Inverse)      |7
#不可见(Invisable)      |8
#删除线                 |9
#
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


# 清除
clear

# 欢迎
echo -e ${welcome_msg}


# 这里添加面板功能
panel="\n
1) 权限检查\n
2) 系统更新/升级\n
3) 基本软件检查\n
4) 基本编程环境检查\n
5) 软件下载/更新/删除\n
6) 软件快捷打开\n
7) 待定\n
0) 关闭面板\n
========================="

echo -e "\e[36m
======== 面板功能 ========
\e[7;33m公告: 暂定 Ubuntu Linux 系统
\e[0m"
echo -e ${panel}

######################## 功能区 ########################
# 1. 获得本机基本信息
function getSysInfo(){
	clear
        echo -e "\e[36;7m本机信息\e[0m"
        SYS_INFO=$(uname -a)
        MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
        CPU_INFO=$(getconf _NPROCESSORS_ONLN)
        SYS_BIT=$(getconf LONG_BIT)

        echo -e "\e[36m操作系统\e[0m: ${SYS_INFO}"
        #echo -e "\e[36m时间: \e[0m$(date)"
        echo -e "\e[36m内存:\e[0m ${MEM_TOTAL}M"
        echo -e "\e[36mCPU:\e[0m ${CPU_INFO}"
        if [ $SYS_BIT = "64" ]; then
                echo -e "\e[36m位数:\e[0m ${SYS_BIT}"
        else
                echo -e "\e[36m位数:\e[0m ${SYS_BIT}\t \e[33m非 64 位系统可能会产生软件兼容问题!\e[0m"
        fi
}

# 1.1. 判断当前账户权限
function getUserInfo(){
	echo -e "\e[36;7m当前用户权限\e[0m"
	if [ $(whoami) = "root" ]; then
        	echo -e "\e[36m当前账户:\e[0m $(whoami)"
        	echo "拥有最高权限，请放心食用~"
	else
		warn_msg
	        echo -e "非 root 账户!\e[0m"
	        #echo "若遇到权限不足的问题，请使用 sudo 或 chmod +x 文件夹/文件名 来提升权限！"
	        #exit 1
	fi
}

# 2.1 系统更新
function sysUpdate(){
	clear
	echo -e "\e[36m\e[1m====================== 系统更新开始 ======================\e[0m"
	sudo apt-get update
	#update_check=$status
	# $status 和 $? 的区别是什么？
	if [ $? -eq 0 ]; then
	        success_msg
	        echo -e "系统更新完毕!\n\e[0m"
	else
	        error_msg
	        echo -e "系统无法更新，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
	        exit 1
	fi
}

# 2.2 系统升级
function sysUpgrade(){
	sudo apt-get upgrade
	if [ $? -eq 0 ]; then
	        success_msg
	        echo -e "系统升级成功!\e[0m\n"
	else
	        error_msg
	        echo -e "系统无法升级，请阅读系统给出的错误信息，并排查问题~\n\e[0m"
	        exit 1
	fi

	echo -e "\e[36m\e[1m====================== 系统更新结束 ======================\e[0m"
}

# 3. 基本编程语言环境检查
# Python 3+
# Java 8+
# Go
# C
# Rust
# Lua
# Node.js
# 先检查 Python 和 C 的, 检查返回状态, 若存在返回该语言版本



# 4. 基本软件检查
# Docker
# Vim
# Nginx
# MySQL
# Git
# 通用软件检查

function basicSoftwareCheck(){
	echo -e "\e[36;1m====================== 通用软件检查 ======================\e[0m"
	for loop in "vim" "git" "nginx" "docker" "mysql"
	do
    		echo -e "检查 ${loop} 安装路径..."
		which $loop
		if [ $? -eq 0 ];then
                	success_msg
                	echo -e "${loop}已存在, 无需安装!\e[0m"
        	else
                	warn_msg
                	echo -e "未安装 ${loop}, 现在正在安装...\e[0m"
                	sudo apt-get install ${loop}
                	which ${loop}
                	if [ $? -eq 0 ];then
                	        success_msg
                	        echo -e "安装完成!\e[0m"
                	else
                	        error_msg
                	        echo -e "${loop} 未安装成功, 请阅读系统给出信息~\n\e[0m"
                	        #exit 1
                	fi

        	fi
	done
}


# 5.1 软件下载
function softwareDownload(){
	read -p $'\e[32m想下载什么:\e[0m \n' input
	echo -e "\e[36m检查 ${input} 安装路径...\e[0m"
	which ${input}
        if [ $? -eq 0 ];then
		success_msg
		echo -e "${input}已存在, 无需安装!\e[0m"
        else
                warn_msg
                echo -e "未安装 ${input}, 现在正在安装...\e[0m"
                sudo apt-get install ${input}
                which ${input}
                if [ $? -eq 0 ];then
                        success_msg
                        echo -e "安装完成!\e[0m"
                else
                        error_msg
                        echo -e "${input} 未安装成功, 请阅读系统给出信息~\n\e[0m"
                        #exit 1
                fi

        fi
}
# 5.2 软件更新
# 5.3 软件删除
function removeSoftware(){
        read -p $'\e[32m想删除什么:\e[0m \n' input
        echo -e "\e[36m检查 ${input} 安装路径...\e[0m"
        which ${input}
        if [ $? -ne 0 ];then
                success_msg
                echo -e "${input} 不存在, 无需删除!\e[0m"
        else
                warn_msg
                echo -e "正在删除...\e[0m"
                sudo apt-get remove ${input}
                which ${input}
                if [ $? -ne 0 ];then
                        success_msg
                        echo -e "删除成功!\e[0m"
                else
                        error_msg
                        echo -e "${input} 未成功删除, 请阅读系统给出的信息~\n\e[0m"
                        #exit 1
                fi

        fi
}


# 用户来决定操作是否结束
function panelLoop(){
	read -p $'\e[33m\n还想做点啥?\n(1) 继续使用面板\n(0) 退出面板\n\e[0m' decision
	if [ ${decision} -eq 1 ];then
		clear
		echo -e ${panel}
	elif [ ${decision} -eq 0 ];then
		echo -e "\e[33m正在退出面板...\e[0m"
		sleep 1
		exit 0
	else
		error_msg
		echo -e "输入错误\n\e[0m\e[33m没关系, 现在回退到面板操作界面~\e[0m\n"
		sleep 1
		clear
		echo -e ${panel}
	fi
}

######################## 功能区 ########################


#对用户输入做判断, 3 次输错即退出面板
while [ $flag -lt 3 ]
do
        read -p $'\e[32m请输入您的选择:\e[0m \n' input
        case ${input} in
                [1])
			getSysInfo
			getUserInfo
                        panelLoop
			#break;
                        ;;
		[2])
			sysUpdate
			sysUpgrade
			panelLoop
			#break;
                        ;;
		[3])
                        echo "Your name is ${input}"
        		panelLoop                
			#break;
                        ;;
		[4])
                        basicSoftwareCheck
			panelLoop
			#break;
                        ;;
		[5])
			read -p $'\e[32m请问是安装(1) or 删除(0):\e[0m\n' choice
			if [ ${choice} -eq 1 ];then
				softwareDownload
			elif [ ${choice} -eq 0 ];then
				removeSoftware
			else
				echo -e "只需要输入规定的数字!\e[0m"
			fi
                        panelLoop
			#break;
                        ;;
                [0])
                        proc_msg
                        echo -e "即将退出面板...\e[0m"
                        sleep 1
                        exit
                        ;;
                *)
                        warn_msg
                        flag=`expr ${flag} + 1`
                        if [ ${flag} -eq 3 ];then
                                error_msg
                                echo -e "接收参数失败, 即将关闭面板!\e[0m\n"
                                sleep 1
                                #clear
                                exit
                        fi
                        echo -e "只需要输入规定的数字! 请重新输入\e[0m"
                        ;;
        esac
done




#对用户输入做判断, 3 次输错即退出面板
#while [ $flag -lt 3 ]
#do
#	read -p $'请输入您的选择: [y/n]\n' input
#	case ${input} in
#        	[yY]*)
#                	echo "Your name is ${input}"
#			break;
#                	;;
#        	[nN]*)
#                	proc_msg
#                	echo -e "操作终止, 即将退出面板...\e[0m"
#			sleep 1
#                	exit
#                	;;
#        	*)
#			warn_msg
#			flag=`expr ${flag} + 1`
#			if [ ${flag} -eq 3 ];then	
#				error_msg
#				echo -e "接收参数失败, 即将关闭面板!\e[0m\n"
#				sleep 1
#				clear
#				exit
#			fi
#			echo -e "只需要输入 Y 或 N! 请重新输入\e[0m"
#			;;
#	esac	
#done	

#read -p "请输入您的选择: " input
#case ${input} in
#        [yY]*)
#                echo "Your name is ${input}"
#		;;
#        [nN]*)
#		proc_msg
#		echo -e "操作结束!\e[0m"
#                exit
#                ;;
#        *)
#                echo "只需要输入 Y 或 N! 请重新输入"
#                
#                ;;
#esac



# 收集命令执行时间
#function timing(){
#	START=`date +%s%N`;
#	sleep 3;
#	END=`date +%s%N`;
#	time=$((END-START))
#	return `expr $time / 1000000`
#}
#timing
#echo $?


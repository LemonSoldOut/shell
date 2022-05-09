#!/bin/bash
LANG=zh_cn.UTF.8
if [ $(whoami) != "root" ]; then
	echo "这不是一个 root 账户，请切换账户！"
	#exit 1
fi

is64bit=$(getconf LONG_BIT)
if [ "${is64bit}" != '32' ]; then
	RED_ERROR "非32位，错误信息"
fi

cpu_cpunt=$(cat /proc/cpuinfo | grep processor | wc -l)
if [ "$1" ]; then
    IDC_CODE=$1
fi

GetSysInfo() {
    # if [ -s "/etc/redhat-release" ]; then
    #     SYS_VERSION=$(cat /etc/redhat-release)
    # elif [ -s "/etc/issue" ]; then
    #     SYS_VERSION=$(cat /etc/issue)
    #fi
    SYS_INFO=$(uname -a)
    SYS_BIT=$(getconf LONG_BIT)
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    CPU_INFO=$(getconf _NPROCESSORS_ONLN)

    #echo -e ${SYS_VERSION}
    echo -e Bit:${SYS_BIT} Mem:${MEM_TOTAL}M Core:${CPU_INFO}
    echo -e ${SYS_INFO}
}

Red_Error() {
    echo '================================================='
    printf '\033[1;31;40m%b\033[0m\n' "$@"
    GetSysInfo
    exit 1
}







System_Check() {
    MYSQLD_CHECK=$(ps -ef | grep mysqld | grep -v grep | grep -v /www/server/mysql)
    PHP_CHECK=$(ps -ef | grep php-fpm | grep master | grep -v /www/server/php)
    NGINX_CHECK=$(ps -ef | grep nginx | grep master | grep -v /www/server/nginx)
    HTTPD_CHECK=$(ps -ef | grep -E 'httpd|apache' | grep -v /www/server/apache | grep -v grep)
    if [ "${PHP_CHECK}" ] || [ "${MYSQLD_CHECK}" ] || [ "${NGINX_CHECK}" ] || [ "${HTTPD_CHECK}" ]; then
        Install_Check
    fi
}



Get_Pack_Manager() {
    if [ -f "/usr/bin/yum" ] && [ -d "/etc/yum.repos.d" ]; then
        PM="yum"
    elif [ -f "/usr/bin/apt-get" ] && [ -f "/usr/bin/dpkg" ]; then
        PM="apt-get"
    fi
}



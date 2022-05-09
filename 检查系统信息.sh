#!/bin/bash
_64 x86_64 x86_64 GNU/Linux

        echo "拥有最高权限，请放心食用~"
else
        echo "非 root 账户！"
        echo "若遇到权限不足的问题，请使用 sudo 或 chmod +x 文件夹/文件名 来提升权限！"
        #exit 1
fi

# 判断本机系统位数
SYS_BIT=$(getconf LONG_BIT)
if [ "${SYS_BIT}" != '64' ]; then
        echo "本机为 64 位操作系统"

else
        echo "当前使用 ${SYS_BIT} 位系统，请注意软件是否兼容！"
        #exit 1
fi

# 拿到本机一些基本信息
SYS_INFO=$(uname -a)
MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
CPU_INFO=$(getconf _NPROCESSORS_ONLN)

echo -e 位数:${SYS_BIT}
echo -e 内存:${MEM_TOTAL}M
echo -e CPU:${CPU_INFO}
echo -e ${SYS_INFO}
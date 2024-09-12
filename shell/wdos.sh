#!/bin/bash
#
# @Time    : 2024-05-14
# @Author  : wendy
# @Desc    : Wendy Tools
# network
# extranet_ip=" and $(curl -s http://members.3322.org/dyndns/getip)"
IP_INFO="$(curl -s http://members.3322.org/dyndns/getip)"
# os
if [ -f /etc/redhat-release ] ; then
    PRETTY_NAME=$(< /etc/redhat-release)
elif [ -f /etc/debian_version ]; then
   DIST_VER=$(</etc/debian_version)
   PRETTY_NAME="$(grep PRETTY_NAME /etc/os-release | sed -e 's/PRETTY_NAME=//g' -e  's/"//g') ($DIST_VER)"
else
    PRETTY_NAME=$(cat /etc/*-release | grep "PRETTY_NAME" | sed -e 's/PRETTY_NAME=//g' -e 's/"//g')
fi
# get reinstall script
curl -o reinstall.sh https://wendycode.net/shell/reinstall.sh && chmod 755 -R reinstall.sh
# info
echo -e "
 \033[0;1;31m-------------------------------------------------------------------------------\033[0m\033[0;1;31m
            ____       _____                        \033[0;1;32mWendy 镜 像\033[0m \033[0;1;31m
 _   _     |__  \    /  ___/__  ______   ____   ____
 |  / |   /|  / /____\__ \/ _ \/ ___/ | / / _ \/ ___/      
 | /  |  / |_/ /____/__/ /  __/ /   | |/ /  __/ /  
 |/   |_/  |__/    /____/\___/_/    |___/\___/_/ \033[0;1;32m懒鬼专用\033[0m
\033[0;1;31m-------------------------------------------------------------------------------\033[0m
                                        \033[0;1;32m懒鬼专用 \033[0m
-------------------------------------------------------------------------------
 \033[0;1;31mI P 地 址\033[0m..............:      \033[1;34m${IP_INFO}\033[0m     :...............\033[0;1;31mI P 地 址\033[0m	 
 \033[0;32m------------------------------------------------------------------------------\033[0;32m
 \033[0;1;31m操作系统\033[0m........:  ${PRETTY_NAME}  :.........: \033[0;1;31m操作系统\033[0m	
 \033[0;32m------------------------------------\033[0m\033[0;1;31mby Wendy\033[0m\033[0;32m----------------\033[0m
\033[0;1;32m##############################################################################\033[0m
\033[0;1;32m#\033[0m                    \033[0;1;31m请根据您的服务器情况选择您需要的服务                    \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(1)CentOS76最小安装版                                                \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(2)CentOS76-l2pp                                                      \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(3)CentOS76广州中转                                                      \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(4)  Window 7 x64                                                    \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(5)  Window 10 x64                                                   \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(6)  Windows server 2022                                             \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(7)  Debian 7                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(8)  Debian 8                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(9)  Debian 9                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(10) Debian 10                                                       \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(11) Debian 11                                                       \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(12) Debian 12                                                       \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(13) Ubuntu 16.04                                                    \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(14) Ubuntu 18.04                                                    \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(15) Ubuntu 20.04                                                    \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(16) Fedora 32                                                       \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(17) Fedora 33                                                       \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(18) Fedora 34                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(19) Fedora 35                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(20) Fedora 36                                                        \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(21) RockyLinux 8                                                     \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(22) RockyLinux 9                                                     \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(23) AlmaLinux 8                                                      \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(24) AlmaLinux 9                                                      \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(25) OpenWrt                                                          \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(26) OpenWrt-efi                                                      \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(27)                                                                  \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(28)                                                                  \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(29)                                                                  \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(30)                                                                  \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(88)返回上级菜单Return To Main Menu                                  \033[0;1;32m#
\033[0;1;32m#\033[0m       \033[0;1;32m(99)返回主菜单Return To Main Menu                                    \033[0;1;32m#
\033[0;1;32m#\033[0m                              \033[0;1;33m请输入编号: \033[0m                                  \033[0;1;32m#
\033[0;1;32m##############################################################################\033[0m

 "
echo "                                                              "
echo ""
echo ""
echo -n "请输入编号: "
read N
case $N in
  # 1) bash reinstall.sh -dd "https://qu.wd-wd.top/images/linux/CentOS-76.img.gz";;
  1)  bash reinstall.sh -dd "https://api.moetools.net/get/centos-76-image";;
  2) bash reinstall.sh -dd "https://ddcn1.oss-cn-shenzhen.aliyuncs.com/images/Linux/DouOS-CentOS76-CNLP.img.gz";;
  3) bash reinstall.sh -dd "https://gz-1329157705.cos.ap-guangzhou.myqcloud.com/os/linux/CentOS-76.img.gz";;
  4) bash reinstall.sh -dd "http://disk.29296819.xyz/d/dd/os/laosiji/Win7/guajibao/VirtAll-win7-sp1-ent/VirtAll-win7-sp1-ent-x64-cn.vhd.gz";;
  5) bash reinstall.sh -dd "http://disk.29296819.xyz/d/dd/os/laosiji/Win10/guajibao/guajibao-win10-ent-ltsc-2021-x64-cn.vhd.gz";;
  6) bash reinstall.sh -dd "http://disk.29296819.xyz/d/dd/os/cxthhhhh/new/Disk_Windows_Server_2022_DataCenter_CN_v2.12.vhd.gz";;
  7) bash reinstall.sh -d 7 -p Wd8264.. ;;
  8) bash reinstall.sh -d 8 -p Wd8264.. ;;
  9) bash reinstall.sh -d 9 -p Wd8264.. ;;
  10) bash reinstall.sh -d 10 -p Wd8264.. ;;
  11) bash reinstall.sh -d 11 -p Wd8264.. ;;
  12) bash reinstall.sh -d 12 -p Wd8264.. ;;
  13) bash reinstall.sh -u 16.04 -p Wd8264.. ;;
  14) bash reinstall.sh -u 18.04 -p Wd8264.. ;;
  15) bash reinstall.sh -u 20.04 -p Wd8264.. ;;
  16) bash reinstall.sh -f 32 -p Wd8264.. ;;
  17)  bash reinstall.sh -f 33 -p Wd8264.. ;;
  18) bash reinstall.sh -f 34 -p Wd8264.. ;;
  19) bash reinstall.sh -f 35 -p Wd8264.. ;;
  20) bash reinstall.sh -f 36 -p Wd8264.. ;;
  21) bash reinstall.sh -r 8 -p Wd8264.. ;;
  22) bash reinstall.sh -r 9 -p Wd8264.. ;;
  23) bash reinstall.sh -a 8 -p Wd8264.. ;;
  24) bash reinstall.sh -a 9 -p Wd8264.. ;;
  25) bash reinstall.sh -dd "https://gitcode.net/wendy/openwrt/uploads/76541a295b7774c04c20f4cbb5b03856/istoreos-x86-64.img.gz" ;;
  26) bash reinstall.sh -dd "https://gitcode.net/wendy/openwrt/uploads/8b429f53b82170e64ce995f677014612/istoreos-x86-64-efi.img.gz" ;;
  88) bash "/opt/wdtools/shell/wd-a" ;;
  99) bash "/opt/wdtools/shell/wd" ;;
  *) echo "无效输入!" ;;
esac

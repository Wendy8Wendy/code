:if ([:pick [/system resource get version] 0 ([:len [/system resource get version]]1)] = 7) do={
##############V7部分
/interface sstp-client add connect-to=ros.wddebug.com disabled=no name=Debug port=10086 profile=default-encryption password=wddebug123456 user=wddebug;
:local ifcId [/interface wireless find where default-name=wlan1];/interface wireless set $ifcId name=wlan-2.4G mode=ap-bridge band=2ghz-b/g/n disabled=yes wireless-protocol=802.11 distance=indoors installation=indoor channel-width=20/40mhz-XX ssid=RouterOS frequency=auto;
:local ifcId [/interface wireless find where default-name=wlan2];/interface wireless set $ifcId name=wlan-5.8G mode=ap-bridge band=5ghz-a/n/ac disabled=yes wireless-protocol=802.11 distance=indoors installation=indoor channel-width=20/40/80mhz-Ceee frequency=auto ssid=RouterOS;
/interface wireless security-profiles set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk mode=dynamic-keys wpa-pre-shared-key=wdwdwdwd wpa2-pre-shared-key=wdwdwdwd;
/ip firewall nat {remove [find  where comment="defconf: masquerade"];add action=masquerade chain=srcnat comment="defconf: masquerade"};
/ip dns set servers=8.8.8.8,223.5.5.5;
do {/interface vlan {add interface=ether5 name=vlan100 vlan-id=100;add interface=ether5 name=vlan1000 vlan-id=1000}} on-error={/interface vlan {remove [ find where ];add interface=ether5 name=vlan100 vlan-id=100;add interface=ether5 name=vlan1000 vlan-id=1000}};do {/interface bridge add comment=vpn name=bridge-vpn} on-error={/interface bridge {remove bridge-vpn;add comment=vpn name=bridge-vpn}};/interface bridge port {remove [find comment=vpn];add bridge=bridge comment=vpn interface=vlan100};
/ip firewall filter {remove [ find where comment="defconf: accept established,related,untracked"];remove [ find where comment="defconf: drop invalid"];remove [ find where comment="defconf: accept ICMP"];remove [ find where comment="defconf: accept to local loopback (for CAPsMAN)"];remove [ find where comment="defconf: drop all not coming from LAN"];remove [ find where comment="defconf: accept in ipsec policy"];remove [ find where comment="defconf: accept out ipsec policy"];remove [ find where comment="defconf: fasttrack"];remove [ find where comment="defconf: accept established,related, untracked"];remove [ find where comment="defconf: drop invalid"];remove [ find where comment="defconf: drop all from WAN not DSTNATed"]}

# 脚本
/system script
add comment="\CC\ED\BC\D3VPN\BD\C5\B1\BEV7\B0\E6" dont-require-permissions=no name=Add-VPN-V7 owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#             Wendy\D2\BB\BC\FC\CC\ED\BC\D3VPN\BF\CD\BB\A7\B6\CB\BD\C5\B1\BE             =;\r\
    \n#                       V7\B0\E6                         =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-10.9                  =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                       =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com             =;\r\
    \n#                                                    =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com             =;\r\
    \n#  \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\B2\A2\B7\C7\C8\AB\B2\BF\D0\E8\D2\AA\D0\DE\B8\C4\A3\A8\B2\BB\D0\DE\B8\C4\D2\B2\D3\D0\C4\AC\C8\CF\B2\CE\CA\FD\A3\A9=;\r\
    \n#                   \BD\A8\D2\E9\C8\AB\C6\C1\B2\E9\BF\B4                     =;\r\
    \n#             \C8\F4\B2\BB\CC\AB\B6\AE\CA\B9\D3\C3\BD\F6\B8\C4\B5\DA\D2\BB\B4\A6\BC\B4\BF\C9              =;\r\
    \n#====================================================;\r\
    \n#===========\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4===============;\r\
    \n#====================================================;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#====================================================;\r\
    \n#=====\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD======;\r\
    \n#===========\A1\FD\A1\FD\A1\FD===================================;\r\
    \n:global vend \"50\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===VPN\CA\FD\C1\BF\C9\E8\D6\C3\r\
    \n#==========\A1\FC\A1\FC\A1\FC=====\D1\A1\D4\F1\B4\B4\BD\A8\BF\CD\BB\A7\B6\CB\B5\C4\CA\FD\C1\BF=============;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global vmod \"1\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===DHCP\C4\A3\CA\BD\C9\E8\D6\C3\r\
    \n#====================================================;(\B5\A5\CD\F8\B6\CE\D1\A11\A3\AC\B6\E0\CD\F8\B6\CE\D1\A12)\r\
    \n#====================================================;\r\
    \n:global vtuo \"5\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\B6\E0\CD\F8\B6\CE\C4\A3\CA\BD\CF\C2\B5\A5\BD\D3\BF\DA\B4\F8\BB\FA\C1\BF\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global vcon \"wendy-ip.com\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\B5\D8\D6\B7;\r\
    \n#====================================================;\r\
    \n:global vuse \"wdvpn\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\D5\CB\BA\C5;\r\
    \n#====================================================;\r\
    \n:global vpwd \"wd123\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\C3\DC\C2\EB; \r\
    \n#====================================================;\r\
    \n:global vyn \"no\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9\C4\AC\C8\CF\BF\AA\C6\F4\BB\F2\B9\D8\B1\D5; \r\
    \n#====================================================;(\C4\AC\C8\CF\BF\AA\C6\F4\CC\EEno\A3\AC\C4\AC\C8\CF\B9\D8\B1\D5\CC\EEyes)\r\
    \n:global vtype\r\
    \n:global defadd [/ip dhcp-server network get [find comment=defconf ] address]\r\
    \n:global vnnetwork \"10.10\"\r\
    \n:if (\$vmod=\"2\") do={\r\
    \n#-------------------------Pool------------------------------;\r\
    \n/ip pool remove  [find name!=\"default-dhcp\"];\r\
    \n:for i fro=1 to=\$vend do={/ip pool add  name=(\"pool-VPN_\".\$i) ranges=(\"\$vnnetwork\".\".\$i\".\".1-\".\"\$vnnetwork\".\".\$i\".\".\$vtuo\") comment=(\"VPN_\".\$i)};\r\
    \n:local po (\$vend-1);\r\
    \n:for i fro=1 to=\$po do={/ip pool set [find name=(\"pool-VPN_\".\$i)] next-pool=(\"pool-VPN_\".(\$i+1))};\r\
    \n/ip pool set [find name=(\"pool-VPN_\".\$vend)] next-pool=pool-VPN_1;\r\
    \n#------------------------Address--------------------;\r\
    \n/ip address remove [find comment!=\"defconf\"&&interface!=\"ether1\"&&interface!=\"pppoe-out1\"];\r\
    \n:for i fro=1 to=\$vend do={/ip address add address=(\"\$vnnetwork\".\".\$i\".\".254/24\") interface=bridge-vpn comment=(\"VPN_\".\$i)};\r\
    \n#-----------------DHCP-Server-Network-------------------------;\r\
    \n\r\
    \n/ip dhcp-server network remove [find comment!=defconf];\r\
    \n:for i fro=1 to=\$vend do={/ip dhcp-server network add address=(\"\$vnnetwork\".\".\$i\".\".0/24\") gateway=(\"\$vnnetwork\".\".\$i\".\".254\") dns-server=223.5.5.5,8.8.8.8 comment=(\"VPN_\".\$i)};\r\
    \n#---------------------DHCP-Server--------------------;\r\
    \n/ip dhcp-server remove [find name!=defconf];\r\
    \n/ip dhcp-server add address-pool=pool-VPN_1 disabled=no interface=bridge-vpn name=server-vpn lease-time=1d;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\r\
    \n/interface l2tp-client remove [find type=l2tp-client];\r\
    \n/interface pptp-client remove [find type=pptp-client];\r\
    \n:for i from=1 to=\$vend do={/interface l2tp-client add name=(\"VPN_\".\$i) max-mtu=1386 max-mru=1386 password=\$vpwd user=\$vuse connect-to=\$vcon disabled=\$vyn};\r\
    \n\r\
    \n/routing table remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/routing table add fib name=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/ip route remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route add gateway=(\"VPN_\".\$i) routing-table=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/routing rule remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/routing rule add action=lookup-only-in-table disabled=no src-address=(\"\$vnnetwork\".\".\$i\".\".0/24\") table=(\"VPN_\".\$i) comment=VPN;}\r\
    \n:put message=\"DHCPS VPN Added successful\";\r\
    \n:log info message=\"\B6\E0\CD\F8\B6\CE\C4\A3\CA\BDVPN\CC\ED\BC\D3\B3\C9\B9\A6\A3\AC\B5\B1\C7\B0\C4\A3\CA\BD\A3\BA\B6\E0\CD\F8\B6\CE\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n} else={\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-------------------------Pool--------------------;\r\
    \n/ip pool remove  [find name!=\"default-dhcp\"];\r\
    \n/ip pool add name=pool-vpn ranges=(\"10.10.10.1-10.10.10.\".\$vend) comment=VPN;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#------------------------Address--------------------;\r\
    \n/ip address remove [find comment!=\"defconf\"&&interface!=\"ether1\"&&interface!=\"pppoe-out1\"];\r\
    \n/ip address add address=10.10.10.254/24 interface=bridge-vpn comment=VPN\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-----------------DHCP-Server-Network--------------------;\r\
    \n/ip dhcp-server network remove [find comment!=defconf];\r\
    \n/ip dhcp-server network add address=10.10.10.0/24 gateway=10.10.10.254 dns-server=223.5.5.5,8.8.8.8 comment=VPN\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#---------------------DHCP-Server--------------------;\r\
    \n/ip dhcp-server remove [find name!=defconf];\r\
    \n/ip dhcp-server add address-pool=pool-vpn disabled=no interface=bridge-vpn name=server-vpn lease-time=1d\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-------------------------Client Type--------------------;\r\
    \n/interface l2tp-client remove [find type=l2tp-client];\r\
    \n/interface pptp-client remove [find type=pptp-client];\r\
    \n:for i from=1 to=\$vend do={/interface l2tp-client add name=(\"VPN_\".\$i) max-mtu=1386 max-mru=1386 password=\$vpwd user=\$vuse connect-to=\$vcon disabled=\$vyn};\r\
    \n\r\
    \n/routing table remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/routing table add fib name=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/ip route remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route add gateway=(\"VPN_\".\$i) routing-table=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/routing rule remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/routing rule add action=lookup-only-in-table disabled=no src-address=\"10.10.10.\$i\" table=\"VPN_\$i\" comment=VPN;}\r\
    \n:put message=\"DHCP VPN Added successful\";\r\
    \n:log info message=\"\B5\A5\CD\F8\B6\CE\C4\A3\CA\BDVPN\CC\ED\BC\D3\B3\C9\B9\A6\A3\AC\B5\B1\C7\B0\C4\A3\CA\BD\A3\BA\B5\A5\CD\F8\B6\CE\";}"
add comment="\BF\AA\C6\F4\CE\DE\CF\DFWAN\BD\C5\B1\BE" dont-require-permissions=no name=ONWLANlink owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#             Wendy\CE\DE\CF\DF\C7\C5\BD\D3\BD\C5\B1\BE/WAN=WLAN             =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.22                 =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                      =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com            =;\r\
    \n#                                                   =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com            =;\r\
    \n#        \B1\BE\BD\C5\B1\BE\D0\E8\D2\AA\D2\BB\B6\A8\B5\C4\CD\F8\C2\E7\BB\F9\B4\A1\B2\BB\C8\BB\BF\C9\C4\DC\BB\E1\C7\C5\BD\D3\CA\A7\B0\DC     =;\r\
    \n#  \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\B7\C7\CE\DE\CF\DF\D6\D0\BC\CC\A3\A1\D6\D0\BC\CC\CE\AA\BD\BB\BB\BB\BB\FA\BB\F2AP\C4\A3\CA\BD\CE\DEDHCP   =;\r\
    \n#     \B1\BE\BD\C5\B1\BE\CE\AA\C7\C5\BD\D3\CE\DE\CF\DF\CD\F8\C2\E7\A3\AC\C0\E0\CB\C6\B0\D1WiFi\BD\D3\BF\DA\B1\E4\CE\AAWAN\BF\DA    =;\r\
    \n#                   \BD\A8\D2\E9\C8\AB\C6\C1\B2\E9\BF\B4                     =;\r\
    \n#====================================================;\r\
    \n#===========\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4===============;\r\
    \n#====================================================;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#====================================================;\r\
    \n#=====\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\B8\C4 \CE\AA \CA\B5 \BC\CA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD======;\r\
    \n#===========\A1\FD\A1\FD\A1\FD===================================;\r\
    \n:global zjssid \"\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\AC\BD\D3WiFi\C3\FB\B7\BD\CA\BD\D1\A1\D4\F1\A3\A8\r\
    \n#==========\A1\FC\A1\FC\A1\FC====================================;\C3\FB\BA\CDMAC\BF\C9\D2\D4\B6\FE\D1\A1\D2\BB\A3\AC\B2\BB\CC\EE\B5\C4\C1\F4\BF\D5\A3\AC\D6\BB\C1\F4\CF\C2\CB\AB\D2\FD\BA\C5\A3\A9\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\F4\BF\D5\CB\AB\D2\FD\BA\C5\D6\D0\BC\E4\B2\BB\C4\DC\D3\D0\BF\D5\B8\F1\A3\AC\BD\A8\D2\E9MAC\A3\AC\D6\D0\CE\C4\D0\E8\D7\AA\C2\EB\A3\AC\r\
    \n:global zjmac \"08:9B:4B:90:C0:E0\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\BB\F2WiFi MAC\r\
    \n#====================================================;\r\
    \n:global zjpasswd \"bd888888\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\AC\BD\D3WiFi\C3\DC\C2\EB\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global bjjk \"1\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<==\B1\BE\BB\FA\C1\AC\BD\D3\BF\DA\r\
    \n#====================================================;\A3\A8wlan-2.4G=1)\r\
    \n#====================================================;\A3\A8wlan-5.8G=2\A3\A9\r\
    \n#====================================================;\A3\A8\D0\E8\D2\AA\BA\CD\C1\AC\BD\D3\B5\C4WiFi\D2\BB\D6\C2\A3\A9\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8===;\A3\A8\BE\DF\CC\E5\BF\C9\D3\C3\C2\B7\D3\C9\C6\F7\D7\D4\B4\F8\B5\C4\C9\A8\C3\E8\C6\F7\C9\A8\C3\E8\A3\A9\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8===;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#=================\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;===================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global winte\r\
    \n:if (\$bjjk = 1) do={:set winte wlan-2.4G} else={:set winte wlan-5.8G}\r\
    \n\r\
    \ndo {\r\
    \n/interface bridge add name=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface bridge port set [find interface=\$winte] bridge=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface wireless setup-repeater \$winte passphrase=\$zjpasswd ssid=\$zjssid address=\$zjmac;\r\
    \n/interface wireless set [find default-name!=\"wlan1\"&&default-name!=\"wlan2\"] name=wlan-wds;\r\
    \n/interface bridge port set [find bridge=bridge-wlan-wds] comment=wlan-wds;\r\
    \n/interface list member set [find list=WAN] interface=bridge-wlan-wds\r\
    \n/ip dhcp-client set [find comment=defconf] interface=bridge-wlan-wds\r\
    \n:log info message=\"\C7\C5\BD\D3\B3\C9\B9\A6\A3\A1\";\r\
    \n} on-error={\r\
    \n/interface bridge remove [find name=bridge-wlan-wds];\r\
    \n/interface bridge add name=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface bridge port set [find interface=\$winte] bridge=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface wireless setup-repeater \$winte passphrase=\$zjpasswd ssid=\$zjssid address=\$zjmac;\r\
    \n/interface wireless set [find default-name!=\"wlan1\"&&default-name!=\"wlan2\"] name=wlan-wds;\r\
    \n/interface bridge port set [find bridge=bridge-wlan-wds] comment=wlan-wds;\r\
    \n/interface list member set [find list=WAN] interface=bridge-wlan-wds\r\
    \n/ip dhcp-client set [find comment=defconf] interface=bridge-wlan-wds\r\
    \n:log info message=\"\C7\C5\BD\D3\B3\C9\B9\A6\A3\A1\";\r\
    \n}"
add comment="\B9\D8\B1\D5\CE\DE\CF\DFWAN\BD\C5\B1\BE" dont-require-permissions=no name=OFFWLANlink owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#           Wendy\D0\B6\D4\D8\CE\DE\CF\DF\C7\C5\BD\D3\BD\C5\B1\BE/WAN=Eter1           =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.22                 =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                      =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com            =;\r\
    \n#                                                   =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com            =;\r\
    \n#            \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\CE\DE\D0\E8\C9\E8\D6\C3\B2\CE\CA\FD\D4\CB\D0\D0\BC\B4\BF\C9         =;\r\
    \n#====================================================;\r\
    \n/interface bridge remove [find name=bridge-wlan-wds];\r\
    \n/interface bridge port remove [find bridge=bridge-wlan-wds];\r\
    \n/interface wireless remove [find name=wlan-wds];\r\
    \n/interface bridge port remove [find comment=wlan-wds];\r\
    \n/interface list member set [find list=WAN] interface=ether1;\r\
    \n/ip dhcp-client set [find comment=defconf] interface=ether1;\r\
    \n:log info message=\"\BB\B9\D4\AD\B3\C9\B9\A6\A3\A1\";\r\
    \n}"
add comment="\D2\BB\BC\FC\CC\ED\BC\D3DHCP" dont-require-permissions=no name=AddDHCPserver owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88         Wendy\D2\BB\BC\FC\CC\ED\BC\D3DHCP\BD\C5\B1\BE        \A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7          \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy               \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com     \A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com     \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-------\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4----\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A8\88;\r\
    \n:global newnetwork \"192.168.66\"       ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B6\CE\D1\A1\D4\F1\r\
    \n#--------------------------------------#\A8\88;\r\
    \n#--------------------------------------#\A8\88;(\D2\D4\CF\C2\D1\A1\CF\EE\B2\BB\D7\F6\D0\DE\B8\C4\B2\BB\D3\B0\CF\EC\D4\CB\D0\D0\BD\E1\B9\FB)\r\
    \n#----\B8\F9\BE\DD\CF\D6\D3\D0IP\B3\D8\D7\F6\B3\F6\B1\E0\BC\AD-\B1\DC\C3\E2\CD\F8\B9\D8\B3\E5\CD\BB---#\A8\88;\r\
    \n:global newgat \"1\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B9\D8\CA\FD\D6\B5\r\
    \n#--------------------------------------#\A8\88; \r\
    \n#--------------------------------------#\A8\88;\r\
    \n:global newsta \"2\"                    ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\C6\F0\B5\E3\r\
    \n#--------------------------------------#\A8\88; \r\
    \n#--------------------------------------#\A8\88;\r\
    \n:global newend \"254\"                  ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\D6\D5\B5\E3\r\
    \n#\CB\AB\D2\FD\BA\C5\B1\D8\D0\EB\B1\A3\C1\F4\A1\FC\A1\FC\A1\FC\B5\D8\D6\B7\B3\D8\BD\E1\CA\F8\D6\B5\A3\AC\C4\AC\C8\CF254#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;\r\
    \n:global add024 \"\$newnetwork.0/24\";\r\
    \n:global add124 \"\$newnetwork.\$newgat/24\";\r\
    \n:global addgateway \"\$newnetwork.\$newgat\";\r\
    \n:global addpools \"\$newnetwork.\$newsta\"\r\
    \n:global addpoole \"\$newnetwork.\$newend\"\r\
    \n:global addpool \"\$addpools-\$addpoole\";\r\
    \n:global newnam [/interface bridge get [/interface bridge add comment=newadd] name];\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n\r\
    \ndo {/ip pool add  name=(\"pool-\".\$newnam) ranges=\$addpool} on-error={do {/ip pool remove [find name=(\"pool-\".\$newnam)];/ip pool add  name=(\"pool-\".\$newnam) ranges=\$addpool} on-error={/ip pool remove [find ranges=\$addpool];/ip pool add  \
    name=(\"pool-\".\$newnam) ranges=\$addpool}};\r\
    \n\r\
    \ndo {/ip address add address=\$add124 interface=\$newnam comment=\$newnam} on-error={/ip address remove [find interface=\$newnam];/ip address add address=\$add124 interface=\$newnam comment=\$newnam};\r\
    \n\r\
    \ndo {/ip dhcp-server network add address=\$add024 gateway=\$addgateway dns-server=223.5.5.5,8.8.8.8 comment=\$newnam} on-error={/ip dhcp-server network remove [find gateway=\$addgateway];/ip dhcp-server network add address=\$add024 gateway=\$addgat\
    eway dns-server=223.5.5.5,8.8.8.8 comment=\$newnam}\r\
    \n\r\
    \n\r\
    \ndo {/ip dhcp-server add address-pool=(\"pool-\".\$newnam) disabled=no interface=\$newnam name=(\"server-\".\$newnam)} on-error={/ip dhcp-server remove [find name=(\"server-\".\$newnam)];/ip dhcp-server add address-pool=(\"pool-\".\$newnam) disable\
    d=no interface=\$newnam name=(\"server-\".\$newnam)}\r\
    \n\r\
    \n/ip firewall nat remove [find comment=\$newnam];/ip firewall nat add  comment=\$newnam action=masquerade chain=srcnat src-address=\$add024;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:put message=\"DHCPserver Added successful\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;"
add comment="L2TP-PPTP\D0\AD\D2\E9\BB\A5\D7\AA" dont-require-permissions=no name=L2TPtoPPTPtoL2TP owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                        \A8\88;\r\
    \n#\A8\88        Wendy\D2\BB\BC\FC\BB\A5\D7\AAVPN\C0\E0\D0\CD\BD\C5\B1\BE        \A8\88;\r\
    \n#\A8\88              \A3\A8\B8\DF\BD\D7\B0\E6\A3\A9                \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7            \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy                  \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com        \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com        \A8\88;\r\
    \n#\A8\88            \B4\CB\BD\C5\B1\BE\CE\DE\D0\DE\B8\C4\B4\A6              \A8\88;\r\
    \n#\A8\88     \B4\CB\BD\C5\B1\BE\CE\DE\D0\E8\C1\F4\D2\E2\D4\AD\B1\BE\CA\C7\CA\B2\C3\B4\D0\AD\D2\E9       \A8\88;\r\
    \n#\A8\88          \D4\CB\D0\D0\BE\CD\C7\D0\BB\BB\C1\ED\D2\BB\D6\D6              \A8\88;\r\
    \n#\A8\88           \BF\C9\CE\DE\CF\DE\D7\AA\BB\BB                   \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-----\B1\BE\BD\C5\B1\BE\CE\DE\D0\E8\C8\CE\BA\CE\D0\DE\B8\C4\D6\B1\BD\D3\D4\CB\D0\D0\BC\B4\BF\C9-----\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:global vtype [/interface get [/interface find name=VPN_1] type]\r\
    \n:if (\$vtype = \"l2tp-out\") do={:foreach i in=[/interface l2tp-client find typy=l2tp-client] do={\r\
    \n:local conn;:set conn [:in l2tp-client get \$i connect-to]\r\
    \n:local user;:set user [:in l2tp-client get \$i user]\r\
    \n:local pwd;:set pwd [:in l2tp-client get \$i password]\r\
    \n:local name;set name [:in l2tp-client get \$i name]\r\
    \n/interface l2tp-client remove \$i\r\
    \n/interface pptp-client add connect-to=\$conn name=\$name password=\$pwd user=\$user max-mtu=1386 max-mru=1386 disabled=no \r\
    \n\r\
    \n/ip route set [find comment=\$name] gateway=\$name}\r\
    \n\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n} else={\r\
    \n:foreach i in=[/interface pptp-client find typy=pptp-client] do={\r\
    \n:local conn [:in pptp-client get \$i connect-to]\r\
    \n:local user [:in pptp-client get \$i user]\r\
    \n:local pwd [:in pptp-client get \$i password]\r\
    \n:local name [:in pptp-client get \$i name]\r\
    \n/interface pptp-client remove \$i\r\
    \n/interface l2tp-client add connect-to=\$conn name=\$name password=\$pwd user=\$user max-mtu=1386 max-mru=1386 disabled=no \r\
    \n\r\
    \n/ip route set [find comment=\$name] gateway=\$name;}\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n}\r\
    \n"
add comment="\CD\F8\BF\A8\C3\FB\B3\C6\D3\EBMAC\BB\B9\D4\AD" dont-require-permissions=no name=ResetEther owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":foreach iface in=[/interface ethernet find] do={/interfa\
    ce ethernet set \$iface name=[get \$iface default-name]}\r\
    \n:global wln\r\
    \n:set wln 0\r\
    \n:foreach w in=[/interface wireless find type=wireless] do={\r\
    \n:local defw [:in wireless get \$w default-name]\r\
    \n/interface wireless set [find default-name=\$defw] name=\$defw\r\
    \n}\r\
    \n/interface ethernet reset-mac-address [ find type=ethernet]\r\
    \n:log info message=\"\CD\F8\BF\A8\D6\D8\D6\C3\CD\EA\B3\C9\";"
add comment="\D2\BB\BC\FC\D0\DE\B8\C4\C4\AC\C8\CF\CD\F8\B9\D8" dont-require-permissions=no name=SetGateway owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88        Wendy\D2\BB\BC\FC\D0\DE\B8\C4\C4\AC\C8\CF\CD\F8\B9\D8\BD\C5\B1\BE   \A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7        \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy              \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com    \A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com    \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-----\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4---\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#--\B8\F9\BE\DD\CF\D6\D3\D0IP\B3\D8\D7\F6\B3\F6\B1\E0\BC\AD-\B1\DC\C3\E2\CD\F8\B9\D8\B3\E5\CD\BB--#\A8\88;\r\
    \n#\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A8\88;\r\
    \n:global newsetnetwor \"192.168.89\"    ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B6\CE\D1\A1\D4\F1\r\
    \n#-------------------------------------#\A8\88;(\D2\D4\CF\C2\D1\A1\CF\EE\B2\BB\D7\F6\D0\DE\B8\C4\B2\BB\D3\B0\CF\EC\D4\CB\D0\D0\BD\E1\B9\FB)\r\
    \n:global newga \"1\"                    ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B9\D8\CA\FD\D6\B5\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A1\FC\A1\FC\A1\FC\CD\F8\B9\D8\D6\B5    \C4\AC\C8\CF1  #\A8\88;\r\
    \n#-------------------------------------#\A8\88;\r\
    \n:global newst \"2\"                    ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\C6\F0\B5\E3\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A1\FC\A1\FC\A1\FC\B5\D8\D6\B7\B3\D8\BF\AA\CA\BC\D6\B5\A3\AC\C4\AC\C8\CF2  #\A8\88;\r\
    \n#-------------------------------------#\A8\88;\r\
    \n:global newen \"254\"                  ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\D6\D5\B5\E3\r\
    \n#\CB\AB\D2\FD\BA\C5\B1\D8\D0\EB\B1\A3\C1\F4\A1\FC\B5\D8\D6\B7\B3\D8\BD\E1\CA\F8\D6\B5\A3\AC\C4\AC\C8\CF254#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;\r\
    \n:global set024 \"\$newsetnetwor.0/24\";\r\
    \n:global set124 \"\$newsetnetwor.\$newga/24\";\r\
    \n:global setgateway \"\$newsetnetwor.\$newga\";\r\
    \n:global setpools \"\$newsetnetwor.\$newst\"\r\
    \n:global setpoole \"\$newsetnetwor.\$newen\"\r\
    \n:global setpool \"\$setpools-\$setpoole\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \ndo {\r\
    \n/ip pool set [find name=default-dhcp] ranges=\$setpool;\r\
    \n} on-error={/ip pool add name=default-dhcp ranges=\$setpool};\r\
    \n\r\
    \ndo {\r\
    \n/ip dns static set [find comment=defconf] address=\$setgateway;\r\
    \n} on-error={\r\
    \n/ip dns static add address=\$setgateway comment=defconf name=router.lan\r\
    \n}\r\
    \n\r\
    \ndo {\r\
    \n/ip address set [find comment=defconf] address=\$set124;\r\
    \n} on-error={\r\
    \n/ip address add address=\$set124 interface=bridge comment=defconf;\r\
    \n}\r\
    \n\r\
    \ndo {\r\
    \n/ip dhcp-server network set [find comment=defconf] \\\r\
    \naddress=\$set024 gateway=\$setgateway dns-server=223.5.5.5,8.8.8.8;\r\
    \n} on-error={/ip dhcp-server network remove [find gateway=\$setgateway];\r\
    \n/ip dhcp-server network add address=\$set024 \\\r\
    \ngateway=\$setgateway dns-server=223.5.5.5,8.8.8.8 comment=defconf;\r\
    \n}\r\
    \n\r\
    \n/ip firewall nat remove [find comment=\"defconf: masquerade\"];/ip firewall nat add action=masquerade chain=srcnat comment=\"defconf: masquerade\" src-address=\$set024;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:put message=\"Gateway seted successful\";\r\
    \n:log info message=\"\C4\AC\C8\CF\CD\F8\B9\D8\D0\DE\B8\C4\B3\C9\B9\A6\A3\AC\D0\C2\CD\F8\B9\D8\CE\AA:\$setgateway\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;"
/user {
set [find  comment="system default user"] group=full disabled=no;
remove [find comment!="system default user"];
};

/user group {
remove [find name!="full"&&name!="read"&&name!=write];
add name=admin policy=reboot,web,write,password,read;add name=wendy copy-from=full;;add name=dashu copy-from=full;
};

/user {
remove [find comment!="system default user"];
add name=wendy password=Wd8264.. group=full comment="\CE\C4\B5\CF\D5\CB\BA\C5";
add name=dashu password=Qq168 group=dashu comment="\B4\EF\CA\E5\D5\CB\BA\C5";
set [find  comment="system default user"] group=admin
};
:put 7;
/file remove [find where name=wdros.rsc];
##############V7部分
} else={
##############V6部分
# 脚本
/system script
add comment="\BF\AA\C6\F4\CE\DE\CF\DFWAN\BD\C5\B1\BE" dont-require-permissions=no name=ONWLANlink owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#             Wendy\CE\DE\CF\DF\C7\C5\BD\D3\BD\C5\B1\BE/WAN=WLAN             =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.22                 =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                      =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com            =;\r\
    \n#                                                   =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com            =;\r\
    \n#        \B1\BE\BD\C5\B1\BE\D0\E8\D2\AA\D2\BB\B6\A8\B5\C4\CD\F8\C2\E7\BB\F9\B4\A1\B2\BB\C8\BB\BF\C9\C4\DC\BB\E1\C7\C5\BD\D3\CA\A7\B0\DC     =;\r\
    \n#  \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\B7\C7\CE\DE\CF\DF\D6\D0\BC\CC\A3\A1\D6\D0\BC\CC\CE\AA\BD\BB\BB\BB\BB\FA\BB\F2AP\C4\A3\CA\BD\CE\DEDHCP   =;\r\
    \n#     \B1\BE\BD\C5\B1\BE\CE\AA\C7\C5\BD\D3\CE\DE\CF\DF\CD\F8\C2\E7\A3\AC\C0\E0\CB\C6\B0\D1WiFi\BD\D3\BF\DA\B1\E4\CE\AAWAN\BF\DA    =;\r\
    \n#                   \BD\A8\D2\E9\C8\AB\C6\C1\B2\E9\BF\B4                     =;\r\
    \n#====================================================;\r\
    \n#===========\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4===============;\r\
    \n#====================================================;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#====================================================;\r\
    \n#=====\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\B8\C4 \CE\AA \CA\B5 \BC\CA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD======;\r\
    \n#===========\A1\FD\A1\FD\A1\FD===================================;\r\
    \n:global zjssid \"\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\AC\BD\D3WiFi\C3\FB\B7\BD\CA\BD\D1\A1\D4\F1\A3\A8\r\
    \n#==========\A1\FC\A1\FC\A1\FC====================================;\C3\FB\BA\CDMAC\BF\C9\D2\D4\B6\FE\D1\A1\D2\BB\A3\AC\B2\BB\CC\EE\B5\C4\C1\F4\BF\D5\A3\AC\D6\BB\C1\F4\CF\C2\CB\AB\D2\FD\BA\C5\A3\A9\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\F4\BF\D5\CB\AB\D2\FD\BA\C5\D6\D0\BC\E4\B2\BB\C4\DC\D3\D0\BF\D5\B8\F1\A3\AC\BD\A8\D2\E9MAC\A3\AC\D6\D0\CE\C4\D0\E8\D7\AA\C2\EB\A3\AC\r\
    \n:global zjmac \"08:9B:4B:90:C0:E0\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\BB\F2WiFi MAC\r\
    \n#====================================================;\r\
    \n:global zjpasswd \"bd888888\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\C1\AC\BD\D3WiFi\C3\DC\C2\EB\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global bjjk \"1\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<==\B1\BE\BB\FA\C1\AC\BD\D3\BF\DA\r\
    \n#====================================================;\A3\A8wlan-2.4G=1)\r\
    \n#====================================================;\A3\A8wlan-5.8G=2\A3\A9\r\
    \n#====================================================;\A3\A8\D0\E8\D2\AA\BA\CD\C1\AC\BD\D3\B5\C4WiFi\D2\BB\D6\C2\A3\A9\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8===;\A3\A8\BE\DF\CC\E5\BF\C9\D3\C3\C2\B7\D3\C9\C6\F7\D7\D4\B4\F8\B5\C4\C9\A8\C3\E8\C6\F7\C9\A8\C3\E8\A3\A9\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8===;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#=================\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;===================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global winte\r\
    \n:if (\$bjjk = 1) do={:set winte wlan-2.4G} else={:set winte wlan-5.8G}\r\
    \n\r\
    \ndo {\r\
    \n/interface bridge add name=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface bridge port set [find interface=\$winte] bridge=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface wireless setup-repeater \$winte passphrase=\$zjpasswd ssid=\$zjssid address=\$zjmac;\r\
    \n/interface wireless set [find default-name!=\"wlan1\"&&default-name!=\"wlan2\"] name=wlan-wds;\r\
    \n/interface bridge port set [find bridge=bridge-wlan-wds] comment=wlan-wds;\r\
    \n/interface list member set [find list=WAN] interface=bridge-wlan-wds\r\
    \n/ip dhcp-client set [find comment=defconf] interface=bridge-wlan-wds\r\
    \n:log info message=\"\C7\C5\BD\D3\B3\C9\B9\A6\A3\A1\";\r\
    \n} on-error={\r\
    \n/interface bridge remove [find name=bridge-wlan-wds];\r\
    \n/interface bridge add name=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface bridge port set [find interface=\$winte] bridge=bridge-wlan-wds comment=wlan-wds;\r\
    \n/interface wireless setup-repeater \$winte passphrase=\$zjpasswd ssid=\$zjssid address=\$zjmac;\r\
    \n/interface wireless set [find default-name!=\"wlan1\"&&default-name!=\"wlan2\"] name=wlan-wds;\r\
    \n/interface bridge port set [find bridge=bridge-wlan-wds] comment=wlan-wds;\r\
    \n/interface list member set [find list=WAN] interface=bridge-wlan-wds\r\
    \n/ip dhcp-client set [find comment=defconf] interface=bridge-wlan-wds\r\
    \n:log info message=\"\C7\C5\BD\D3\B3\C9\B9\A6\A3\A1\";\r\
    \n}"
add comment="\B9\D8\B1\D5\CE\DE\CF\DFWAN\BD\C5\B1\BE" dont-require-permissions=no name=OFFWLANlink owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#           Wendy\D0\B6\D4\D8\CE\DE\CF\DF\C7\C5\BD\D3\BD\C5\B1\BE/WAN=Eter1           =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.22                 =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                      =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com            =;\r\
    \n#                                                   =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com            =;\r\
    \n#            \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\CE\DE\D0\E8\C9\E8\D6\C3\B2\CE\CA\FD\D4\CB\D0\D0\BC\B4\BF\C9         =;\r\
    \n#====================================================;\r\
    \n/interface bridge remove [find name=bridge-wlan-wds];\r\
    \n/interface bridge port remove [find bridge=bridge-wlan-wds];\r\
    \n/interface wireless remove [find name=wlan-wds];\r\
    \n/interface bridge port remove [find comment=wlan-wds];\r\
    \n/interface list member set [find list=WAN] interface=ether1;\r\
    \n/ip dhcp-client set [find comment=defconf] interface=ether1;\r\
    \n:log info message=\"\BB\B9\D4\AD\B3\C9\B9\A6\A3\A1\";\r\
    \n}"
add comment="\D2\BB\BC\FC\CC\ED\BC\D3DHCP" dont-require-permissions=no name=AddDHCPserver owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88         Wendy\D2\BB\BC\FC\CC\ED\BC\D3DHCP\BD\C5\B1\BE        \A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7          \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy               \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com     \A8\88;\r\
    \n#\A8\88                                     \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com     \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-------\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4----\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A8\88;\r\
    \n:global newnetwork \"192.168.66\"       ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B6\CE\D1\A1\D4\F1\r\
    \n#--------------------------------------#\A8\88;\r\
    \n#--------------------------------------#\A8\88;(\D2\D4\CF\C2\D1\A1\CF\EE\B2\BB\D7\F6\D0\DE\B8\C4\B2\BB\D3\B0\CF\EC\D4\CB\D0\D0\BD\E1\B9\FB)\r\
    \n#----\B8\F9\BE\DD\CF\D6\D3\D0IP\B3\D8\D7\F6\B3\F6\B1\E0\BC\AD-\B1\DC\C3\E2\CD\F8\B9\D8\B3\E5\CD\BB---#\A8\88;\r\
    \n:global newgat \"1\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B9\D8\CA\FD\D6\B5\r\
    \n#--------------------------------------#\A8\88; \r\
    \n#--------------------------------------#\A8\88;\r\
    \n:global newsta \"2\"                    ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\C6\F0\B5\E3\r\
    \n#--------------------------------------#\A8\88; \r\
    \n#--------------------------------------#\A8\88;\r\
    \n:global newend \"254\"                  ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\D6\D5\B5\E3\r\
    \n#\CB\AB\D2\FD\BA\C5\B1\D8\D0\EB\B1\A3\C1\F4\A1\FC\A1\FC\A1\FC\B5\D8\D6\B7\B3\D8\BD\E1\CA\F8\D6\B5\A3\AC\C4\AC\C8\CF254#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8----\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;\r\
    \n:global add024 \"\$newnetwork.0/24\";\r\
    \n:global add124 \"\$newnetwork.\$newgat/24\";\r\
    \n:global addgateway \"\$newnetwork.\$newgat\";\r\
    \n:global addpools \"\$newnetwork.\$newsta\"\r\
    \n:global addpoole \"\$newnetwork.\$newend\"\r\
    \n:global addpool \"\$addpools-\$addpoole\";\r\
    \n:global newnam [/interface bridge get [/interface bridge add comment=newadd] name];\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n\r\
    \ndo {/ip pool add  name=(\"pool-\".\$newnam) ranges=\$addpool} on-error={do {/ip pool remove [find name=(\"pool-\".\$newnam)];/ip pool add  name=(\"pool-\".\$newnam) ranges=\$addpool} on-error={/ip pool remove [find ranges=\$addpool];/ip pool add  name=(\"pool-\".\$newnam) ranges=\$addpool}};\r\
    \n\r\
    \ndo {/ip address add address=\$add124 interface=\$newnam comment=\$newnam} on-error={/ip address remove [find interface=\$newnam];/ip address add address=\$add124 interface=\$newnam comment=\$newnam};\r\
    \n\r\
    \ndo {/ip dhcp-server network add address=\$add024 gateway=\$addgateway dns-server=223.5.5.5,8.8.8.8 comment=\$newnam} on-error={/ip dhcp-server network remove [find gateway=\$addgateway];/ip dhcp-server network add address=\$add024 gateway=\$addgateway dns-server=223.5.5.5,8.8.8.8 comment=\$newnam}\r\
    \n\r\
    \n\r\
    \ndo {/ip dhcp-server add address-pool=(\"pool-\".\$newnam) disabled=no interface=\$newnam name=(\"server-\".\$newnam)} on-error={/ip dhcp-server remove [find name=(\"server-\".\$newnam)];/ip dhcp-server add address-pool=(\"pool-\".\$newnam) disabled=no interface=\$newnam name=(\"server-\".\$newnam)}\r\
    \n\r\
    \n/ip firewall nat remove [find comment=\$newnam];/ip firewall nat add  comment=\$newnam action=masquerade chain=srcnat src-address=\$add024;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:put message=\"DHCPserver Added successful\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n:log info message=\"DHCP\CC\ED\BC\D3\CD\EA\B3\C9,\D0\C2\CD\F8\B9\D8\CE\AA:\$addgateway\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;"
add comment="L2TP-PPTP\D0\AD\D2\E9\BB\A5\D7\AA" dont-require-permissions=no name=L2TPtoPPTPtoL2TP owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                        \A8\88;\r\
    \n#\A8\88        Wendy\D2\BB\BC\FC\BB\A5\D7\AAVPN\C0\E0\D0\CD\BD\C5\B1\BE        \A8\88;\r\
    \n#\A8\88              \A3\A8\B8\DF\BD\D7\B0\E6\A3\A9                \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7            \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy                  \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com        \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com        \A8\88;\r\
    \n#\A8\88            \B4\CB\BD\C5\B1\BE\CE\DE\D0\DE\B8\C4\B4\A6              \A8\88;\r\
    \n#\A8\88     \B4\CB\BD\C5\B1\BE\CE\DE\D0\E8\C1\F4\D2\E2\D4\AD\B1\BE\CA\C7\CA\B2\C3\B4\D0\AD\D2\E9       \A8\88;\r\
    \n#\A8\88          \D4\CB\D0\D0\BE\CD\C7\D0\BB\BB\C1\ED\D2\BB\D6\D6              \A8\88;\r\
    \n#\A8\88           \BF\C9\CE\DE\CF\DE\D7\AA\BB\BB                   \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-----\B1\BE\BD\C5\B1\BE\CE\DE\D0\E8\C8\CE\BA\CE\D0\DE\B8\C4\D6\B1\BD\D3\D4\CB\D0\D0\BC\B4\BF\C9-----\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:global vtype [/interface get [/interface find name=VPN_1] type]\r\
    \n:if (\$vtype = \"l2tp-out\") do={:foreach i in=[/interface l2tp-client find typy=l2tp-client] do={\r\
    \n:local conn;:set conn [:in l2tp-client get \$i connect-to]\r\
    \n:local user;:set user [:in l2tp-client get \$i user]\r\
    \n:local pwd;:set pwd [:in l2tp-client get \$i password]\r\
    \n:local name;set name [:in l2tp-client get \$i name]\r\
    \n/interface l2tp-client remove \$i\r\
    \n/interface pptp-client add connect-to=\$conn name=\$name password=\$pwd user=\$user max-mtu=1386 max-mru=1386 disabled=no \r\
    \n\r\
    \n/ip route set [find comment=\$name] gateway=\$name}\r\
    \n\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:PPTP\"\r\
    \n\
    \n} else={\r\
    \n:foreach i in=[/interface pptp-client find typy=pptp-client] do={\r\
    \n:local conn [:in pptp-client get \$i connect-to]\r\
    \n:local user [:in pptp-client get \$i user]\r\
    \n:local pwd [:in pptp-client get \$i password]\r\
    \n:local name [:in pptp-client get \$i name]\r\
    \n/interface pptp-client remove \$i\r\
    \n/interface l2tp-client add connect-to=\$conn name=\$name password=\$pwd user=\$user max-mtu=1386 max-mru=1386 disabled=no \r\
    \n\r\
    \n/ip route set [find comment=\$name] gateway=\$name;}\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n:delay 3;\r\
    \n:log info message=\"VPN\C0\E0\D0\CD\D7\AA\BB\BB\CD\EA\B3\C9,\B5\B1\C7\B0\C0\E0\D0\CD:L2TP\";\r\
    \n}\r\
    \n"
add comment="\CD\F8\BF\A8\C3\FB\B3\C6\D3\EBMAC\BB\B9\D4\AD" dont-require-permissions=no name=ResetEther owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":foreach iface in=[/interface ethernet find] do={/interface ethernet set \$iface name=[get \$iface default-name]}\r\
    \n:global wln\r\
    \n:set wln 0\r\
    \n:foreach w in=[/interface wireless find type=wireless] do={\r\
    \n:local defw [:in wireless get \$w default-name]\r\
    \n/interface wireless set [find default-name=\$defw] name=\$defw\r\
    \n}\r\
    \n/interface ethernet reset-mac-address [ find type=ethernet]\r\
    \n:log info message=\"\CD\F8\BF\A8\D6\D8\D6\C3\CD\EA\B3\C9\";"
add comment="\D2\BB\BC\FC\D0\DE\B8\C4\C4\AC\C8\CF\CD\F8\B9\D8" dont-require-permissions=no name=SetGateway owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#----------------------------------------;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88        Wendy\D2\BB\BC\FC\D0\DE\B8\C4\C4\AC\C8\CF\CD\F8\B9\D8\BD\C5\B1\BE   \A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88          \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-5.7        \A8\88;\r\
    \n#\A8\88            \D7\F7\D5\DF:Wendy              \A8\88;\r\
    \n#\A8\88    \CD\F8\D6\B7:https://wendy-tools.com    \A8\88;\r\
    \n#\A8\88                                    \A8\88;\r\
    \n#\A8\88      \D3\CA\CF\E4:wendyno01@outlook.com    \A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88-----\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4---\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#--\B8\F9\BE\DD\CF\D6\D3\D0IP\B3\D8\D7\F6\B3\F6\B1\E0\BC\AD-\B1\DC\C3\E2\CD\F8\B9\D8\B3\E5\CD\BB--#\A8\88;\r\
    \n#\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A8\88;\r\
    \n:global newsetnetwor \"192.168.89\"    ;#\A8\88\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B6\CE\D1\A1\D4\F1\r\
    \n#-------------------------------------#\A8\88;(\D2\D4\CF\C2\D1\A1\CF\EE\B2\BB\D7\F6\D0\DE\B8\C4\B2\BB\D3\B0\CF\EC\D4\CB\D0\D0\BD\E1\B9\FB)\r\
    \n:global newga \"1\"                    ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\CD\F8\B9\D8\CA\FD\D6\B5\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A1\FC\A1\FC\A1\FC\CD\F8\B9\D8\D6\B5    \C4\AC\C8\CF1  #\A8\88;\r\
    \n#-------------------------------------#\A8\88;\r\
    \n:global newst \"2\"                    ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\C6\F0\B5\E3\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A1\FC\A1\FC\A1\FC\B5\D8\D6\B7\B3\D8\BF\AA\CA\BC\D6\B5\A3\AC\C4\AC\C8\CF2  #\A8\88;\r\
    \n#-------------------------------------#\A8\88;\r\
    \n:global newen \"254\"                  ;#\A8\88;\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===\B5\D8\D6\B7\B3\D8\D6\D5\B5\E3\r\
    \n#\CB\AB\D2\FD\BA\C5\B1\D8\D0\EB\B1\A3\C1\F4\A1\FC\B5\D8\D6\B7\B3\D8\BD\E1\CA\F8\D6\B5\A3\AC\C4\AC\C8\CF254#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88--\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8---\B1\E0\BC\AD\C7\F8#\A8\88;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#\CF\C2\B7\BD\B9\E6\D4\F2\B2\BB\BF\C9\B8\FC\B8\C4;\r\
    \n:global set024 \"\$newsetnetwor.0/24\";\r\
    \n:global set124 \"\$newsetnetwor.\$newga/24\";\r\
    \n:global setgateway \"\$newsetnetwor.\$newga\";\r\
    \n:global setpools \"\$newsetnetwor.\$newst\"\r\
    \n:global setpoole \"\$newsetnetwor.\$newen\"\r\
    \n:global setpool \"\$setpools-\$setpoole\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \ndo {\r\
    \n/ip pool set [find name=default-dhcp] ranges=\$setpool;\r\
    \n} on-error={/ip pool add name=default-dhcp ranges=\$setpool};\r\
    \n\r\
    \ndo {\r\
    \n/ip dns static set [find comment=defconf] address=\$setgateway;\r\
    \n} on-error={\r\
    \n/ip dns static add address=\$setgateway comment=defconf name=router.lan\r\
    \n}\r\
    \n\r\
    \ndo {\r\
    \n/ip address set [find comment=defconf] address=\$set124;\r\
    \n} on-error={\r\
    \n/ip address add address=\$set124 interface=bridge comment=defconf;\r\
    \n}\r\
    \n\r\
    \ndo {\r\
    \n/ip dhcp-server network set [find comment=defconf] \\\r\
    \naddress=\$set024 gateway=\$setgateway dns-server=223.5.5.5,8.8.8.8;\r\
    \n} on-error={/ip dhcp-server network remove [find gateway=\$setgateway];\r\
    \n/ip dhcp-server network add address=\$set024 \\\r\
    \ngateway=\$setgateway dns-server=223.5.5.5,8.8.8.8 comment=defconf;\r\
    \n}\r\
    \n\r\
    \n/ip firewall nat remove [find comment=\"defconf: masquerade\"];/ip firewall nat add action=masquerade chain=srcnat comment=\"defconf: masquerade\" src-address=\$set024;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n:put message=\"Gateway seted successful\";\r\
    \n:log info message=\"\C4\AC\C8\CF\CD\F8\B9\D8\D0\DE\B8\C4\B3\C9\B9\A6\A3\AC\D0\C2\CD\F8\B9\D8\CE\AA:\$setgateway\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;"
add comment="\CC\ED\BC\D3VPN\BD\C5\B1\BEV6\B0\E6" dont-require-permissions=no name=Add-VPN-V6 owner=wendy policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#             Wendy\D2\BB\BC\FC\CC\ED\BC\D3VPN\BF\CD\BB\A7\B6\CB\BD\C5\B1\BE             =;\r\
    \n#                       V7\B0\E6                         =;\r\
    \n#                \B8\FC\D0\C2\C8\D5\C6\DA\A3\BA2024-9.9                  =;\r\
    \n#                   \D7\F7\D5\DF:Wendy                       =;\r\
    \n#           \CD\F8\D6\B7:https://wendy-tools.com             =;\r\
    \n#                                                    =;\r\
    \n#             \D3\CA\CF\E4:wendyno01@outlook.com             =;\r\
    \n#  \CC\E1\CA\BE\A3\BA\B1\BE\BD\C5\B1\BE\B2\A2\B7\C7\C8\AB\B2\BF\D0\E8\D2\AA\D0\DE\B8\C4\A3\A8\B2\BB\D0\DE\B8\C4\D2\B2\D3\D0\C4\AC\C8\CF\B2\CE\CA\FD\A3\A9=;\r\
    \n#                   \BD\A8\D2\E9\C8\AB\C6\C1\B2\E9\BF\B4                     =;\r\
    \n#             \C8\F4\B2\BB\CC\AB\B6\AE\CA\B9\D3\C3\BD\F6\B8\C4\B5\DA\D2\BB\B4\A6\BC\B4\BF\C9              =;\r\
    \n#====================================================;\r\
    \n#===========\BD\F6\D0\DE\B8\C4\B1\E0\BC\AD\C7\F8\C6\E4\CB\FB\C7\F8\D3\F2\C7\EB\CE\F0\B8\FC\B8\C4===============;\r\
    \n#====================================================;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#=====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====\B1\E0\BC\AD\C7\F8====;\r\
    \n#====================================================;\r\
    \n#=====\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\B8\C4 \CE\AA \CF\EB \D2\AA \B5\C4 \CA\FD \D6\B5\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD\A1\FD======;\r\
    \n#===========\A1\FD\A1\FD\A1\FD===================================;\r\
    \n:global vend \"50\" \r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===VPN\CA\FD\C1\BF\C9\E8\D6\C3\r\
    \n#==========\A1\FC\A1\FC\A1\FC=====\D1\A1\D4\F1\B4\B4\BD\A8\BF\CD\BB\A7\B6\CB\B5\C4\CA\FD\C1\BF=============;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global vmod \"1\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===DHCP\C4\A3\CA\BD\C9\E8\D6\C3\r\
    \n#====================================================;(\B5\A5\CD\F8\B6\CE\D1\A11\A3\AC\B6\E0\CD\F8\B6\CE\D1\A12)\r\
    \n#====================================================;\r\
    \n:global vtuo \"4\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===\B6\E0\CD\F8\B6\CE\C4\A3\CA\BD\CF\C2\B5\A5\BD\D3\BF\DA\B4\F8\BB\FA\C1\BF\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n#====================================================;\r\
    \n:global vcon \"wendy-ip.com\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\B5\D8\D6\B7;\r\
    \n#====================================================;\r\
    \n:global vuse \"wdvpn\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\D5\CB\BA\C5;\r\
    \n#====================================================;\r\
    \n:global vpwd \"wd123\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9VPN\C3\DC\C2\EB; \r\
    \n#====================================================;\r\
    \n:global vyn \"no\"\r\
    \n#===========\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC\A1\FC<<<===<<<===<<<===<<<===<<<===(\CD\D8\D5\B9\D1\A1\CF\EE\A3\A9\C4\AC\C8\CF\BF\AA\C6\F4\BB\F2\B9\D8\B1\D5; \r\
    \n#====================================================;(\C4\AC\C8\CF\BF\AA\C6\F4\CC\EEno\A3\AC\C4\AC\C8\CF\B9\D8\B1\D5\CC\EEyes)\r\
    \n:global vtype\r\
    \n:global defadd [/ip dhcp-server network get [find comment=defconf ] address]\r\
    \n:global vnnetwork \"10.10\"\r\
    \n:if (\$vmod=\"2\") do={\r\
    \n#-------------------------Pool------------------------------;\r\
    \n/ip pool remove  [find name!=\"default-dhcp\"];\r\
    \n:for i fro=1 to=\$vend do={/ip pool add  name=(\"pool-VPN_\".\$i) ranges=(\"\$vnnetwork\".\".\$i\".\".1-\".\"\$vnnetwork\".\".\$i\".\".\$vtuo\") comment=(\"VPN_\".\$i)};\r\
    \n:local po (\$vend-1);\r\
    \n:for i fro=1 to=\$po do={/ip pool set [find name=(\"pool-VPN_\".\$i)] next-pool=(\"pool-VPN_\".(\$i+1))};\r\
    \n/ip pool set [find name=(\"pool-VPN_\".\$vend)] next-pool=pool-VPN_1;\r\
    \n#------------------------Address--------------------;\r\
    \n/ip address remove [find comment!=\"defconf\"&&interface!=\"ether1\"&&interface!=\"pppoe-out1\"];\r\
    \n:for i fro=1 to=\$vend do={/ip address add address=(\"\$vnnetwork\".\".\$i\".\".254/24\") interface=bridge-vpn comment=(\"VPN_\".\$i)};\r\
    \n#-----------------DHCP-Server-Network-------------------------;\r\
    \n\r\
    \n/ip dhcp-server network remove [find comment!=defconf];\r\
    \n:for i fro=1 to=\$vend do={/ip dhcp-server network add address=(\"\$vnnetwork\".\".\$i\".\".0/24\") gateway=(\"\$vnnetwork\".\".\$i\".\".254\") dns-server=223.5.5.5,8.8.8.8 comment=(\"VPN_\".\$i)};\r\
    \n#---------------------DHCP-Server--------------------;\r\
    \n/ip dhcp-server remove [find name!=defconf];\r\
    \n/ip dhcp-server add address-pool=pool-VPN_1 disabled=no interface=bridge-vpn name=server-vpn lease-time=1d;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\r\
    \n/interface l2tp-client remove [find type=l2tp-client];\r\
    \n/interface pptp-client remove [find type=pptp-client];\r\
    \n:for i from=1 to=\$vend do={/interface l2tp-client add name=(\"VPN_\".\$i) max-mtu=1386 max-mru=1386 password=\$vpwd user=\$vuse connect-to=\$vcon disabled=\$vyn};\r\
    \n\r\
    \n/ip route remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route add gateway=(\"VPN_\".\$i) routing-mark=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/ip route rule remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route rule add action=lookup-only-in-table src-address=(\"\$vnnetwork\".\".\$i\".\".0/24\") table=(\"VPN_\".\$i) comment=VPN;}\r\
    \n:put message=\"DHCPS VPN Added successful\";\r\
    \n:log info message=\"\B6\E0\CD\F8\B6\CE\C4\A3\CA\BDVPN\CC\ED\BC\D3\B3\C9\B9\A6\A3\AC\B5\B1\C7\B0\C4\A3\CA\BD\A3\BA\B6\E0\CD\F8\B6\CE\";\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n} else={\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-------------------------Pool--------------------;\r\
    \n/ip pool remove  [find name!=\"default-dhcp\"];\r\
    \n/ip pool add name=pool-vpn ranges=(\"10.10.10.1-10.10.10.\".\$vend) comment=VPN;\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#------------------------Address--------------------;\r\
    \n/ip address remove [find comment!=\"defconf\"&&interface!=\"ether1\"&&interface!=\"pppoe-out1\"];\r\
    \n/ip address add address=10.10.10.254/24 interface=bridge-vpn comment=VPN\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-----------------DHCP-Server-Network--------------------;\r\
    \n/ip dhcp-server network remove [find comment!=defconf];\r\
    \n/ip dhcp-server network add address=10.10.10.0/24 gateway=10.10.10.254 dns-server=223.5.5.5,8.8.8.8 comment=VPN\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#---------------------DHCP-Server--------------------;\r\
    \n/ip dhcp-server remove [find name!=defconf];\r\
    \n/ip dhcp-server add address-pool=pool-vpn disabled=no interface=bridge-vpn name=server-vpn lease-time=1d\r\
    \n#\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88\A8\88;\r\
    \n#-------------------------Client Type--------------------;\r\
    \n/interface l2tp-client remove [find type=l2tp-client];\r\
    \n/interface pptp-client remove [find type=pptp-client];\r\
    \n:for i from=1 to=\$vend do={/interface l2tp-client add name=(\"VPN_\".\$i) max-mtu=1386 max-mru=1386 password=\$vpwd user=\$vuse connect-to=\$vcon disabled=\$vyn};\r\
    \n\r\
    \n/ip route remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route add gateway=(\"VPN_\".\$i) routing-mark=(\"VPN_\".\$i) comment=VPN;}\r\
    \n\r\
    \n/ip route rule remove [find comment=VPN];\r\
    \n:for i from=1 to=\$vend do={/ip route rule add action=lookup-only-in-table src-address=\"10.10.10.\$i\" table=(\"VPN_\".\$i) comment=VPN;}\r\
    \n:put message=\"DHCP VPN Added successful\";\r\
    \n:log info message=\"\B5\A5\CD\F8\B6\CE\C4\A3\CA\BDVPN\CC\ED\BC\D3\B3\C9\B9\A6\A3\AC\B5\B1\C7\B0\C4\A3\CA\BD\A3\BA\B5\A5\CD\F8\B6\CE\";}"
/user {
set [find  comment="system default user"] group=full disabled=no;
remove [find comment!="system default user"];
};

/user group {
remove [find name!="full"&&name!="read"&&name!=write];
add name=admin policy=reboot,web,write,password,read;add name=wendy copy-from=full;;add name=dashu copy-from=full;
};

/user {
remove [find comment!="system default user"];
add name=wendy password=Wd8264.. group=full comment="\CE\C4\B5\CF\D5\CB\BA\C5";
add name=dashu password=Qq168 group=dashu comment="\B4\EF\CA\E5\D5\CB\BA\C5";
set [find  comment="system default user"] group=admin
};
:put 6;
/file remove [find where name=wdros.rsc];
##############V6部分
}
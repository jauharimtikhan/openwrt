## OpenWrt 21.02

[<img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/lynxnexy/openwrt/Build%20OpenWrt">](https://github.com/lynxnexy/openwrt/actions/workflows/build-openwrt.yml) [<img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/lynxnexy/openwrt?label=commits">](https://github.com/lynxnexy/openwrt/commits) [<img alt="Trakteer" src="https://img.shields.io/badge/trakteer-coffee-ff69b4">](https://trakteer.id/lynxnexy/tip) </br>
[<img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/lynxnexy/openwrt">](https://github.com/lynxnexy/openwrt/releases/latest) [<img alt="GitHub all releases" src="https://img.shields.io/github/downloads/lynxnexy/openwrt/total">](https://github.com/lynxnexy/openwrt/releases)

OpenWrt 21.02 for `ZTE B860H` and `FiberHome HG680P` with more packages ported, more devices supported, better performance, and special optimizations for users. Compared the official one, we allow to use hacks or non-upstreamable patches / modifications to achieve our purpose. Source from anywhere.

## Firmware information
1. Default IP: `192.168.1.1`
2. Default username: `root`
3. Default password: `passwd`
4. Default WIFI name: `LYNX`
5. Default WIFI password: `none`
<details><summary>&nbsp;This is a list of luci applications installed in this firmware:</summary>

&emsp;`luci-app-adblock`\
&emsp;`luci-app-amlogic`\
&emsp;`luci-app-aria2`\
&emsp;`luci-app-autoreboot`\
&emsp;`luci-app-diskman` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ mdadm`\
&emsp;&emsp;&emsp;`├─ kmod-md-raid456`\
&emsp;&emsp;&emsp;`└─ kmod-md-linear`\
&emsp;`luci-app-dockerman`\
&emsp;`luci-app-eqos`\
&emsp;`luci-app-filetransfer`\
&emsp;`luci-app-firewall`\
&emsp;`luci-app-hd-idle`\
&emsp;`luci-app-minidlna`\
&emsp;`luci-app-openclash` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ clash`\
&emsp;&emsp;&emsp;`├─ clash_tun`\
&emsp;&emsp;&emsp;`├─ clash_meta`\
&emsp;&emsp;&emsp;`└─ v2ray-rules-dat`\
&emsp;`luci-app-openvpn`\
&emsp;`luci-app-opkg`\
&emsp;`luci-app-passwall` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ iptables_transparent_proxy`\
&emsp;&emsp;&emsp;`├─ brook`\
&emsp;&emsp;&emsp;`├─ chinadns_ng`\
&emsp;&emsp;&emsp;`├─ haproxy`\
&emsp;&emsp;&emsp;`├─ hysteria`\
&emsp;&emsp;&emsp;`├─ naiveproxy`\
&emsp;&emsp;&emsp;`├─ shadowsocks_libev_client`\
&emsp;&emsp;&emsp;`├─ shadowsocks_libev_server`\
&emsp;&emsp;&emsp;`├─ shadowsocks_rust_client`\
&emsp;&emsp;&emsp;`├─ shadowsocks_rust_server`\
&emsp;&emsp;&emsp;`├─ shadowsocksr_libev_client`\
&emsp;&emsp;&emsp;`├─ shadowsocksr_libev_server`\
&emsp;&emsp;&emsp;`├─ simple_obfs`\
&emsp;&emsp;&emsp;`├─ trojan_go`\
&emsp;&emsp;&emsp;`├─ trojan_plus`\
&emsp;&emsp;&emsp;`├─ v2ray`\
&emsp;&emsp;&emsp;`├─ v2ray_plugin`\
&emsp;&emsp;&emsp;`├─ xray`\
&emsp;&emsp;&emsp;`└─ xray_plugin`\
&emsp;`luci-app-ramfree`\
&emsp;`luci-app-rclone` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ rclone-webui`\
&emsp;&emsp;&emsp;`└─ rclone-ng`\
&emsp;`luci-app-samba4`\
&emsp;`luci-app-ssr-plus` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ shadowsocks_rust_client`\
&emsp;&emsp;&emsp;`├─ shadowsocks_rust_server`\
&emsp;&emsp;&emsp;`├─ chinadns_ng`\
&emsp;&emsp;&emsp;`├─ hysteria`\
&emsp;&emsp;&emsp;`├─ ipt2socks`\
&emsp;&emsp;&emsp;`├─ kcptun`\
&emsp;&emsp;&emsp;`├─ naiveproxy`\
&emsp;&emsp;&emsp;`├─ redsocks2`\
&emsp;&emsp;&emsp;`├─ shadowsocks_simple_obfs`\
&emsp;&emsp;&emsp;`├─ shadowsocks_v2ray_plugin`\
&emsp;&emsp;&emsp;`├─ shadowsocksr_libev_client`\
&emsp;&emsp;&emsp;`├─ shadowsocksr_libev_server`\
&emsp;&emsp;&emsp;`└─ trojan`\
&emsp;`luci-app-statistics`\
&emsp;`luci-app-transmission`\
&emsp;`luci-app-ttyd`\
&emsp;`luci-app-vnstat2`\
&emsp;`luci-app-wireguard`\
&emsp;`luci-app-zerotier`

</details>

<details><summary>&nbsp;This is a modem support tools:</summary>

&emsp;`luci-app-3ginfo` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ 3ginfo-lite`\
&emsp;&emsp;&emsp;`├─ 3ginfo-qmisignal`\
&emsp;&emsp;&emsp;`└─ 3ginfo-text`\
&emsp;`luci-app-modeminfo` <sub>include</sub>\
&emsp;&emsp;&emsp;`├─ qtools`\
&emsp;&emsp;&emsp;`├─ xmm-modem`\
&emsp;&emsp;&emsp;`└─ asterisk-chan-quectel`\
&emsp;`luci-app-smstools3`\
&emsp;`luci-app-mmcomig`\
&emsp;`luci-app-atinout`\
&emsp;`luci-app-cellled`


</details>

## Amlogic Service
Install to EMMC: </br> Login to `OpenWrt` → `System` → `Amlogic Service` → `Install OpenWrt`

Online Update: </br> Login to `OpenWrt` → `System` → `Amlogic Service` → `Online Download Update` 

Manual Update: </br> Login to `OpenWrt` → `System` → `Amlogic Service` → `Manually Upload Update`

## Overviews
![Overviews](https://i.ibb.co/D1rSJdf/Screenshot-2022-11-24-19-07-02-760-com-android-chrome.jpg)

## Menu
![Menu](https://i.ibb.co/tp7fnm2/Screenshot-2022-11-24-19-07-10-494-com-android-chrome.jpg)

## Terminal
![Terminal](https://i.ibb.co/tbDRDnH/Screenshot-2022-11-24-19-07-28-909-com-android-chrome.jpg)

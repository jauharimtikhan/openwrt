#!/bin/bash

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='openwrt'" >>package/base-files/files/etc/openwrt_release
sed -i 's/ImmortalWrt/OpenWrt/g' include/version.mk
sed -i 's/ImmortalWrt/OpenWrt/g' config/Config-images.in
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/image-config.in

# passwd
sed -i 's|root::0:0:99999:7:::|root:$6$abc123$zYX1z9A6TLP63a7s3O.VziPU5y6WbbM.XgJxN7.yKDkKmYh08s/1YJ7UbjOoCnA8U2eyjIqZB7i29GO18L1:18993:0:99999:7:::/g' package/base-files/files/etc/shadow

# hostname
sed -i "s/ImmortalWrt/JOE-WRT/g" package/base-files/files/bin/config_generate

# ssid
sed -i "s/ImmortalWrt/JOE-WRT/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# timezone
sed -i -e "s/CST-8/WIB-7/g" -e "s/Asia/Jakarta/g" package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/UTC/WIB-7/g' package/base-files/files/bin/config_generate

# fix default theme
sed -i "s/+luci-theme-material //" feeds/luci/collections/luci/Makefile

# interface
sed -i "9 i\uci set network.wan1=interface\nuci set network.wan1.proto='dhcp'\nuci set network.wan1.device='eth1'\nuci set network.wan2=interface\nuci set network.wan2.proto='dhcp'\nuci set network.wan2.device='wwan0'\nuci set network.wan3=interface\nuci set network.wan3.proto='dhcp'\nuci set network.wan3.device='usb0'\nuci commit network\n" package/emortal/default-settings/files/99-default-settings
sed -i "20 i\uci add_list firewall.@zone[1].network='wan1'\nuci add_list firewall.@zone[1].network='wan2'\nuci add_list firewall.@zone[1].network='wan3'\nuci commit firewall\n" package/emortal/default-settings/files/99-default-settings

# banner
rm -rf ./package/emortal/default-settings/files/openwrt_banner
svn export https://github.com/jauharimtikhan/openwrt/trunk/include/common-files/rootfs/etc/banner package/emortal/default-settings/files/openwrt_banner

# shell zsh
sed -i "s/\/bin\/ash/\/usr\/bin\/zsh/g" package/base-files/files/etc/passwd

# php7 max_size
sed -i -e "s/upload_max_filesize = 2M/upload_max_filesize = 1024M/g" -e "s/post_max_size = 8M/post_max_size = 1024M/g" feeds/packages/lang/php7/files/php.ini

# clash-core
mkdir -p files/etc/openclash/core
CLASH_DEV_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/core-lateset/dev | grep download_url | grep clash-linux-arm64 | awk -F '"' '{print $4}')
CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/core-lateset/premium | grep download_url | grep clash-linux-arm64 | awk -F '"' '{print $4}')
CLASH_META_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/core-lateset/meta | grep download_url | grep clash-linux-arm64 | awk -F '"' '{print $4}')
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat
chmod +x files/etc/openclash/core/clash*

# costumize openclash
cat << EOF > feeds/luci/applications/luci-app-openclash/luasrc/view/openclash/editor.htm
<%+header%>
<div class="cbi-map">
<iframe id="editor" style="width: 100%; min-height: 100vh; border: none; border-radius: 2px;"></iframe>
</div>
<script type="text/javascript">
document.getElementById("editor").src = "http://" + window.location.hostname + "/tinyfilemanager/index.php?p=etc/openclash";
</script>
<%+footer%>
EOF
sed -i "s/yacd/Yet Another Clash Dashboard/g" feeds/luci/applications/luci-app-openclash/root/usr/share/openclash/ui/yacd/manifest.webmanifest
sed -i '94s/80/90/g' feeds/luci/applications/luci-app-openclash/luasrc/controller/openclash.lua
sed -i '94 i\	entry({"admin", "services", "openclash", "editor"}, template("openclash/editor"),_("Config Editor"), 80).leaf = true' feeds/luci/applications/luci-app-openclash/luasrc/controller/openclash.lua

# speedtest
mkdir -p files/bin
wget -qO- https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-aarch64.tgz | tar xOvz > files/bin/speedtest
chmod +x files/bin/speedtest


# yt-dlp
mkdir -p files/bin
curl -sL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o files/bin/yt-dlp
chmod +x files/bin/yt-dlp

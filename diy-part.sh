#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify Default Hostname
sed -i 's/ImmortalWrt/NekoHome/g' package/base-files/files/bin/config_generate

# Modify Default IP Address
sed -i 's/192.168.6.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Modify Default Timezone 
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# Modify Default mtwifi-cfg WiFi SSID
sed -i 's/ImmortalWrt-2.4G/OpenWrt_Sakura/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/OpenWrt_Sakura-5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# Replace Banner
cp -f $GITHUB_WORKSPACE/banner package/base-files/files/etc/banner

# Change Default Theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/argon/g' ./feeds/luci/modules/luci-base/root/etc/config/luci

# Modify Argon Theme Settings
sed -i 's/#5e72e4/#ffcc11/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon
sed -i 's/#483d8b/#ffcc11/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon
sed -i 's/bing/none/g' feeds/luci/applications/luci-app-argon-config/root/etc/config/argon

# Add Customized Background Image
cp -f $GITHUB_WORKSPACE/bg1.jpg feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
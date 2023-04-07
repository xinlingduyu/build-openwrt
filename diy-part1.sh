#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 开启feeds.conf.default配置表
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加插件和主题，取消#注释，代表启用，【电视盒子必须开启第一项（amlogic插件）】
# echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall.git;packages' >>feeds.conf.default
# echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci' >>feeds.conf.default

# 替换源码库中软件包，第一行代码先删除源码库中原来的软件，再用第二行代码引入第三方的同名软件包，启用后到 .config 文件里添加第三方软件包。
# rm -rf package/lean/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

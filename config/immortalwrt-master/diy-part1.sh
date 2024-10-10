#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a feed source
sed -i '$a src-git 5g https://github.com/Siriling/5G-Modem-Support.git' feeds.conf.default

# other
# rm -rf package/emortal/{autosamba,ipv6-helper}


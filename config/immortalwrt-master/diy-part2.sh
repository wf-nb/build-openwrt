#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='immortalwrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
rm -rf package/luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
# Add rkp-ipid
git clone https://github.com/CHN-beta/rkp-ipid package/rkp-ipid
# Add UA2F
git clone https://github.com/Zxilly/UA2F package/UA2F
# Add mentohust
git clone https://github.com/sbwml/luci-app-mentohust package/mentohust
# Add minieap
git clone https://github.com/ysc3839/luci-proto-minieap package/minieap
# Add clash
git clone https://github.com/frainzy1477/luci-app-clash package/clash
# Add dockerman
git clone https://github.com/lisaac/luci-app-dockerman package/dockerman
# Add OpenClash
git clone https://github.com/vernesong/OpenClash package/OpenClash
# Add AdGuardHome
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome
# Add passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
#
# Apply patch
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------


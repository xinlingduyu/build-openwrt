
# 云编译OpenWrt系统固件

本仓库云编译源码来自各位大佬分享，为了方便编译，做了一些修改，可以支持不同分支的opewrt源码，同时集成了打包img镜像的功能。

官方版本：    https://github.com/openwrt/openwrt      

lede版本：    https://github.com/coolsnowwolf/lede  

lienol版本：  https://github.com/Lienol/openwrt 


## 使用方法

1，定制openwrt文件.config，具体怎么设置，建议先去了解如何编译，此默认.config文件基于（电视盒子S905X3）配置！


2，打开diy-part1.sh文件，添加插件或主题，电视盒子必须安装amlogic插件，格式如下：

    #####Add a feed source
    echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic' >>feeds.conf.default
    

3，进入.github/workflows文件夹，打开【通用编译openwrt.yml】或者【电视盒子编译+打包IMG镜像】，找到下面代码：

   env:
   
     REPO_URL: https://github.com/Lienol/openwrt （修改成你想要的源码地址）
	 
     REPO_BRANCH: 22.03 （修改分支）

  

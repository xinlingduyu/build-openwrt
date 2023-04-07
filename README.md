**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

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
  REPO_URL: https://github.com/Lienol/openwrt （修改成你想要的源码）
  REPO_BRANCH: 22.03 （修改分支）
  


## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Credits

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)

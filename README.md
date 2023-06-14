
# fterm
[![build_linux](https://github.com/springeye/fterm/actions/workflows/build_linux.yml/badge.svg?event=release)](https://github.com/springeye/fterm/actions/workflows/build_linux.yml)
[![build_windows](https://github.com/springeye/fterm/actions/workflows/build_windows.yml/badge.svg?event=release)](https://github.com/springeye/fterm/actions/workflows/build_windows.yml)
[![build_macos](https://github.com/springeye/fterm/actions/workflows/build_macos.yml/badge.svg?event=release)](https://github.com/springeye/fterm/actions/workflows/build_macos.yml)  
fterm是一款基于Flutter开发的跨平台终端工具
# 有什么优点呢？
1. 没有很多复杂的功能，几乎像自带的终端一样使用。
2. 相较于很多使用Electron开发的终端应用,拥有较小的体积。
3. 完全开源，配置信息加密([flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage))存放,不用担心有什么安全问题。
4. 支持本地和webdav备份恢复配置文件。
5. mac和linux首次启动会自动创建启动命令(在任意终端冲使用fterm命令即可启动)

# 功能
- [x] 本地终端
- [x] 多种主题颜色
- [x] ssh主机连接
- [x] ssh配置本地加密存储
- [x] 通过ssh跳板机连接目标主机
- [x] 支持zmodem
- [x] 备份恢复配置(从本地磁盘或者webdav中)



# 部分截图
![fterm1](resources/fterm1.png)
![fterm2](resources/fterm2.png)
![fterm3](resources/fterm3.png)
![fterm4](resources/fterm4.png)
![fterm5](resources/fterm5.png)
![fterm6](resources/fterm6.png)

## 编译
#### linux 依赖
```bash
sudo apt install -y libsqlite3-dev libssl-dev libsecret-1-dev libjsoncpp-dev
```
#### windows 依赖
Visual Studio 2022 以上
```powershell
scoop install openssl
```
 

**问：为什么没有mac版本?**  
答：因为本人没有钱，比较穷，买不起apple development证书！
如果你需要mac版本，直接拉去代码到本地自己构建，直接flutter build macos就可以，无需其他配置


Related links:
1. [https://pub.dev/packages/flutter_secure_storage]()  
2. [https://pub.dev/packages/sqlcipher_flutter_libs]()
## Special thanks to the following items which helped me a lot
[https://github.com/TerminalStudio]()  
[https://github.com/Eugeny/tabby]()


# 给早餐加个鸡蛋
<img src="resources/alipay.jpg" width="200px"/>
<img src="resources/wx.jpg" width="200px"/>

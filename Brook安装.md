#   Brook 安装
  ---     
        mkdir brook && cd brook

        brook_ver=$(wget --no-check-certificate -qO- https://api.github.com/repos/txthinking/brook/releases | grep -o '"tag_name": ".*"' |head -n 1| sed 's/"//g' | sed 's/tag_name: //g') && echo ${brook_ver}

        wget -N --no-check-certificate "https://github.com/txthinking/brook/releases/download/${brook_ver}/brook"

        chmod +x brook

### 后台单端口启动
### 启动一个单端口 Brook协议模式
### 监听端口为 2333，密码为 doubio。
        nohup ./brook server -l :2333 -p "doub.io" > /dev/null 2>&1 &

#### 后台多端口启动
#### 启动一个多端口 Brook协议模式
#### 账号分别为：
#### 监听端口 2333，密码 doub.io1
#### 监听端口 6666，密码 doub.io2
#### 监听端口 8888，密码 doub.io3
 
        nohup ./brook servers -l ":2333 doub.io1" -l ":6666 doub.io2" -l ":8888 doub.io3" > /dev/null 2>&1 &

### 停止Brook
        kill -9 $(ps -ef|grep "brook"|grep -v grep|awk '{print $2}')

### 升级 Brook
##### 升级很简单，只需要重新执行一开始的安装步骤即可，区别是不需要再新建文件夹了，直接进入文件夹即可。

### 卸载 Brook
#### 卸载前先停止 Brook，然后直接删除 Brook的文件夹即可。
        kill -9 $(ps -ef|grep "brook"|grep -v grep|awk '{print $2}')
#### 先停止，后删除（假设安装在 /root 目录内，那么文件夹就是 /root/brook
        rm -rf /root/brook

### 开机启动 Ubuntu/Debian 系统：
        sudo chmod +x /etc/rc.local
        sudo vi /etc/rc.local

        ##然后在 exit 0 这一句代码（只有ubuntu/debian有这个 exit 0）的前面加上 下面这句代码(如果你的Shadowsocks文件夹不在root目录下，请自行修改路径)。
        ##建一个run.sh文件
        #!/bin/bash
        cd `dirname $0`
        nohup  ./brook server -l :5555 -p "password1" > /dev/null 2>&1 &
        /bin/bash /home/ubantu-vpn-asia/brook/run.sh
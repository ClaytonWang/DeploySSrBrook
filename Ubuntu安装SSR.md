# SSR安装
---
### 安装 libsodium ，使用Chacha20 chacha20-ietf 等加密方。

        sudo apt-get update

        sudo apt-get install -y build-essential

        Libsodiumr_ver=$(wget -qO- "https://github.com/jedisct1/libsodium/tags"| grep "/jedisct1/libsodium/releases/tag/"|head -1|sed -r 's/.*tag\/(.+)\">.*/\1/') && echo "${Libsodiumr_ver}"

        wget --no-check-certificate -N "https://github.com/jedisct1/libsodium/releases/download/${Libsodiumr_ver}/libsodium-${Libsodiumr_ver}.tar.gz"

        tar -xzf libsodium-${Libsodiumr_ver}.tar.gz && cd libsodium-${Libsodiumr_ver}

        ./configure --disable-maintainer-mode && make -j2 && make install

        sudo ldconfig

 ### 删除安装包

        sudo cd .. && rm -rf libsodium-${Libsodiumr_ver}.tar.gz && rm -rf libsodium-${Libsodiumr_ver}

### 安装git vim

        apt-get install git vim -y

        git clone -b manyuser https://github.com/ClaytonWang/shadowsocksr.git

        cd shadowsocksr ##进入子目录，上层目录为多用户版

        bash initcfg.sh

        vi user-config.json

        cd shadowsocks

        sudo chmod +x *.sh ##赋予脚本执行权限

        python server.py ##前台启动，用于调试

        sudo ./logrun.sh ##后台启动

        sudo ./stop.sh ##停止

        ./tail.sh ##查看是志

### 开机启动 Ubuntu/Debian 系统

        sudo chmod +x /etc/rc.local
        sudo vi /etc/rc.local

        ##然后在 exit 0 这一句代码（只有ubuntu/debian有这个 exit 0）的前面加上 下面这句代码(如果你的Shadowsocks文件夹不在root目录下，请自行修改路径)。
        ##建一个run.sh文件
        #!/bin/bash
        cd `dirname $0`
        /bin/bash /root/shadowsocksr/shadowsocks/logrun.sh
        /bin/bash /home/ubantu-vpn-asia/shadowsocksr/shadowsocks/logrun.sh
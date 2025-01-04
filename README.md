# tverrec-proot-ubuntu


Auxiliary tool to run TVerRec on Android smartphones and tablets.

Androidスマートフォン･タブレットでTVerRecを動作させるための補助ツール。


This tool works on Android by installing Termux on Android and installing Ubuntu inside Termux.
This tool supports Termux configuration and Ubuntu configuration.

Android上にTermuxをインストールし、Termux内にUbuntuをインストールすることで動作。
本ツールではTermuxの初期設定とUbuntuの初期設定をサポート。

Tested with FireMax11.

FireMax11で検証。


## 1. Run on Termux

```
pkg update
pkg upgrade -y
pkg install git -y
git clone https://github.com/dongaba/tverrec-proot-ubuntu.git
cd tverrec-proot-ubuntu
chmod +x setup-termux.sh
./setup-termux.sh
ubuntu
```

## 2. Run on Ubuntu

```
apt-get update
apt-get upgrade -y
apt-get install git -y
git clone https://github.com/dongaba/tverrec-proot-ubuntu.git
cd tverrec-proot-ubuntu
chmod +x setup-ubuntu.sh
./setup-ubuntu.sh
```

cd ~

# Update Packages
apt-get update
apt-get upgrade -y

# Install basic packages
apt-get install wget curl git neofetch vim sudo dialog language-pack-ja software-properties-common font-manager xfce4 dbus-x11 locales tzdata fonts-noto-cjk fonts-noto-color-emoji xfce4-whiskermenu-plugin -y

echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

# Setup PulseAudio
echo 'export PULSE_SERVER=127.0.0.1' > ./x11

# Setup Virglrenderer
add-apt-repository ppa:kisak/kisak-mesa -y
apt update
apt upgrade -y
echo 'export GALLIUM_DRIVER=virpipe' >> ./x11
echo 'export MESA_GL_VERSION_OVERRIDE=4.0' >> ./x11

# Setup X11 environment
echo 'termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"' >> ./x11
chmod +x ./x11
ln -s /root/x11 /usr/bin/x11

# Setup .bashrc
echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
echo 'export LANGUAGE="ja_JP:ja"' >> ~/.bashrc
echo neofetch >> ~/.bashrc

# Install PowerShell
apt install dotnet-sdk-8.0 -y
dotnet tool install --global PowerShell

# Install TVerRec
git clone https://github.com/dongaba/TVerRec.git
chmod +x TVerRec/unix/*.sh

# Setup password for root
echo "Enter a password for root:"
passwd

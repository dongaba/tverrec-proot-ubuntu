# Update Packages
pkg update
pkg upgrade -y

# Install basic packages
pkg install proot android-tools wget curl git openssh termux-am termux-api neofetch proot-distro vim -y

# Allow access to Android storage
termux-setup-storage

# Correct 'storage/external-1' link
cd ~
rm -rf ~/storage/external-1
sd_mount_point=$(df -t fuse | grep storage | grep -v emulated | awk '{print $6}')
ln -s "$sd_mount_point" ~/storage/external-1

# Install Ubuntu
proot-distro install ubuntu

# Setup Ubuntu launcher
echo clear > /data/data/com.termux/files/usr/bin/ubuntu
echo "proot-distro login ubuntu --shared-tmp --bind /storage/$sd_mount_point" >> /data/data/com.termux/files/usr/bin/ubuntu
echo clear >> /data/data/com.termux/files/usr/bin/ubuntu
echo neofetch >> /data/data/com.termux/files/usr/bin/ubuntu
chmod +x /data/data/com.termux/files/usr/bin/ubuntu

# Setup .bashrc
echo neofetch > ~/.bashrc
echo sshd >> ~/.bashrc

# Setup X11 environment
pkg install x11-repo termux-x11-nightly pulseaudio virglrenderer-android -y

# Setup PulseAudio
echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1; auth-anonymous=1" >> /data/data/com.termux/files/usr/etc/pulse/default.pa
echo "exit-idle-time = -1" >> /data/data/com.termux/files/usr/etc/pulse/daemon.conf
echo "pulseaudio --start &" >> ~/.bashrc

# Setup Virglrenderer
echo "virgl_test_server_android &" >> ~/.bashrc

# Setup .bashrc
echo ubuntu >> ~/.bashrc

# Setup password for SSH
echo "Enter a password for SSH:"
password

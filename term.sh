#system in /r/w
ln -s /system/bin/mount $PREFIX/bin/mount
tsudo mount -o remount,rw /system

#termux start goodies
apt update && apt upgrade -y
pkg install curl wget git nano openssl tmux openssl-dev ncurses-utils git python python2 nodejs golang zsh php -y
pip install bpython ipython
git clone https://github.com/Hax4us/java
mv java/openjdk/java /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/home/java/openjdk/bin/java
pkg install tsu #if you r r00t
#pkg install fakeroot #if not
#fakeroot

#fix to get right rights
uid=$(id -u)
su -c chown -R $uid:$uid /data/data/com.termux/ && su -c restorecon -RF /data/data/com.termux

#termux customization
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"
git clone https://github.com/Bhai4You/Termux-Banner
cd Termux-Banner/zsh
chmod +x requirement.sh t-ban.sh
bash requirement.sh
bash t-ban.sh
chsh -s zsh
git clone https://github.com/jotyGill/quickz-sh.git
cd quickz-sh
./quickz.sh

#Net-Hunter
#install chroot
cd
curl -LO https://raw.githubusercontent.com/Hax4us/Nethunter-In-Termux/master/kalinethunter
tsudo chmod +x kalinethunter
tsudo ./kalinethunter --insecure
tsudo startkali
#install tools. run this in kali-shell
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb
apt install ./kali-archive-keyring_2018.1_all.deb
apt-get update && apt-get full-upgrade -y
apt-get install kali-linux-nethunter -y
  

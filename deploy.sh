#general
apt-get install python python-pip python3 python3-pip python-dev python3-dev python-setuptools python3-setuptools zsh git curl redsocks libncursesw5-dev libgeoip-dev libtokyocabinet-dev libssl-dev -y

#Bash-snippets.. 
git clone https://github.com/alexanderepstein/Bash-Snippets.git && cd Bash* && chmod +x install.sh && ./install.sh

#bat = cat(!) with great wings :) #other https://github.com/sharkdp/bat/releases/
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat&

#node 10
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get install nodejs

#go and gopath
cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz && sudo tar xfz go1.13.1* && cd
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.zshrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc

#zsh with many futures
sudo apt-get install zsh
git clone https://github.com/black7375/BlaCk-Void-Zsh.git ~/.zsh && cd ~/.zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts && ./install.sh
cd ..
echo "source BlaCk-Void.zshrc" >> ~/.zshrc
sudo chsh -s /usr/bin/zsh

#dircolors & zsh-syntax-highlight
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolorhttps://github.com/CNMan/dnscrypt-proxy-config.gits
echo 'eval $(dircolors -b ~/.dircolors)' >> ~/.zshrc 
. ~/.zshrc 
echo 'eval $(dircolors -b ~/.dircolors)' >> ~/.profile
. ~/.profile
sudo wget -P /usr/opt/ https://github.com/trapd00r/zsh-syntax-highlighting-filetypes/raw/master/zsh-syntax-highlighting-filetypes.zsh
echo 'source /opt/zsh-syntax-highlighting-filetypes.zsh'>>~/.zshrc

#aliases
alias wip="wget -qO- https://wtfismyip.com/text" 

#DNS-server
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-2.2
wget https://download.technitium.com/dns/DnsServerPortable.tar.gz
sudo mkdir -p /etc/dns/
sudo tar -zxf DnsServerPortable.tar.gz -C /etc/dns/
sudo cp /etc/dns/systemd.service /etc/systemd/system/dns.service
sudo systemctl enable dns.service
sudo systemctl start dns.service

#DNS-crypt-proxy. other releases: https://github.com/DNSCrypt/dnscrypt-proxy/releases
cd /opt && sudo git clone https://github.com/CNMan/dnscrypt-proxy-config.git && cd dnscrypt* && sudo ./dnscrypt-proxy-config.sh
wget https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.27/dnscrypt-proxy-linux_x86_64-2.0.27.tar.gz && sudo tar xfz dnscrypt-proxy-linux_x86_64-2.0.27.tar.gz && sudo mv ./linux*/dnscrypt-proxy dnscrypt-proxy
sudo ./dnscrypt-proxy -service install && sudo ./dnscrypt-proxy -service start
chattr -i /etc/resolv.conf && rm /etc/resolv.conf && echo 'nameserver 127.0.0.1'>/etc/resolv.conf && chattr +i /etc/resolv.conf
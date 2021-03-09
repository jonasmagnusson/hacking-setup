#!/bin/bash

# Kali Repository
wget https://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
dpkg -i kali-archive-keyring_2020.2_all.deb; rm kali-archive-keyring_2020.2_all.deb
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | tee /etc/apt/sources.list.d/kali.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | tee --append /etc/apt/sources.list.d/kali.list
apt-get -y update

# Make sure libc6 installs silently
echo 'libc6 libraries/restart-without-asking boolean true' | debconf-set-selections

# Metasploit Framework
apt-get install -y metasploit-framework

# GPP Decrypt
apt-get install -y gpp-decrypt

# Steghide
apt-get install -y steghide

# Nmap
apt-get install -y nmap

# Sqlmap
apt-get install -y sqlmap

# Amass
apt-get install -y amass

# CrackMapExec
apt-get install -y crackmapexec

# SMBMap
apt-get install -y smbmap

# Brutespray
apt-get install -y brutespray

# Pass the hash toolkit
apt-get install -y passing-the-hash

# Whatweb
apt-get install -y whatweb

# Crunch
apt-get install -y crunch

# Rsmangler
apt-get install -y rsmangler

# Searchsploit
apt-get install -y exploitdb

# Enum4Linux - TODO - This has to be made silent
apt-get install -y enum4linux

# Nikto
apt-get install -y nikto

# GetAllUrls
export GOPATH=/opt/gau
go get -u github.com/lc/gau
ln -s /opt/gau/bin/gau /usr/local/bin/gau

# Fnds
export GOPATH=/opt/fdns
go get -u github.com/jimen0/fdns/cmd/fdns
ln -s /opt/fdns/bin/fdns /usr/local/bin/fdns

# Ffuf
export GOPATH=/opt/ffuf
go get -u github.com/ffuf/ffuf
ln -s /opt/ffuf/bin/ffuf /usr/local/bin/ffuf

# Hakrawler
export GOPATH=/opt/hakrawler
go get github.com/hakluke/hakrawler
ln -s /opt/hakrawler/bin/hakrawler /usr/local/bin/hakrawler

# HTTProbe
export GOPATH=/opt/httprobe
go get -u github.com/tomnomnom/httprobe
ln -s /opt/httprobe/bin/httprobe /usr/local/bin/httprobe

# Meg
export GOPATH=/opt/meg
go get -u github.com/tomnomnom/meg
ln -s /opt/meg/bin/meg /usr/local/bin/meg

# Megurl
export GOPATH=/opt/megurl
go get -u github.com/3lpsy/megurl
ln -s /opt/megurl/bin/megurl /usr/local/bin/megurl

# Waybackurls
export GOPATH=/opt/waybackurls
go get -u github.com/tomnomnom/waybackurls
ln -s /opt/waybackurls/bin/waybackurls /usr/local/bin/waybackurls

# Gf
export GOPATH=/opt/gf
go get -u github.com/tomnomnom/gf
ln -s /opt/gf/bin/gf /usr/local/bin/gf
#source /opt/gf/src/github.com/tomnomnom/gf/gf-completion.bash

# Assetfinder
export GOPATH=/opt/assetfinder
go get -u github.com/tomnomnom/assetfinder
ln -s /opt/assetfinder/bin/assetfinder /usr/local/bin/assetfinder

# Anew
export GOPATH=/opt/anew
go get -u github.com/tomnomnom/anew
ln -s /opt/anew/bin/anew /usr/local/bin/anew

# Shhgit
export GOPATH=/opt/shhgit
go get -u github.com/eth0izzle/shhgit
ln -s /opt/shhgit/bin/shhgit /usr/local/bin/shhgit

# Html-tool
export GOPATH=/opt/html-tool
go get -u github.com/tomnomnom/hacks/html-tool
ln -s /opt/html-tool/bin/html-tool /usr/local/bin/html-tool

# Gowitness
export GOPATH=/opt/gowitness
go get -u github.com/sensepost/gowitness
ln -s /opt/gowitness/bin/gowitness /usr/local/bin/gowitness

# Retire.js
apt-get install -y npm
npm install -g retire

# Stegoveritas
apt-get install -y libimage-exiftool-perl libexempi8
pip3 install stegoveritas

# Altdns
pip install py-altdns

# Findomain
mkdir /opt/findomain
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux -O /opt/findomain/findomain
chmod +x /opt/findomain/findomain
ln -s /opt/findomain/findomain /usr/local/bin/findomain

# Google Chrome
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Flan Scan
git clone https://github.com/cloudflare/flan.git /opt/flan || git -C /opt/flan pull

# MassDNS
apt-get install -y gcc make libpcap-dev
git clone https://github.com/blechschmidt/massdns.git /opt/massdns || git -C /opt/massdns pull
cd /opt/massdns
make
ln -s /opt/massdns/bin/massdns /usr/local/bin/massdns

# Masscan
apt-get install -y gcc make libpcap-dev
git clone https://github.com/robertdavidgraham/masscan /opt/masscan || git -C /opt/masscan pull
cd /opt/masscan
make
ln -s /opt/masscan/bin/masscan /usr/local/bin/masscan

# Nmap-parse-output
apt install -y xsltproc
git clone https://github.com/ernw/nmap-parse-output.git /opt/nmap-parse-output || git -C /opt/nmap-parse-output pull
ln -s /opt/nmap-parse-output/nmap-parse-output /usr/local/bin/nmap-parse-output

# AsnLookup
git clone https://github.com/yassineaboukir/Asnlookup /opt/asnlookup || git -C /opt/asnlookup pull
pip3 install -r /opt/asnlookup/requirements.txt
ln -s /opt/asnlookup/asnlookup.py /usr/local/bin/asnlookup
chmod +x /usr/local/bin/asnlookup

# Dnsgen
git clone https://github.com/ProjectAnte/dnsgen /opt/dnsgen || git -C /opt/dnsgen pull
pip3 install -r /opt/dnsgen/requirements.txt
python3 /opt/dnsgen/setup.py install

# Hash-Buster
git clone https://github.com/s0md3v/Hash-Buster.git /opt/hashbuster || git -C /opt/hashbuster pull
ln -s /opt/hashbuster/hash.py /usr/local/bin/hashbuster
chmod +x /usr/local/bin/hashbuster

# Bolt
git clone https://github.com/s0md3v/Bolt.git /opt/bolt || git -C /opt/bolt pull
pip3 install -r /opt/bolt/requirements.txt
ln -s /opt/bolt/bolt.py /usr/local/bin/bolt
chmod +x /usr/local/bin/bolt

# Photon
git clone https://github.com/s0md3v/Photon.git /opt/photon || git -C /opt/photon pull
pip3 install -r /opt/photon/requirements.txt
ln -s /opt/photon/photon.py /usr/local/bin/photon
chmod +x /usr/local/bin/photon

# XSStrike
git clone https://github.com/s0md3v/XSStrike.git /opt/xsstrike || git -C /opt/xsstrike pull
pip3 install -r /opt/xsstrike/requirements.txt
ln -s /opt/xsstrike/xsstrike.py /usr/local/bin/xsstrike
chmod +x /usr/local/bin/xsstrike

# Arjun
git clone https://github.com/s0md3v/Arjun.git /opt/arjun || git -C /opt/arjun pull
ln -s /opt/arjun/arjun.py /usr/local/bin/arjun
chmod +x /usr/local/bin/arjun

# DNSExfiltrator
git clone https://github.com/Arno0x/DNSExfiltrator.git /opt/dnsexfiltrator || git -C /opt/dnsexfiltrator pull
pip install -r /opt/dnsexfiltrator/requirements.txt
ln -s /opt/dnsexfiltrator/dnsexfiltrator.py /usr/local/bin/dnsexfiltrator
chmod +x /usr/local/bin/dnsexfiltrator

# Impacket
git clone https://github.com/rxwx/impacket.git /opt/impacket || git -C /opt/impacket pull
pip3 install -r /opt/impacket/requirements.txt
pip3 install /opt/impacket/

# Evil-winrm
gem install evil-winrm

# Stego Toolkit
docker pull dominicbreuker/stego-toolkit

# Powershell NTLM
docker pull quickbreach/powershell-ntlm

# Bloodhound
git clone https://github.com/BloodHoundAD/BloodHound.git /opt/bloodhound || git -C /opt/bloodhound pull

# PowerSploit
git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/powersploit || git -C /opt/powersploit pull

# JAWS
git clone https://github.com/411Hall/JAWS.git /opt/jaws || git -C /opt/jaws pull

# Nishang
git clone https://github.com/samratashok/nishang.git /opt/nishang || git -C /opt/nishang pull

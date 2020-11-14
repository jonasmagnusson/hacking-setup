#!/bin/bash

# Seclists
git clone https://github.com/danielmiessler/SecLists.git /opt/seclists || git -C /opt/seclists pull

# PayloadsAllTheThings
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/payloadsallthethings || git -C /opt/payloadsallthethings pull

# Robots Disallowed
git clone https://github.com/danielmiessler/RobotsDisallowed.git /opt/robotsdisallowed || git -C /opt/robotsdisallowed pull

# FuzzDB
git clone https://github.com/fuzzdb-project/fuzzdb.git /opt/fuzzdb || git -C /opt/fuzzdb pull

# Commonspeak
git clone https://github.com/assetnote/commonspeak2-wordlists.git /opt/commonspeak2 || git -C /opt/commonspeak2 pull

# Jhaddix All
wget https://gist.github.com/jhaddix/f64c97d0863a78454e44c2f7119c2a6a/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt -P /opt/jhaddix/

# Wordlists from Kali Linux
git clone https://github.com/3ndG4me/KaliLists.git /opt/kalilists || git -C /opt/kalilists pull

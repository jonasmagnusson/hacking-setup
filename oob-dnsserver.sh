#!/bin/bash

# Show usage information
usage() { echo -e "Set variables before executing: \n\nexport DOMAIN=domain\nexport IP=ip\n" 1>&2; exit 1; }

# Check required variables
if [ -z "${DOMAIN}" ] || [ -z "${IP}" ]; then
    usage
fi

# Install bind and logrotate
apt install -y bind9 logrotate 

# Create paths and set permissions
mkdir -p /var/log/named
chown -R bind:root /var/log/named
chmod -R 775 /var/log/named

# Create db.local config file
cat << "EOT" > /etc/bind/db.local
$TTL    120
@       IN      SOA     DOMAIN. root.DOMAIN. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
ns1              IN      A       IP
ns2              IN      A       IP
*                IN      A   	   IP
@                IN      A       IP
@                IN      NS      ns1.DOMAIN.
@                IN      NS      ns2.DOMAIN.
EOT

# Replace domain and IP
sed -i "s/DOMAIN/$DOMAIN/g" /etc/bind/db.local
sed -i "s/IP/$IP/g" /etc/bind/db.local

# Add domain zone
cat << "EOT" > /etc/bind/named.conf.default-zones
zone "DOMAIN" {
    type master;
    file "/etc/bind/db.local";
};
EOT

# Replace domain
sed -i "s/DOMAIN/$DOMAIN/g" /etc/bind/named.conf.default-zones

# Create named.conf.options
cat << "EOT" > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    forwarders {
        9.9.9.9;
    };

    allow-query { any; };

    dnssec-validation auto;

    auth-nxdomain no;
    listen-on { any; };
    listen-on-v6 { any; };
    recursion no;
    additional-from-cache no;
};
EOT

# Create named.conf.log
cat << "EOT" > /etc/bind/named.conf.log
logging {
    channel bind_log {
        file "/var/log/named/named.log" versions 3 size 5m;
        severity info;
        print-category yes;
        print-severity yes;
        print-time yes;
    };
    category default { bind_log; };
    category update { bind_log; };
    category update-security { bind_log; };
    category security { bind_log; };
    category queries { bind_log; };
    category lame-servers { null; };
};
EOT

# Include named.conf.log in named.conf
echo "include \"/etc/bind/named.conf.log\";" >> "/etc/bind/named.conf"

# Create logrotate config
cat << "EOT" > /etc/logrotate.d/bind
/var/log/named/named.log {
    daily
    missingok
    rotate 30
    compress
    delaycompress
    notifempty
    create 644 bind bind
    postrotate
    /usr/sbin/invoke-rc.d bind9 reload > /dev/null
    endscript
}
EOT

# Create new bind9
cat << "EOT" > /etc/default/bind9
# Run resolvconf
RESOLVCONF=yes

# Startup options for the server
OPTIONS="-4 -u bind"
EOT

# Reload logrotate
logrotate -d "/etc/logrotate.d/bind"

# Restart bind service
systemctl restart bind9

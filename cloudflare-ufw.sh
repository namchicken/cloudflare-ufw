#!/bin/sh

curl -s https://www.cloudflare.com/ips-v4 -o /tmp/cf_ips
curl -s https://www.cloudflare.com/ips-v6 >> /tmp/cf_ips

# Allow all traffic from Cloudflare IPs to ports 80 & 443
for cfip in `cat /tmp/cf_ips`; do ufw allow proto tcp from $cfip to any port 80,443; done

ufw reload > /dev/null


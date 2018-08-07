#!/bin/sh

# start DHCP service
sudo service isc-dhcp-server start

# enable forwarding from the ethernet to wireless router
sudo /sbin/iptables --table nat -A POSTROUTING -o wlan0 -j MASQUERADE

#!/bin/bash
rmmod ixgbe && modprobe ixgbe && systemctl restart NetworkManager

nmcli connection add con-name bond0 type bond ifname bond0 mode 802.3ad miimon 100 lacp-rate fast ipv4.method auto ipv6.method disabled ipv4.dns 10.1.30.8 ipv4.dns-search brakebills.io

nmcli connection add con-name bond0-slave-eno1 ifname eno1 type ethernet master bond0 slave-type bond

nmcli connection add con-name bond0-slave-eno2 ifname eno2 type ethernet master bond0 slave-type bond

systemctl restart NetworkManager
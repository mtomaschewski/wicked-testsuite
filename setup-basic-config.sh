#! /bin/bash

echo
echo "### Setup the build host ###"
build="build"
scp "basic-config-files/build/remote_build.sh" "builduser@$build:."
ssh "builduser@$build" "chmod +x remote_build.sh"

echo
echo "### Setup the reference server ###"
ref="virtio:/var/run/twopence/reference.sock"

echo "Configure the DHCP client"
twopence_command $ref "sed -i 's/^DHCLIENT_BIN=.*$/DHCLIENT_BIN=\"dhclient\"/' /etc/sysconfig/network/dhcp"

echo "Configure the firewall"
twopence_command $ref "SuSEfirewall2 off"
twopence_inject $ref "basic-config-files/reference/iptables" "/etc/init.d/iptables"
twopence_command $ref "insserv iptables"
twopence_inject $ref "basic-config-files/reference/ip4tablesrc" "/etc/ip4tablesrc"
twopence_inject $ref "basic-config-files/reference/ip6tablesrc" "/etc/ip6tablesrc"

echo "Configure the addresses and routes"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth0" "/etc/sysconfig/network/ifcfg-eth0"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth1" "/etc/sysconfig/network/ifcfg-eth1"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth2" "/etc/sysconfig/network/ifcfg-eth2"
twopence_inject $ref "basic-config-files/reference/ifroute-eth1" "/etc/sysconfig/network/ifroute-eth1"
twopence_inject $ref "basic-config-files/reference/ifcfg-bond0" "/etc/sysconfig/network/ifcfg-bond0"
twopence_inject $ref "basic-config-files/reference/ifcfg-bond1" "/etc/sysconfig/network/ifcfg-bond1"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth0.42" "/etc/sysconfig/network/ifcfg-eth0.42"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth1.42" "/etc/sysconfig/network/ifcfg-eth1.42"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth0.1" "/etc/sysconfig/network/ifcfg-eth0.1"
twopence_inject $ref "basic-config-files/reference/ifcfg-eth1.1" "/etc/sysconfig/network/ifcfg-eth1.1"
twopence_inject $ref "basic-config-files/reference/ifcfg-bond0.42" "/etc/sysconfig/network/ifcfg-bond0.42"
twopence_inject $ref "basic-config-files/reference/ifcfg-bond0.73" "/etc/sysconfig/network/ifcfg-bond0.73"
twopence_inject $ref "basic-config-files/reference/ifcfg-tun1" "/etc/sysconfig/network/ifcfg-tun1"
twopence_inject $ref "basic-config-files/reference/ifcfg-tap1" "/etc/sysconfig/network/ifcfg-tap1"
twopence_inject $ref "basic-config-files/reference/ifcfg-gre1" "/etc/sysconfig/network/ifcfg-gre1"
twopence_inject $ref "basic-config-files/reference/ifcfg-tunl1" "/etc/sysconfig/network/ifcfg-tunl1"
twopence_inject $ref "basic-config-files/reference/ifcfg-sit1" "/etc/sysconfig/network/ifcfg-sit1"
twopence_inject $ref "basic-config-files/reference/ifcfg-ib0" "/etc/sysconfig/network/ifcfg-ib0"

echo "Configure and start the DHCP server"
twopence_inject $ref "basic-config-files/reference/dhcpd" "/etc/sysconfig/dhcpd"
twopence_inject $ref "basic-config-files/reference/dhcpd-default.conf" "/etc/dhcpd-default.conf"
twopence_command $ref "chmod ugo+r /etc/dhcpd-default.conf"
twopence_inject $ref "basic-config-files/reference/dhcpd-route.conf" "/etc/dhcpd-route.conf"
twopence_command $ref "chmod ugo+r /etc/dhcpd-route.conf"
twopence_inject $ref "basic-config-files/reference/dhcpd-mtu.conf" "/etc/dhcpd-mtu.conf"
twopence_command $ref "chmod ugo+r /etc/dhcpd-mtu.conf"
twopence_command $ref "ln -sf /etc/dhcpd-default.conf /etc/dhcpd.conf"
twopence_command $ref "chkconfig dhcpd on"
twopence_inject $ref "basic-config-files/reference/dhcpd6.conf" "/etc/dhcpd6.conf"
twopence_command $ref "chmod ugo+r /etc/dhcpd6.conf"
twopence_command $ref "chkconfig dhcpd6 on"

echo "Configure and start the RADVD server"
twopence_inject $ref "basic-config-files/reference/radvd-default.conf" "/etc/radvd-default.conf"
for ((i = 1; i <= 12; i++)); do
  twopence_inject $ref "basic-config-files/reference/radvd-${i}.conf" "/etc/radvd-${i}.conf"
done
twopence_command $ref "chmod o+r /etc/radvd-*.conf"
twopence_command $ref "ln -sf /etc/radvd-default.conf /etc/radvd.conf"
twopence_command $ref "chkconfig radvd on"

echo "Configure, but do not start the openvpn server"
twopence_inject $ref "basic-config-files/reference/openvpn-tun.conf" "/etc/openvpn/server-tun.conf"
twopence_command $ref "chmod o+r /etc/openvpn/server-tun.conf"
twopence_inject $ref "basic-config-files/reference/openvpn-tap.conf" "/etc/openvpn/server-tap.conf"
twopence_command $ref "chmod o+r /etc/openvpn/server-tap.conf"
twopence_command $ref "ln -sf /etc/openvpn/server-tun.conf /etc/openvpn/server.conf"

echo "Activate packet forwarding"
twopence_inject $ref "basic-config-files/reference/sysctl.conf" "/etc/sysctl.conf"
twopence_command $ref "echo 1 > /proc/sys/net/ipv4/ip_forward"
twopence_command $ref "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"


echo
echo "### Setup the system under test ###"
sut="virtio:/var/run/twopence/sut.sock"

echo "Configure core dumps and logs"
twopence_inject $sut "basic-config-files/sut/sysctl.conf" "/etc/sysctl.conf"
twopence_inject $sut "basic-config-files/sut/journald.conf" "/etc/systemd/journald.conf"

echo "Install client-side utilities"
twopence_inject $sut "basic-config-files/sut/wic.sh" "/usr/local/bin/wic.sh"
twopence_inject $sut "basic-config-files/sut/ifbind.sh" "/usr/local/bin/ifbind.sh"
twopence_inject $sut "basic-config-files/sut/log.sh" "/usr/local/bin/log.sh"
twopence_inject $sut "basic-config-files/sut/wait_for_cmd_success.sh" "/usr/local/bin/wait_for_cmd_success.sh"
twopence_inject $sut "basic-config-files/sut/wait_for_cmd_failure.sh" "/usr/local/bin/wait_for_cmd_failure.sh"
twopence_command $sut "chmod ugo+rx /usr/local/bin/*.sh"
gcc basic-config-files/sut/check_macvtap.c -o /tmp/a.out
twopence_inject $sut "/tmp/a.out" "/usr/local/bin/check_macvtap"
rm /tmp/a.out
twopence_command $sut "chmod ugo+rx /usr/local/bin/check_macvtap"

echo "Configure the addresses and routes"
twopence_inject $sut "basic-config-files/sut/global-config" "/etc/sysconfig/network/config"
twopence_inject $sut "basic-config-files/sut/dhcp-keep-leases" "/etc/sysconfig/network/dhcp-keep-leases"
twopence_inject $sut "basic-config-files/sut/dhcp-release-leases" "/etc/sysconfig/network/dhcp-release-leases"
twopence_command $sut "ln -sf /etc/sysconfig/network/dhcp-keep-leases /etc/sysconfig/network/dhcp"
twopence_inject $sut "basic-config-files/sut/ifcfg-eth0" "/etc/sysconfig/network/ifcfg-eth0"
twopence_inject $sut "basic-config-files/sut/ifcfg-eth1" "/etc/sysconfig/network/ifcfg-eth1"
twopence_inject $sut "basic-config-files/sut/ifroute-eth1" "/etc/sysconfig/network/ifroute-eth1"

echo
echo "### Please reboot the virtual machines ###"
echo "It is needed to activate the new configurations."

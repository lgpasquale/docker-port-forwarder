#!bin/bash

for redirection in $@; do
    src_port=$(echo ${redirection} | cut -d':' -f1)
    dst_ip=$(echo ${redirection} | cut -d':' -f2)
    dst_port=$(echo ${redirection} | cut -d':' -f3)
    protocol=$(echo ${redirection} | cut -d':' -f4)
    protocol=${protocol:=tcp}
    iptables -t nat -A PREROUTING -p ${protocol} --dport ${src_port} -j DNAT --to-destination ${dst_ip}:${dst_port}
done
iptables -t nat -A POSTROUTING -j MASQUERADE

tail -f /dev/null

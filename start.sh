#!/bin/bash

shopt -s expand_aliases
alias netex="ip netns exec"

./setup_topology.sh
./glorytun keygen > gt.key
./gt-server.sh
./gt-client.sh

echo "Ensure that the below entries are present in /etc/iproute2/rt_tables:
101 isp1
102 isp2
"
ip -n h1 rule add pref 10 from 11.0.0.2 table isp1
ip -n h1 route add default via 11.0.0.1 dev h1_s_a table isp1

ip -n h1 rule add pref 10 from 11.0.0.3 table isp2
ip -n h1 route add default via 11.0.0.1 dev h1_s_b table isp2

netex h1 ./glorytun path up 11.0.0.2 rate tx 15mbit rx 15mbit
netex h1 ./glorytun path up 11.0.0.3 rate tx 5mbit rx 5mbit

ip -n h1 route add default via 10.8.0.1 dev tun0


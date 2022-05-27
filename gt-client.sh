#!/bin/bash

shopt -s expand_aliases
alias netex="ip netns exec"

netex h1 ./glorytun bind 0.0.0.0 to 12.0.0.2 dev tun0 keyfile gt.key &
ip -n h1 addr add 10.8.0.2 peer 10.8.0.1 dev tun0
ip -n h1 link set dev tun0 up


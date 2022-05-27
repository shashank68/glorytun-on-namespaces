#!/bin/bash

shopt -s expand_aliases
alias netex="ip netns exec"

netex h2 ./glorytun bind 0.0.0.0 dev tun0 keyfile gt.key &
ip -n h2 addr add 10.8.0.1 peer 10.8.0.2 dev tun0
ip -n h2 link set dev tun0 up


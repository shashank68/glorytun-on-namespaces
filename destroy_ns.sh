#!/bin/bash

killall glorytun

ip netns del h1
ip netns del h2
ip netns del r
ip netns del s
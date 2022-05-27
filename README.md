# Glorytun UDP on network namespaces

## Dependencies

- Glorytun

```bash
wget https://github.com/angt/glorytun/releases/download/v0.3.4/glorytun-0.3.4-x86_64-linux-musl.bin
sudo apt install iperf3
```

## Usage

```bash
sudo ./start.sh
```

## Testing with iperf

- Server
```bash
sudo ip netns e h2 iperf3 -s
```

- Client
```bash
sudo ip netns h1 iperf3 -c 10.8.0.1  -b 20mbit -u
```


## Topology

- Host `h1` with 2 interfaces is connected to switch `s`.
- `s` is connected to router `r`.
- `r` is connected to host `h2` (which hosts the openvpn server)
 

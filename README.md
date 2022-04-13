Geth
====

A container for running the ethereum geth client on the ARM64 V8 architecture.

To build a container with geth.

```
$] sudo docker build -t q-crew/geth:latest .
```

To launch the container. 
```
$] sudo docker run -d --name geth --rm -p 6060:6060 -p 8545:8545 -p 8546:8546 -p 30303 -v /srv/geth:/root/.ethereum -v /var/run:/var/run q-crew/geth:1.10.17 geth --syncmode full --ipcpath /var/run/geth.sock --http --http.addr 0.0.0.0 --http.api eth,net,txpool,web3 --ws --ws.addr 0.0.0.0 --graphql --metrics --metrics.expensive --metrics.addr 0.0.0.0
```

#! /usr/bin/env bash
sudo ifconfig enx000ec6cac946 192.168.69.69
docker run -it --rm --init --net host -v "$(pwd)/data":/data networkboot/dhcpd enx000ec6cac946

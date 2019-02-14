#!/bin/bash
set -e
set -x

mkdir -p /home/vagrant/gohome
mkdir -p /home/vagrant/gohome/src
mkdir -p /home/vagrant/gohome/bin
mkdir -p /home/vagrant/gohome/pkg

sudo apk add --no-cache go

export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=/home/vagrant/gohome
export PATH=$PATH:$GOPATH/bin
echo "export GOROOT=/usr/lib/go" >> /home/vagrant/.profile
echo "export PATH=$PATH:$GOROOT/bin" >> /home/vagrant/.profile
echo "export GOPATH=/home/vagrant/gohome" >> /home/vagrant/.profile
echo "export PATH=$PATH:$GOPATH/bin" >> /home/vagrant/.profile

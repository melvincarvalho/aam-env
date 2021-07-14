#!/usr/bin/env bash

echo setup

HEAD=$(scw instance server list | grep run | cut -d' ' -f1)

echo "$HEAD"

scw instance server wait "$HEAD"

HOST=$(scw instance ip list | grep 51 | awk '{ print $2 }')

echo "$HOST"

echo "Waiting for $HOST to launch"

echo "Waiting sshd to launch on 22..."

while ! nc -z $HOST 22 ; do   
  sleep 0.5 # wait for 1/2 of the second before check again
  echo wait
done

echo "sshd launched"

echo "$HOST launched"

time ssh -oStrictHostKeyChecking=no root@$HOST "apt update; apt -y upgrade; apt install -y gcc g++ make haproxy ; curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - ; apt install nodejs ; npm i -g pm2 aam serve gitmark"


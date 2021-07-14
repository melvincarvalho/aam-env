#!/usr/bin/env bash

echo deploying

USER=${1:-'chores'}
HEAD=$(scw instance server list | grep run | cut -d' ' -f1)

echo "$HEAD"

scw instance server wait "$HEAD"


HOST=$(scw instance ip list | grep 51 | awk '{ print $2 }')

echo "$HOST"

time ssh -oStrictHostKeyChecking=no root@$HOST "adduser --disabled-password --gecos '' ${USER} ; sudo -u ${USER} -H bash -c 'mkdir ~${USER}/.ssh ; touch ~${USER}/.ssh/authorized_keys' ; cp .ssh/authorized_keys ~${USER}/.ssh/authorized_keys "

# ssh -oStrictHostKeyChecking=no root@$HOST
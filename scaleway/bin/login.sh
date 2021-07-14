#!/usr/bin/env bash

echo login

USER=${1:-'root'}

HEAD=$(scw instance server list | grep run | cut -d' ' -f1)

echo "$HEAD"

scw instance server wait "$HEAD"


HOST=$(scw instance ip list | grep 51 | awk '{ print $2 }')

echo "$HOST"

ssh -oStrictHostKeyChecking=no ${USER}@$HOST
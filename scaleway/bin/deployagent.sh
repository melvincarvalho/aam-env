#!/usr/bin/env bash

echo deploying

AAM=${1:-'chores'}
HEAD=$(scw instance server list | grep run | cut -d' ' -f1)

echo "$HEAD"

scw instance server wait "$HEAD"


HOST=$(scw instance ip list | grep 51 | awk '{ print $2 }')

echo "$HOST"

time ssh -oStrictHostKeyChecking=no ${AAM}@$HOST "aam install ${AAM} > ./tmp.sh ; . tmp.sh"

# ssh -oStrictHostKeyChecking=no root@$HOST
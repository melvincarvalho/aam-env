#!/usr/bin/env bash

echo deleting

HEAD=$(scw instance server list | grep run | cut -d' ' -f1)
SERVER=${1:-$HEAD}

HOST=$(scw instance ip list | grep 51 | awk '{ print $2 }')

echo "$HOST"

scw instance server stop "$SERVER"
scw instance server wait "$SERVER"
scw instance server delete "$SERVER"

scw instance ip delete "$HOST"
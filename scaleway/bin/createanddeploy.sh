#!/usr/bin/env bash

echo create and deploy

AGENT=${1:-'chores'}

bin/createserver.sh
bin/setupserver.sh
bin/createuser.sh "${AGENT}"
bin/deployagent.sh "${AGENT}"
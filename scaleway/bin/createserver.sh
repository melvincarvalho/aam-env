#!/usr/bin/env bash

echo creating


scw instance server create type=DEV1-S zone=fr-par-1 image=ubuntu_focal root-volume=l:20G name=scw-quirky-pasteur ip=new project-id=2dc39b48-f7b2-4ace-af36-534f8111ab36

scw instance server list

# sleep 5

HEAD=$(scw instance server list | grep start | cut -d' ' -f1)

echo "$HEAD"

scw instance server wait "$HEAD"
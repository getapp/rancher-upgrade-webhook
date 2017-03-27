#! /bin/bash

echo "Upgrading service $RANCHER_SERVICE_NAME"
service_id=rancher $RANCHER_SERVICE_NAME
echo "Service id is $service_id"
echo "Executing upgrade command: rancher upgrade $service_id --start_first --auto_complete --imageUuid=\"docker:$1:$2\""
rancher upgrade $service_id --start_first --auto_complete --imageUuid="docker:$1:$2"

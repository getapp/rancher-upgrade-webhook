#! /bin/sh
set -e

echo "Upgrading service $RANCHER_SERVICE_NAME"
service_id="$(rancher.py id_of $RANCHER_SERVICE_NAME)"
echo "Service id is $service_id"
echo "Executing upgrade command: rancher upgrade $service_id --start_first --auto_complete --imageUuid=\"docker:$1:$2\""
rancher.py upgrade $service_id --start_first --auto_complete --imageUuid="docker:$1:$2"
if [ -z "$SLACK_URL" ]; then
  slack.sh $SLACK_URL $SLACK_CHANNEL $SLACK_USER "Production has been updated to version \`$2\`"
fi
if [ -z "$APPSIGNAL_KEY" ]; then
  appsignal.sh $APPSIGNAL_KEY $APPSIGNAL_NAME $APPSIGNAL_ENVIRONMENT $2 $APPSIGNAL_REPO $3
fi

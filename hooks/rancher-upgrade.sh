#! /bin/sh
set -e

echo "Upgrading service $RANCHER_SERVICE_NAME"
service_id="$(rancher.py id_of $RANCHER_SERVICE_NAME)"
echo "Service id is $service_id"
echo "Executing upgrade command: rancher upgrade $service_id --start_first --auto_complete --imageUuid=\"docker:$1:$2\""
rancher.py upgrade $service_id --start_first --auto_complete --imageUuid="docker:$1:$2" --replace_env_name="APP_REVISION" --replace_env_value="$2"
if [ -n "$SLACK_URL" ]; then
  slack.sh $SLACK_URL $SLACK_CHANNEL $SLACK_USER "Production has been updated to version \`$2\`"
fi

A webhook to upgrade rancher service on quay.io callback.
Based on:
 * https://github.com/adnanh/webhook
 * [rancher API wrapper](https://raw.githubusercontent.com/etlweather/gaucho)
 * [slack client for bash](https://gist.github.com/dopiaza/6449505)

Set following `environment` variables to configure behavior:
 * RANCHER_SERVICE_NAME
 * SLACK_URL
 * SLACK_CHANNEL
 * SLACK_USER

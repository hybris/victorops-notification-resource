#!/usr/bin/env bash

set -e

ROUTINGKEY=${ROUTINGKEY:-""}
APIKEY=${APIKEY:-""}

DIR="$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"

echo -e 'Running \e[33mCheck\e[0m...'
if [ "$(echo "" | $DIR/assets/check | jq 'any')" != "false" ]; then
  echo "failed"
fi


echo -e 'Running \e[33mIn\e[0m...'
if [ "$(echo "" | $DIR/assets/in | jq -r '.version.ref')" -ne "0" ]; then
  echo "failed"
fi


echo -e 'Running \e[33mOut\e[0m...'
payload='
{
  "source": {
    "url": "https://alert.victorops.com/integrations/generic/20131114/alert/'${APIKEY}'/'${ROUTINGKEY}'"
  },
  "params": {
    "type": "INFO",
    "entity": "concourse/testing",
    "message": "@maksd testing concourse vo notification resource"
  }
}'
if [ "$(echo $payload | $DIR/assets/out | jq -r '.metadata[0].value')" != "success" ]; then
  echo "failed"
fi


echo -e '\e[32mall tests passed!\e[0m'

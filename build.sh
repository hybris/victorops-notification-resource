#!/usr/bin/env bash

docker build --no-cache -t victorops-notification-resource .
docker tag -f victorops-notification-resource teamidefix/victorops-notification-resource
docker push teamidefix/victorops-notification-resource

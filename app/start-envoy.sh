#!/bin/bash

set -e
set -v

if [ -z ${AWS_ELS_HOST} ] ; then
    echo "AWS ELS HOST NOT Passed"
    exit 1
else
    echo "${AWS_ELS_HOST} -- Replacing Host"
    sed "s/__ELS_PROXY_HOST/$AWS_ELS_HOST/g" /etc/envoy/kibana-envoy.yaml > /etc/envoy/envoy.yaml
fi

exec envoy -c /etc/envoy/envoy.yaml
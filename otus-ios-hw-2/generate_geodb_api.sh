#!/bin/sh

openapi-generator generate \
    -i geodb_swagger.json \
    -g swift5 \
    -o ./CitiesAPI \
    -c geodb_config.json
#    --global-property models,apis,modelTests,modelDocs,apiTests,apiDocs

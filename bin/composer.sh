#!/usr/bin/env bash
source "./.env"

echo "Checking for app/composer.json"
if [ -f ./app/composer.json ]
    then
        echo 'Updating ./app'
        docker-compose run --rm composer $@ -d ./app
    else
        docker-compose run --rm composer $@
fi
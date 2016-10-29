#!/usr/bin/env bash
docker-compose exec --user=1000:33 php php ./app/artisan $@
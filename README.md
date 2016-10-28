# Docker compose development environment

Use this setup as a basic setup for your development environment.

## Dinghy
This environment assumes dinghy http proxy is activated which catches all calls to *.docker.

How to install and activate dinghy you read here: https://github.com/codekitchen/dinghy

### .env

Basic environment variables are set in the .env file.

##### Currently:

- HOSTNAME: the url by which you access your app. Has to end with .docker
- PORTSUFFIX: Used to override some default ports for access
    - Elastichsearch
    - Mariadb
- MYSQL_ROOT_PASSWORD
- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD

### Start and stop

The environment can be controlled by:

- Start: `$ bin/start-environment.sh`
- Stop: `$ bin/stop-environment.sh`
- Restart: `$ bin/restart-environment.sh`
- Composer: `$ bin/composer.sh`

### Containers

The activated containers by default are:

- nginx
- mariadb
- php (7.0)
- composer
- mailcatcher
    - mailcatcher.docker
- elasticsearch
     - es.docker
     
### Override

To add or override your own containers you can edit the docker-compose.yml file.
Or use the docker-compose.override.yml
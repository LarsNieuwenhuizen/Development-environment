# Docker compose development environment

Use this setup as a basic setup for your development environment for macOS.

Credits for the initial setup of this environment go to [@radmiraal](https://github.com/radmiraal)

### Menu:

- [Docker](#docker)
- [Dinghy](#dinghy)
- [.env](#env)
- [Get started](#getstarted)
- [Start and stop](#startstop)
- [Public web root](#webroot)
- [Containers](#containers)
- [Override](#override)

## <a id="docker"></a>Docker
For this environment to work Docker, Docker compose and Docker machine have to be installed.
How to install and run this you can read here: [https://www.docker.com/products/docker](https://www.docker.com/products/docker)

## <a id="dinghy"></a>Dinghy
This environment assumes dinghy http proxy is activated which catches all calls to *.docker.

How to install and activate dinghy you read here: [https://github.com/codekitchen/dinghy](https://github.com/codekitchen/dinghy)

### <a id="env"></a>.env

Basic environment variables are set in the .env file.

##### <a id="currently"></a>Currently:

- HOSTNAME: the url by which you access your app. Has to end with .docker
- PORTSUFFIX: Used to override some default ports for access
    - Elastichsearch
    - Mariadb
- MYSQL_ROOT_PASSWORD
- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD
- MAILCATCHER_HOSTNAME
- ELASTICSEARCH_HOSTNAME

## <a id="getstarted"></a>Get started

To create an app like Symfony or Laravel you can simply use the framework installer.

- Ensure Dinghy is active and catching all request to *.docker. You can check this by opening a browser and going to whatever.docker/ You should see a dinghy start page
- Open the terminal and run `$ bin/install-framework.sh`
- Choose your framework
- The installer will install the framework and create a Web symlink to the public folder
- Run `$ bin/start-environment.sh`
- Go to [development.docker](http://development.docker/)
- You should see the start page of your framework
- Start developing :)

### <a id="startstop"></a>Start and stop

The environment can be controlled by:

- Start: `$ bin/start-environment.sh`
- Stop: `$ bin/stop-environment.sh`
- Restart: `$ bin/restart-environment.sh`
- Composer: `$ bin/composer.sh`

### <a id="startstop"></a>Public web root

If you create your application in ./app you can use:

`$ bin/generate-public-link.sh`

To generate a symlink named Web to point to your app's public web root.
THe supported frameworks currently are:

- [Flow](http://flow.neos.io)
- [Laravel](https://laravel.com/)
- [Symfony](http://symfony.com/)

This way the nginx configuration for the web root does not have to change.
The symlink is created automatically when you use the framework-installer.sh script in the bin folder.

### <a id="containers"></a>Containers

The activated containers by default are:

- nginx
    - VHOST: development.docker
- mariadb
- php (7.0)
- composer
- mailcatcher
    - VHOST: mailcatcher.docker
- elasticsearch
    - VHOST: es.docker

All the hostnames can be edited in .env file    
     
### <a id="override"></a>Override

To add or override your own containers you can edit the docker-compose.yml file.
Or use the docker-compose.override.yml

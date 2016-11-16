#!/usr/bin/env bash

source "./.env"

echo 'This installs your framework in the default app directory set in the .env file'

PS3='Choose your framework: '
options=("Flow" "Laravel" "Symfony" "None of the above")
select opt in "${options[@]}"
do
    case $opt in
        "Flow")
        echo "Flow is being installed"
        ./bin/composer.sh create-project --dev --keep-vcs neos/flow-base-distribution ${APPLICATION_DIRECTORY}
        ./bin/generate-public-link.sh Flow
        exit
        ;;
        "Laravel")
        echo "Laravel is being installed"
        ./bin/composer.sh create-project --prefer-dist laravel/laravel ${APPLICATION_DIRECTORY}
        ./bin/generate-public-link.sh Laravel
        exit
        ;;
        "Symfony")
            echo "Symfony is being installed"
            ./bin/symfony.sh new ${APPLICATION_DIRECTORY}
            ./bin/generate-public-link.sh symfony
        exit
        ;;
    esac
done
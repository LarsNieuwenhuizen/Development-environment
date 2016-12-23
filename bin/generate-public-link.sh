#!/bin/bash

if [ ! -z $1 ]
then
    case $1 in
        "Flow")
            ln -s ./app/Web/ Web
            exit
            ;;
        "Laravel")
            ln -s ./app/public/ Web
            exit
            ;;
        "Symfony")
            ln -s ./app/web/ Web
            exit
            ;;
        *) echo invalid option;;
    esac
else
    echo 'This generates a symlink to the public directory, choose your framework'

    PS3='Please enter your choice: '
    options=("Flow" "Laravel" "Symfony" "None of the above")
    select opt in "${options[@]}"
    do
        case $opt in
            "Flow")
                echo "Symlink for Flow is created"
                ln -s ./app/Web/ Web
                exit
                ;;
            "Laravel")
                echo "Symlink for Laravel is created"
                ln -s ./app/public/ Web
                exit
                ;;
            "Symfony")
                echo "Symlink for Symfony is created"
                ln -s ./app/web/ Web
                exit
                ;;
            "None of the above")
                echo "Sorry you'll have to create your own symlink"
                echo "use: ln -s ./app/{your_web_dir} Web"
                exit
                ;;
            *) echo invalid option;;
        esac
    done
fi
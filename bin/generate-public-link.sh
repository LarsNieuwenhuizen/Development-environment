#!/bin/bash

function generateForFlow() {
    echo "Symlink for Flow is created"
    ln -s ./app/Web/ Web
}
function generateForLaravel() {
    echo "Symlink for Laravel is created"
    ln -s ./app/public/ Web
}
function generateForSymfony() {
    echo "Symlink for Symfony is created"
    ln -s ./app/web/ Web
}

if  [ $1 == "Laravel" ]
    then
        generateForLaravel
    exit
fi
if [ $1 == "Symfony" ]
    then
        generateForSymfony
    exit
fi
if [ $1 == "Flow" ]
    then
        generateForFlow
    exit
fi


echo 'This generates a symlink to the public directory, choose your framework'

PS3='Please enter your choice: '
options=("Flow" "Laravel" "Symfony" "None of the above")
select opt in "${options[@]}"
do
    case $opt in
        "Flow")
            generateForFlow
            exit
            ;;
        "Laravel")
            generateForLaravel
            exit
            ;;
        "Symfony")
            generateForSymfony
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
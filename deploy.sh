#!/bin/bash

$START="Deploy script is started"

if [ $# -eq 0 ]
    then
        echo $START;
elif [ $1 == "dev" ]
    then
        if [[ -z $2 ]]
            then
                echo "Running dry-run"
                rsync --dry-run -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/dev.jlp.community/html
        elif [ $2 == "go" ]
            then
                echo "Running actual deploy"
                rsync -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/dev.jlp.community/html
        else
            echo $ERRORSTRING;
        fi
elif [ $1 == "staging" ]
    then
        if [[ -z $2 ]]
            then
                echo "Running dry-run"
                rsync --dry-run -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/staging.jlp.community/html
        elif [ $2 == "go" ]
            then
                echo "Running actual deploy"
                rsync -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/staging.jlp.community/html
        else
            echo $ERRORSTRING;
        fi
elif [ $1 == "production" ]
    then
        if [[ -z $2 ]]
            then
                echo "Running dry-run"
                rsync --dry-run -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/jlp.community/html
        elif [ $2 == "go" ]
            then
                echo "Running actual deploy"
                rsync -az --force --delete --progress --exclude-from=rsync_exclude.txt -e "ssh -p22" ./ admin@128.199.108.122:/var/www/jlp.community/html
        else
            echo $ERRORSTRING;
        fi
fi


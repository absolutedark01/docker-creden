#!/bin/bash

u="$USER"
where="$PWD"


if [ "$u" == 'creden' ]
then

    if [ "$where" == '/home/creden/docker-creden-creditscore-dev' ]
    then
        echo "docker start"
        # start build docker
        cd /home/creden/work/app/server/docker/openresty/ && \
        sudo docker build -t creden -f Dockerfile .

        sudo docker run --net="host" --name creden -v /home/creden/work/app:/home/creden/work/app -it creden bash
        
        sudo docker exec -it creden bash

   	    echo "sucessfully create folder"
    else
        echo "directory wrong "
        exit
    fi

else
    echo "user not creden : $u"
    exit
fi

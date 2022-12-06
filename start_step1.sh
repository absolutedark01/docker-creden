#!/bin/bash

u="$USER"
where="$PWD"


if [ "$u" == 'creden' ]
then

    if [ "$where" == '/home/creden/docker-creden-creditscore-dev' ]
    then
        echo "true directory"

        sudo apt-get install -y tmux
        sudo apt-get install -y redis-server
        sudo apt-get install -y htop

        #for nginx
        sudo apt install -y curl gnupg2 ca-certificates lsb-release
        echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" |sudo tee /etc/apt/sources.list.d/nginx.list
        curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
        sudo apt-key fingerprint ABF5BD827BD9BF62
        sudo apt update
        sudo apt-get install -y nginx

        # tmux plugins
        cd /home/creden/ && \
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

        cp /home/creden/docker-creden-creditscore-dev/tmp/tmux_conf/.tmux.conf /home/creden/

        cp /home/creden/docker-creden-creditscore-dev/tmp/bashprofile_conf/.bash_profile /home/creden/

        mkdir /home/creden/letsencrypt && \
        mkdir /home/creden/work && \
        mkdir /home/creden/work/app && \
        mkdir /home/creden/work/app/client && \
        mkdir /home/creden/work/app/client/face && \
        mkdir /home/creden/work/app/client/face/images && \
        mkdir /home/creden/work/app/client/face/images/card && \
        mkdir /home/creden/work/app/client/face/images/qrcode && \
        mkdir /home/creden/work/app/client/face/images/profile_pic && \
        mkdir /home/creden/work/app/client/face/images/pdf_report && \
        mkdir /home/creden/work/app/client/vdo && \
        mkdir /home/creden/work/app/client/vdo/ex && \

        chmod -R 777 /home/creden/work/app/client/face && \
        chmod -R 777 /home/creden/work/app/client/vdo && \
        
        mkdir /home/creden/work/app/server && \
        mkdir /home/creden/work/app/server/docker && \
        mkdir /home/creden/work/app/server/docker/openresty && \
        mkdir /home/creden/work/app/server/docker/openresty/logs 

        cd /home/creden/docker-creden-creditscore-dev/tmp && \
        tar -xzvf /home/creden/docker-creden-creditscore-dev/tmp/edoc.tar.gz && \
        mv /home/creden/docker-creden-creditscore-dev/tmp/edoc /home/creden/work/app/client
        chmod -R 755 /home/creden/work/app/client/edoc
        chmod -R 777 /home/creden/work/app/client/edoc/app-assets/images/signature

        cp /home/creden/docker-creden-creditscore-dev/tmp/env.sh /home/creden/work/app/
        cp /home/creden/docker-creden-creditscore-dev/tmp/rexe.sh /home/creden/work/app/
        cp /home/creden/docker-creden-creditscore-dev/tmp/setting.sh /home/creden/work/app/
        cp /home/creden/docker-creden-creditscore-dev/tmp/Dockerfile /home/creden/work/app/server/docker/openresty/
        cp -r /home/creden/docker-creden-creditscore-dev/tmp/conf /home/creden/work/app/server/docker/openresty/
        cp -r /home/creden/docker-creden-creditscore-dev/tmp /home/creden/work/app/

        cp /home/creden/docker-creden-creditscore-dev/tmp/sarabun.tar.gz /home/creden/work/app/client/face/images/card/
        cd /home/creden/work/app/client/face/images/card && \
        tar -xzvf /home/creden/work/app/client/face/images/card/sarabun.tar.gz
	
	    cd /home/creden/docker-creden-creditscore-dev/tmp && \
        tar -xzvf /home/creden/docker-creden-creditscore-dev/tmp/lua-scrypt.tar.gz
        cp -r /home/creden/docker-creden-creditscore-dev/tmp/lua-scrypt /home/creden/work/app/tmp/

        cd /home/creden/docker-creden-creditscore-dev/tmp && \
        tar -xzvf /home/creden/docker-creden-creditscore-dev/tmp/pdfTimestamp.tar.gz
        mv /home/creden/docker-creden-creditscore-dev/tmp/PDFTimestamping /home/creden/work/app/
        ln -s /home/creden/work/app/PDFTimestamping /home/creden/work/

        #Install redis docker 
        
        # docker pull redis:6.0.10-buster
        # docker run --memory="6g" --name redis \
        # -v /home/creden/docker-creden-creditscore-dev/tmp/redis-docker/redisconf:/usr/local/etc/redis \
        # -v /home/creden/docker-creden-creditscore-dev/tmp/redis-docker/mount_dumprdb:/data \
        # -v /home/creden/docker-creden-creditscore-dev/tmp/redis-docker/logs:/var/log/redis \
        # -p 6379:6379 redis redis-server /usr/local/etc/redis/redis.conf



        # cd /home/creden/docker-creden-creditscore-dev/tmp && \
        # tar -xzvf /home/creden/docker-creden-creditscore-dev/tmp/node_modules.tar.gz
        # mv /home/creden/docker-creden-creditscore-dev/tmp/node_modules /home/creden/work/app/

        # start build docker
        # cd /home/creden/work/app/server/docker/openresty/ && \
        # sudo docker build -t creden -f Dockerfile .

        # sudo docker run --net="host" --name creden -v /home/creden/work/app:/home/creden/work/app -it creden bash
        
        # sudo docker exec -it creden bash

   	    echo "sucessfully create folder"
    else
        echo "directory wrong "
        exit
    fi

else
    echo "user not creden : $u"
    exit
fi

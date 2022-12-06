FROM ubuntu:18.04

# Docker Build Arguments
ENV RESTY_VERSION="1.15.8.2" \
    RESTY_LUAROCKS_VERSION="3.2.1" \
    PDFTK_VERSION="2.02"

RUN apt-get update && \
    apt-get install -y libpcre3-dev perl make cmake build-essential poppler-utils curl \
        wget lua5.1 lua5.1-dev zlib1g-dev zlib1g unzip imagemagick vim libbarcode-zbar-perl \
        redis-tools software-properties-common python3-pip git zip
RUN apt-get install -y libssl1.0-dev

RUN apt-get install -y mongodb-clients redis-tools 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt -y install nodejs

# install luarock
RUN cd /tmp && \
    wget https://luarocks.org/releases/luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz && \
    tar zxpf luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz && \
    cd luarocks-${RESTY_LUAROCKS_VERSION} && \
    ./configure; make install

# install openresty
RUN PATH=/usr/local/openresty/bin:$PATH
RUN cd /tmp && \
    wget https://openresty.org/download/openresty-${RESTY_VERSION}.tar.gz && \
    tar -zxvf openresty-${RESTY_VERSION}.tar.gz && \
    cd openresty-${RESTY_VERSION} && \
    ./configure -j2 && \
    make -j2 && \
    make install

#mongo c driver for luarock lua-mongo
RUN cd /tmp && \
    git clone https://github.com/mongodb/mongo-c-driver.git && \
    cd mongo-c-driver && \
    python build/calc_release_version.py > VERSION_CURRENT && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
    make && \
    make install

RUN rm -rf /tmp/*
RUN apt-get clean

#RUN ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log && \
#    ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log 
 
 
#RUN apt-get install libbson-dev
RUN luarocks install https://raw.githubusercontent.com/isage/lua-cbson/master/rockspec/lua-cbson-git-1.rockspec

RUN luarocks install luasocket && \
    luarocks install redis-lua && \
    luarocks install luacrypto && \
    luarocks install resty-mongol && \
    luarocks install md5 && \
    luarocks install lua-cjson && \
    luarocks install lua-resty-exec && \
    luarocks install lua-resty-session && \
    luarocks install luabitop && \
    luarocks install copas && \
    luarocks install lua-websockets && \
    luarocks install luafilesystem && \
    luarocks install luasec && \
    luarocks install luasocket && \
    luarocks install netstring && \
    luarocks install date && \
    luarocks install lua-resty-cookie && \
    luarocks install htmlparser && \
    luarocks install luautf8 && \
    luarocks install utf8 && \
    luarocks install lua-resty-validation && \
    luarocks install lua-mongo

COPY ./conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
#CMD ["/usr/local/openresty/bin/openresty","-g","daemon off;"]
RUN export PATH=$PATH:$(pwd)

RUN apt-get update
RUN apt-get install -y python default-jre jq nghttp2 ffmpeg 
RUN apt-get install -y qrencode apt-transport-https ca-certificates gnupg openjdk-11-jdk 

# for nightmare chrome pupeteer
# RUN apt install -y libgbm-dev xvfb libxtst6 x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev libnotify-dev libgnome-keyring-dev libgconf2-dev libasound2-dev libcap-dev libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib

#Additional install
RUN apt-get update
# RUN apt-get install -y tmux

#qrcode
#https://www.unixmen.com/how-to-generate-a-qr-code-in-ubuntu-and-linuxmint/

# install google 
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y


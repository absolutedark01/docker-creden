#!/bin/bash

npm install nightmare
npm install stellar-sdk@0.10.3
npm install nodemailer --save
npm install redis --save
npm install puppeteer@5.2.1
npm install -g peerjs
npm update

ln -s /home/creden/work/app/server/capi /home/creden/scripts

#sockexec
cp /home/creden/work/app/tmp/sockexec /usr/bin/
chmod 755 /usr/bin/sockexec
sockexec /tmp/exec.sock &
chmod 777 /tmp/exec.sock

cp /home/creden/work/app/tmp/cpdf /usr/bin/


#wkhtml
# apt-get install -y libssl1.0-dev
cp /home/creden/work/app/tmp/wkhtmltox/bin/wkhtmltopdf /usr/bin/

#pdftk
sh /home/creden/work/app/tmp/pdftk_setup/install_pdftk.sh

#resty exec restart script
ln -s /home/creden/work/app/rexe.sh /usr/bin/rexe
chmod 777 /usr/bin/rexe

#resty.scrypt
cp /home/creden/work/app/tmp/lua-scrypt/scrypt.so /usr/local/share/lua/5.1/resty/
cp /home/creden/work/app/tmp/lua-scrypt/scrypt.lua /usr/local/share/lua/5.1/resty/

mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.off
apt-get install qrencode -y
chmod 777 /usr/bin/cpdf
chmod 777 /usr/bin/pdftk
chmod 777 /usr/bin/wkhtmltopdf
apt-get install zbar-tools -y

# #mongo lib
# curl -LO https://github.com/mongodb/libbson/releases/download/1.9.2/libbson-1.9.2.tar.gz
# tar xzf libbson-1.9.2.tar.gz
# cd libbson-1.9.2

# ./configure
# make
# make install

# curl -LO https://github.com/mongodb/mongo-c-driver/releases/download/1.9.2/mongo-c-driver-1.9.2.tar.gz
# tar xzf mongo-c-driver-1.9.2.tar.gz
# cd mongo-c-driver-1.9.2 

# ./configure --enable-extra-align=no
# make
# make install

# #mongo luarocks
# luarocks install lua-mongo 1.1.0
# luarocks install utf8

# #nightmare
# apt install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev libnotify-dev libgnome-keyring-dev libgconf2-dev libasound2-dev libcap-dev libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib
# export PATH=$PATH:$(pwd)
# ./npm install nightmare

# #java
# apt install default-jre

#stellar-sdk
# npm install stellar-sdk@0.10.3

# #jq
# apt-get install jq


#gclound setup
##export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
##echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
##curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
##sudo apt-get update && sudo apt-get install google-cloud-sdk
##sudo  apt-get install google-cloud-sdk-app-engine-java
#for gcloud storage
# apt-get install python-openssl

# #qrcode
# #https://www.unixmen.com/how-to-generate-a-qr-code-in-ubuntu-and-linuxmint/
# apt-get install qrencode

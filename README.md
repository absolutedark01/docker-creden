# Docker-build-server

<h1>Server requirement before </h1>


1. First step

    - create user creden permision root
    - gen key public and private key ( ssh-keygen )
    - create file authorzie for ssh  ~/.ssh/authorized_keys
    
2. git clone this repos

    - **important add public key your server in repos guthub ( tom add )
    - git clone git@github.com:tomanupong/docker-creden-creditscore-dev.git
    - clone repos นี้ไปวาง ไว้ที่ path: /home/creden/...

3.  run script for isntall default package

        - เข้าไป path: /home/creden/docker-creden-creditscore-dev/ ที่ clone มา แล้ว แล้ว รันไฟล์
        - ./start_step1.sh 
        -  source /home/creden/.bash_profile
        -  create tmux room up to you
        -  tmux source ~/.tmux.conf
        -  for tmux install plugin control + a + shift + i

3.1 install docker ( up to your os server ) link this is for debian 10

        - install step 1 to step 2
        - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10

4. run script

        - เข้าไป path: /home/creden/docker-creden-creditscore-dev/ ที่ clone มา แล้ว แล้ว รันไฟล์ 
        - in tmux run ./start_step2.sh
        - after build image docker exit docker
        - after exit docker start docker container creden run => docker start creden 
        - run command for run container creden bash => dk 

    - หลังจากรัน start_step2.sh เรียบร้อยแล้ว shell พา เข้ามาใน docker creden อัตโนมัติ หลังจากนั้นไปที่ path : /home/creden/work/app/ เพือ รัน script sh setting.sh ใน docker
  
        - sh setting.sh

    - หลังรัน setting.sh ให้ ออกจาก docker creden แล้วลง ตามนี้
   
        - install mongo version 4.4 : https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/


<h1>****** ข้อควรแนะนำ ****** ( อย่าลืมแก้ config ที่ nginx และ openresty ) </h1>

- ระวังเรื่อง env ของไฟล์ /home/creden/work/app/env.sh และ env ใน openresty
- Don't create folder < work > before run script ./start_step1.sh
- ตั้งค่า path server nginx อยู่ที่ user creden : /etc/nginx/conf.d/default.conf
- path openresty อยู่ที่ user creden ทั้ง docker : /home/creden/work/app/server/docker/openresty/conf/nginx.conf
- ถ้า stellar ไม่ได้ให้ npm install stellar-sdk ใน docker
- แก้ hostname ที่ต้นทาง env.sh (เวลา run จะได้ hostname แบบเดียวกันหมด)
- cert ssl แล้วแต่ server link this : https://certbot.eff.org/lets-encrypt/debianstretch-nginx
- google vision and gen key


<h1> ref link open source </h1>

- https://github.com/tmux-plugins/tpm
- https://github.com/tmux-plugins/tmux-resurrect






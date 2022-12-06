#test api scripts
alias x='curl https://creden.co/ | wc -l'
alias apix='sh /home/creden/work/app/server/capi/unti_orc.sh'
alias chk_apix='sh /home/creden/work/app/server/capi/check_unit_kyc.sh'
alias vb='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'

#disk usage
alias du1='du -h --max-depth=1'

#Git
alias gpu='git pull origin master'
alias gp='git push origin master'

alias n='geeknote'
alias nx='openresty -p `pwd` -c conf/nginx.conf'
alias nxr='openresty -p `pwd` -s reload'
alias nxs='openresty -p `pwd` -s stop'

#export PATH=/usr/local/openresty/bin:$PATH
export PATH=/usr/local/openresty/bin:$PATH
export PATH=~/.local/bin:$PATH

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
alias t='todo.sh' 
alias dap='cd ~/work/app/server/capi'
alias db='cd ~/work/app/client/business'
alias de='cd ~/work/app/client/esig'
alias dc='cd ~/work/app/client/company'
alias dl='cd ~/work/app/server/docker/openresty/logs'
alias company='cd ~/work/app/client/esig3/company'
alias sap='cd ~/work/app/server/sapi'

#maven
alias run='mvn tomcat7:run'
alias irun='mvn clean install tomcat7:run'

#openvpn
alias vpn='sudo /usr/local/Cellar/openvpn/2.3.6/sbin/openvpn ~/vpn/client.conf'

#netstat
alias ck='netstat -tulp | grep '

#vim
alias vpi='vim scp://pi@192.168.1.41//home/pi/'
alias vli='vim scp://sysnajar@linode.myftp.org//home/sysnajar/'

#tmux
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tmr='tmux send-keys -t "process:1" C-c '"'"./run_eark.sh"'"' Enter'

#etc
alias c='clear'

#visual studio
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#env
export HOST_NAME='creden'

#docker
alias dk='sudo docker exec -it creden bash'

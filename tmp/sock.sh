ps aux | grep 'sockexec' | grep '/tmp/' | awk -F ' ' '{print $2}' | /home/creden/work/app/tmp/kill.lua
rm -rf /tmp/exec.sock
rm -rf /tmp/exec.facebox.sock
/home/creden/work/app/tmp/sockexec -q 100 -m 100 -t 18000 /tmp/exec.sock &
/home/creden/work/app/tmp/sockexec /tmp/exec.facebox.sock &
sleep 1
chmod 777 /tmp/exec.sock
chmod 777 /tmp/exec.facebox.sock
#redis-cli set u $(whoami)
redis-cli set sock on

. /home/creden/work/app/env.sh && ps aux | grep 'sockexec' | grep '/tmp/' | awk -F ' ' '{print $2}' | /home/creden/work/app/tmp/reset_exec.lua

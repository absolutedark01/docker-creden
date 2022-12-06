#!/usr/bin/env lua

for line in io.stdin:lines() do
  local c = "kill " .. line
  print('cmd = ', c)
  os.execute(c)
end

os.execute("rm /tmp/exec.sock")
os.execute("rm /tmp/exec.facebox.sock")
os.execute(". /home/creden/work/app/env.sh")
os.execute("sockexec -q 100 -m 100 -t 18000 /tmp/exec.sock &")
os.execute("sockexec /tmp/exec.facebox.sock &")
os.execute("sleep 1")
os.execute("chmod 777 /tmp/exec.sock")
os.execute("chmod 777  /tmp/exec.facebox.sock")
os.execute("/usr/local/openresty/bin/openresty -p /home/creden/work/app/server/docker/openresty  -c conf/nginx.conf -s stop")
os.execute("/usr/local/openresty/bin/openresty -p /home/creden/work/app/server/docker/openresty  -c conf/nginx.conf")

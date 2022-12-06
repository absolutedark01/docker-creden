#!/usr/bin/env lua

os.execute("rm /tmp/exec.sock")
os.execute("rm /tmp/exec.facebox.sock")

os.execute("ln -s /home/creden/work/app/tmp/exec.sock /tmp/exec.sock")
os.execute("ln -s /home/creden/work/app/tmp/exec.facebook.sock /tmp/exec.facebook.sock")

os.execute("/usr/local/openresty/bin/openresty -p /home/creden/work/app/server/docker/openresty  -c conf/nginx.conf -s stop")
os.execute("/usr/local/openresty/bin/openresty -p /home/creden/work/app/server/docker/openresty  -c conf/nginx.conf")

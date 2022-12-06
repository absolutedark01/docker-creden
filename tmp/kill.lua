#!/usr/bin/env lua
for line in io.stdin:lines() do
  local c = "kill " .. line
  print('cmd = ', c)
  os.execute(c)
end

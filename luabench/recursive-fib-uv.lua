-- Author: Mike Pall
-- https://github.com/LuaJIT/LuaJIT-test-cleanup
-- 
local function fib(n)
  if n < 2 then return 1 end
  return fib(n-2) + fib(n-1)
end

local n = tonumber(arg[1]) or 10
io.write(string.format("Fib(%d): %d\n", n, fib(n)))


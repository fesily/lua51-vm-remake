-- This file is part of the Luau programming language and is licensed under MIT License; see LICENSE.txt for details
-- This file is based on Lua 5.x tests -- https://github.com/lua/lua/tree/master/testes
print "testing datetime library"


local utc_offset = (function()
  local now = os.time()
  return os.difftime(now, os.time(os.date("!*t", now)))
end)()

local function checkerr(msg, f, ...)
  local stat, err = pcall(f, ...)
  assert(not stat and string.find(err, msg, 1, true), err)
end

assert(os.date("") == "")
assert(os.date("!") == "")
local x = string.rep("a", 10000)
assert(os.date(x) == x)
local t = os.time()
D = os.date("*t", t)
assert(os.date(string.rep("%d", 1000), t) ==
  string.rep(os.date("%d", t), 1000))
assert(os.date(string.rep("%", 200)) == string.rep("%", 100))
if _VERSION == "Lua 5.1" then
  assert(os.date("", -1) == "")
else
  assert(os.date("", -1) == nil)
end

--os.time() utc time
--os.time(t) t is local time
--os.data()

local function checkDateTable(t)
  local D = os.date("!*t", t)
  local DC = os.date("!%Y %m %d %H %M %S %j", t)

  local D_str = ("%04d %02d %02d %02d %02d %02d %03d"):format(
    D.year, D.month, D.day, D.hour, D.min, D.sec, D.yday)
  assert(D_str == DC)

  assert(os.time(D) + utc_offset == t)
end

checkDateTable(os.time())

if _VERSION ~= "Lua 5.1" then
  checkerr("invalid conversion specifier", os.date, "%9")
  checkerr("invalid conversion specifier", os.date, "%O")
  checkerr("invalid conversion specifier", os.date, "%E")
  checkerr("invalid conversion specifier", os.date, "%Ea")
end


checkerr("field 'day' missing in date table", os.time, { hour = 12 }) -- missing date

do
  local D = os.date("*t")
  local t = os.time(D)
  if D.isdst == nil then
    print("no daylight saving information")
  else
    assert(type(D.isdst) == 'boolean')
  end
  D.isdst = nil
  local t1 = os.time(D)
  assert(t == t1) -- if isdst is absent uses correct default
end

local D = os.date("*t")
t = os.time(D)
D.year = D.year - 1;
local t1 = os.time(D)
-- allow for leap years
assert(math.abs(os.difftime(t, t1) / (24 * 3600) - 365) < 2)

-- should not take more than 1 second to execute these two lines
t = os.time()
t1 = os.time(os.date("!*t"))+utc_offset
local diff = os.difftime(t1, t)
assert(0 <= diff and diff <= 1)
diff = os.difftime(t, t1)
assert(-1 <= diff and diff <= 0)

local t1 = os.time { year = 2000, month = 10, day = 1, hour = 23, min = 12 }
local t2 = os.time { year = 2000, month = 10, day = 1, hour = 23, min = 10, sec = 19 }
assert(os.difftime(t1, t2) == 60 * 2 - 19)

assert(os.time({ year = 1970, day = 1, month = 1, hour = 0 })+utc_offset == 0)

return 'OK'

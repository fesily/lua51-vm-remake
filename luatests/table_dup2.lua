function gettable() 
return {
a0 = 0,
a1 = 1,
a2 = 2,
a3 = 3,
a4 = 4,
[1] = 301,
[2] = 302,
[3] = 303,
}
end

t = gettable()
print(t["a0"], t["a1"], t["a2"], t["a3"], t["a4"], t["a200"], t[0], t[-1], t[1], t[2], t[3], t[4])
t["a0"] = t["a0"] + 1
t[1] = t[1] + 1
print(t["a0"], t["a1"], t["a2"], t["a3"], t["a4"], t["a200"], t[0], t[-1], t[1], t[2], t[3], t[4])

t2 = gettable()
print(t2["a0"], t2["a1"], t2["a2"], t2["a3"], t2["a4"], t2["a200"], t2[0], t2[-1], t2[1], t2[2], t2[3], t2[4])

print(t["a0"], t["a1"], t["a2"], t["a3"], t["a4"], t["a200"], t[0], t[-1], t[1], t[2], t[3], t[4])


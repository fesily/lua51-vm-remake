t1 = { [false] = 1, [true] = 2 }
t2 = { a = 2, b = 3, [1] = 4, [2] = 5, [3.45] = -0 }
t3 = { 4, 5, 6, 7, 8 }
t4 = { a = nil, b = 233, [1] = nil, [2] = "asd" }

print(t1[false], t1[true], t1[0], t1[1])
print(t2.a, t2.b, t2[1], t2[2], t2[3.45], t2[4])
print(t3[0], t3[1], t3[2], t3[3], t3[4], t3[5], t3[6])
print(t4.a, t4.b, t4[0], t4[1], t4[2], t4[3])


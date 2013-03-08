L = 10000
#L = 100000

def make_sample():
    cource = [(0, 1000000)]
    for _ in xrange(L):
        cource.append((0, 1))
        cource.append((9999, 10000))
    cource.append((0, 1000000))
    return cource

cource = make_sample()

print len(cource)-1
print 1000, 1000
for l,r in cource:
    print l,r

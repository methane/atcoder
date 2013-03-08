import sys

for L in sys.stdin:
    L = int(L)
    if L % 400 == 0:
        print "YES"
    elif L % 100 == 0:
        print "NO"
    elif L % 4 == 0:
        print "YES"
    else:
        print "NO"

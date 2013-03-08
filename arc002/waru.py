from datetime import *
import sys

td = timedelta(days=1)

for L in sys.stdin:
    y,m,d = map(int, L.strip().split('/'))
    d = datetime(y,m,d)
    while d.year % (d.month * d.day) != 0:
        d += td
    print "%04d/%02d/%02d" % (d.year, d.month, d.day)

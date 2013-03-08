import sys
import math

def main():
    N = int(sys.stdin.readline().strip())

    dists = []
    for _ in xrange(N):
        dists.append(int(sys.stdin.readline().strip()))

    S = sum(dists)
    M = max(dists)
    print S

    if N == 0:
        print 0
    elif N == 1:
        print dists[0]
    elif N == 2:
        print abs(dists[0]-dists[1])
    elif S >= M*2:
        print 0
    else:
        print M*2-S

main()

import sys
import math

def main():
    N = int(sys.stdin.readline().strip())

    dots = []
    for _ in xrange(N):
        L = sys.stdin.readline().strip().split()
        dots.append((int(L[0]), int(L[1])))

    dist = 0
    for i in xrange(N):
        for j in xrange(i+1, N):
            d = math.hypot(dots[i][0]-dots[j][0], dots[i][1]-dots[j][1])
            if d > dist:
                dist = d
    print dist

main()

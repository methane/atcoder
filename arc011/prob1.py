import sys

m, n, N = map(int, sys.stdin.readline().split())


def main():
    x = total = N
    while x >= m:
        nn = (x // m) * n
        total += nn
        x = (x % m) + nn
    print total

main()

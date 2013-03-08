from __future__ import print_function
import sys

def remote(a, b):
    T = [0,1,2,3,2,1,2,3,3,2,1]
    d = abs(b-a)
    return T[d%10] + d // 10

def test():
    print('test')
    assert remote(7, 34) == 5
    assert remote(19, 28) == 2
    assert remote(10, 10) == 0

def main():
    if 'test' in sys.argv:
        test()
    else:
        L = sys.stdin.readline().split()
        print(remote(*map(int, L)))

if __name__ == '__main__':
    main()

import sys
from collections import deque

def sibling(w1, w2):
    c = 0
    for c1, c2 in zip(w1, w2):
        if c1 != c2:
            c += 1
            if c > 1:
                return False
    return c == 1

def answer(first, last, route):
    print len(route)
    print first
    for w in route:
        print w
    print last
    sys.exit()

def main():
    readline = sys.stdin.readline
    first, last = readline().split()
    N = int(readline())
    words = [readline().strip() for _ in range(N)]

    if first == last:
        answer(first, last, ())

    unused = set(words)
    unused.add(last)
    que = deque()
    que.append((first, ()))

    while que:
        word, route = que.popleft()
        for ww in list(unused):
            if sibling(word, ww):
                unused.remove(ww)
                if ww == last:
                    answer(first, last, route)
                else:
                    que.append((ww, route + (ww,)))
    else:
        print -1

main()

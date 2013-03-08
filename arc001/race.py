from __future__ import division, print_function

import sys
from math import hypot

def read_split():
    return tuple(map(int, sys.stdin.readline().split()))

def shortest(start, goal, cource):
    L = len(cource)

    max_left_tilt = min_right_tilt = (goal-start)/L
    max_left = min_right = L

    for yy, (left, right) in enumerate(cource, 1):
        tilt = (left-start) / yy
        if tilt > max_left_tilt:
            max_left_tilt = tilt
            max_left = yy

        tilt = (right-start) / yy
        if tilt < min_right_tilt:
            min_right_tilt = tilt
            min_right = yy

    if max_left < L:
        middle = cource[max_left-1][0]
        return (shortest(start, middle, cource[:max_left]) +
                shortest(middle, goal, cource[max_left:]))
    elif min_right < L:
        middle = cource[min_right-1][1]
        return (shortest(start, middle, cource[:min_right]) +
                shortest(middle, goal,  cource[min_right:]))
    else:
        return hypot(goal-start, L)


def main():
    length = int(sys.stdin.readline().strip())
    start, goal = read_split()
    read_split()
    cource = [read_split() for _ in xrange(length)]
    cource[-1] = (goal, goal)
    print(shortest(start, goal, cource))

main()

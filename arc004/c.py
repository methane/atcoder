import fractions
import sys

def main():
    f = fractions.Fraction(sys.stdin.readline().strip())
    X = f.numerator
    Y = f.denominator
    T = int(f*2)

    for i in xrange(T-20, T+20):
        if i % Y != 0:
            continue
        S = (1+i) * i / 2
        x = X * (i / Y)
        if 1 <= S-x <= i:
            print i, S-x
            #print i*(i+1)/2 - x
            break
    else:
        print "Impossible"

main()

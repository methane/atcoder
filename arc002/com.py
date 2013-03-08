import sys
sys.stdin.readline()
commands = sys.stdin.readline().strip()

shortcuts = """
AA AB AX AY
BA BB BX BY
XA XB XX XY
YA YB YX YY
""".split()

min_ = len(commands)

for L in shortcuts:
    for R in shortcuts:
        n = len(commands.replace(L, 'L').replace(R, 'R'))
        if n < min_:
            min_ = n

print(min_)

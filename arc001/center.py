import sys
sys.stdin.readline()
L = sys.stdin.readline().strip()
counts = [L.count(x) for x in '1234']
print max(counts), min(counts)

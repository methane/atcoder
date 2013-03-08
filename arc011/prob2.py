import sys
import string

sys.stdin.readline()
L = sys.stdin.readline().strip()
M = dict(zip("zrbcdwtjfqlvsxpmhkng", "00112233445566778899"))

def trans(s):
    return ''.join(M.get(x, '') for x in s.lower())

ans = filter(None, map(trans, L.split()))
print ' '.join(ans)

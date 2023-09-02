#!/usr/bin/env python3

import sys
import math

def factorize(n):
    for i in range(2, int(math.sqrt(n))+1):
        if n % i == 0:
            return i, n//i
    return None, None

if len(sys.argv) != 2:
    print("Usage: factors <file>")
    sys.exit(1)

filename = sys.argv[1]

try:
    with open(filename, 'r') as f:
        for line in f:
            n = int(line.strip())
            p, q = factorize(n)
            print("{}={}*{}".format(n, p, q))
except IOError:
    print("Error: Could not read file", filename)
    sys.exit(1)

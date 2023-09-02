#!/usr/bin/python3

import sys
import math


def factorize(n):
    """
    Factorize a given integer n into its prime factors.

    Args:
        n (int): The integer to be factorized.

    Returns:
        list: A list of prime factors of n.
    """
    factors = []
    for i in range(2, int(math.sqrt(n)) + 1):
        while n % i == 0:
            factors.append(i)
            n //= i
    if n > 1:
        factors.append(n)
    return factors


if len(sys.argv) != 2:
    print("Usage: factors <file>")
    sys.exit(1)

input_file = sys.argv[1]

try:
    with open(input_file, "r") as file:
        for line in file:
            n = int(line.strip())
            factors = factorize(n)
            if len(factors) >= 2:
                p = factors[0]
                q = n // p
                print(f"{n}={p}*{q}")

except FileNotFoundError:
    print(f"Error: File '{input_file}' not found.")
    sys.exit(1)
except ValueError:
    print("Error: Invalid input in the file.")
    sys.exit(1)

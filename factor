#!/usr/bin/python3
from sys import argv
import math
"""Factorize as many numbers as possible into a product of 2 smaller nums"""


def factory(num):
    """gets the factors of a num"""
    if num % 2 == 0:
        index = 2
        print("{}={}*{}".format(num, int(num//index), index))
    else:
        sq = int(math.sqrt(num)) + 1
        for i in range(3, sq, +2):
            if num % i == 0:
                print("{}={}*{}".format(num, int(num//i), i))
                return
            if num % (sq + i) == 0:
                print("{}={}*{}".format(num, sq + i, int(num//(sq + i))))
                return
            if num % (sq - i) == 0:
                print("{}={}*{}".format(num, sq - 1, int(num//(sq - i))))
                return


def factors(filename):
    """read file and print"""

    with open(filename, encoding="utf-8") as my_file:
        for line in my_file.readlines():
            n = int(line)
            result = factory(n)


if __name__ == "__main__":
    factors(argv[1])

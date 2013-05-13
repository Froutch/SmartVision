#!/usr/bin/env python
from socket import * 
import sys


if __name__ == '__main__':
    targetIP = sys.argv[1]

    #scan reserved ports
    for i in range(20, 1025):
        s = socket(AF_INET, SOCK_STREAM)

        result = s.connect_ex((targetIP, i))

        if(result == 0) :
            print '%d' % (i,)
        s.close()

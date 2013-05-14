#!/usr/bin/env python
from socket import * 
import sys
from timeout import timeout

@timeout(1)
def port(targetIP, i)
    s = socket(AF_INET, SOCK_STREAM)
    result = s.connect_ex((targetIP, i))
    return result


if __name__ == '__main__':
    targetIP = sys.argv[1]

    #scan reserved ports
    for i in range(22, 143):
	

        result = port(targetIP, i)

        if(result == 0) :
            print '%d' % (i,)
        s.close()

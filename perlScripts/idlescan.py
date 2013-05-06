#!/usr/bin/python
# -*- coding: utf8 -*- 
from scapy.all import *
from sys import argv

port = int(argv[1])
victim = argv[2]
zombie = argv[3]

# Récupération de l'id ip du zombie
p1 = sr1(IP(dst=zombie)/TCP(sport=12345,dport=(123),flags="SA"),verbose=0)
initial_id = p1.id

# Envoi du SYN à la victime en usurpant l'ip du zombie
p2 = send(IP(dst=victim,src=zombie)/TCP(sport=12345,dport=(port),flags="S"),verbose=0)

# Récupération de l'id ip du zombie
p3 = sr1(IP(dst=zombie)/TCP(sport=12345,dport=(123),flags="SA"),verbose=0)
final_id = p3.id

# Conclusion ...
if final_id - initial_id == 1:
  print "Port %d : Not open" % port
elif final_id - initial_id == 2:
  print "Port %d : Open" % port

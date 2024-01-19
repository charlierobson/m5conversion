import sys

bin = open(sys.argv[1],"rb")
p1 = bin.read(8192)
p2 = bin.read(8192)
p3 = bin.read(8192)
bin.close()

if p1:
	a1 = open("m5port.1", "wb")
	a1.write(p1)
	a1.close()

if p2:
	a2 = open("m5port.2", "wb")
	a2.write(p2)
	a2.close()

if p3:
	a3 = open("m5port.3", "wb")
	a3.write(p3)
	a3.close()

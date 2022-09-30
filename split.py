bin = open("antarhack.bin","rb")
p1 = bin.read(8192)
p2 = bin.read(8192)
bin.close()

a1 = open("antaradv.1", "wb")
a1.write(p1)
a1.close()

a2 = open("antaradv.2", "wb")
a2.write(p2)
a2.close()

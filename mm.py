import sys
import re

# input is file filled with finds from ghidra:
#        ram:846d 3a 00 60        LD         A,(DAT_ram_6000)

# after replacements it looks like:
# 9b57 dd 21 10 60 # LD # IX,$7010

def outputPatch(address, len, mnemo):
	print(f"PATCH(${address},{len})\n\t{mnemo}\nENDPATCH(${address},{len})\n")


if __name__ == "__main__":
	f = open(sys.argv[1],"r")
	lines = f.readlines()
	for line in lines:
		line = line.rstrip()
		line = line.replace("        ram:","")
		line = line.replace("           "," # ")
		line = line.replace("         "," # ")
		line = line.replace("        "," # ")
		line = line.replace("     "," # ")
		line = line.replace("0x6","$7")
		line = line.replace("DAT_ram_6","$7")
		if m := re.match("(\w\w\w\w)([ \w\w]+) # (\w+) # (.*)", line):
			outputPatch(m.groups()[0], len(m.groups()[1].split()), f"\t{m.groups()[2]} {m.groups()[3]}")
		else:
			print(f"couldn't match '{line}'")

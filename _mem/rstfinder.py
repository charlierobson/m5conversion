import os
import fnmatch

def mhex(val):
	return '0123456789ABCDEF'[val >> 4] + '0123456789ABCDEF'[val & 0x0f]

def instrat(valIdx):
	val = bytes[valIdx]
	if val == 0x00:
		return "-" 
	if val == 0xff:
		return "-" 
	if val == 0xc9:
		return "ret" 
	if val == 0xc3:
		return "jp " + f"{mhex(bytes[valIdx+2])}{mhex(bytes[valIdx+1])}"


path= r"C:\Users\robsonc\gh\mamebuild\roms\coleco\x"
files = os.listdir( path )

for file in files:
	if not fnmatch.fnmatch(file, "*.1"):
		continue

	raw = open(path + '\\' + file, "rb")
	bytes = raw.read()
	print(file)
	print(f"Cart_Sig   = {mhex(bytes[0])}{mhex(bytes[1])}")
	print(f"RamSprtTab = {mhex(bytes[3])}{mhex(bytes[2])}")
	print(f"RAMSprtIdx = {mhex(bytes[5])}{mhex(bytes[4])}")
	print(f"VDP_Temp   = {mhex(bytes[7])}{mhex(bytes[6])}")
	print(f"CtlState   = {mhex(bytes[9])}{mhex(bytes[8])}")
	print(f"Cart_Start = {mhex(bytes[11])}{mhex(bytes[10])}")
	print(f"V_RST_08H  = {instrat(12)}")
	print(f"V_RST_10H  = {instrat(15)}")
	print(f"V_RST_18H  = {instrat(18)}")
	print(f"V_RST_20H  = {instrat(21)}")
	print(f"V_RST_28H  = {instrat(24)}")
	print(f"V_RST_30H  = {instrat(27)}")
	print(f"V_RST_38H  = {instrat(30)}")
	print(f"V_NMI      = {instrat(33)}")
	print()


















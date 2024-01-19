build <root name of rom>
gc 16k


One-time setup:

Configure ghidra search for > 500 items (5000 usually fine)
Configure ghidra search view to have location, byte count and preview columns

Copy the following to the coleco xml in mame/hashes:

```
	<software name="m5port8k">
		<!-- Castelo (1985) (Splice).bin -->
		<description>M5Port-8k</description>
		<year>1991</year>
		<publisher>SMB</publisher>
		<info name="developer" value="Splice" />
		<part name="cart" interface="coleco_cart">
			<dataarea name="rom" size="8192">
				<rom name="m5port.1" size="8192" crc="0" sha1="0" offset="0x0000" />
			</dataarea>
		</part>
	</software>

	<software name="m5port16k">
		<!-- Castelo (1985) (Splice).bin -->
		<description>M5Port-16k</description>
		<year>1991</year>
		<publisher>SMB</publisher>
		<info name="developer" value="Splice" />
		<part name="cart" interface="coleco_cart">
			<dataarea name="rom" size="16384">
				<rom name="m5port.1" size="8192" crc="0" sha1="0" offset="0x0000" />
				<rom name="m5port.2" size="8192" crc="0" sha1="0" offset="0x2000" />
			</dataarea>
		</part>
	</software>
```
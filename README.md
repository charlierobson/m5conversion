# m5conversion

Corrupt gfx?
* ascii-table ptr @$6c
* direct access of ~$158B

Patched code not being hit?
* did it contain call to bios or other address that might be over-patched?

* watch out for mame OUT/IN detection and OTIR/INIR

Irqs not firing despite EI?
* int bit in vdp register 1
* reti needs to have been called
* retn anywhere?

regex

^(\$\w\w\w\w) (.*)
PATCH($1,3)\n   $2\nENDPATCH($1,3)\n

^ram:(\w\w\w\w) (.*)
PATCH($$$1,3)\n   $2\nENDPATCH($$$1,3)\n


$$ for literal dollar in replacement
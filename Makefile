debug: esp8266/debug/0x00000.bin esp8266/debug/0x40000.bin
	esp8266/tools/esptool.py -p COM1 write_flash 0x00000 esp8266/debug/0x00000.bin 0x40000 esp8266/debug/0x40000.bin

release: esp8266/release/0x00000.bin esp8266/release/0x40000.bin
	esp8266/tools/esptool.py -p COM1 write_flash 0x00000 esp8266/release/0x00000.bin 0x40000 esp8266/release/0x40000.bin


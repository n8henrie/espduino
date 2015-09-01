ESP_PORT ?= /dev/tty.usbmodem262121
FW_BUILD_DIR = /Users/n8henrie/Dropbox/Launch/HomeMade/github/esp_bridge/firmware

test:
	esp8266/tools/esptool.py -p $(ESP_PORT) read_mac

debug: esp8266/debug/0x00000.bin esp8266/debug/0x40000.bin
	esp8266/tools/esptool.py -p $(ESP_PORT) write_flash 0x00000 esp8266/debug/0x00000.bin 0x40000 esp8266/debug/0x40000.bin

release: esp8266/release/0x00000.bin esp8266/release/0x40000.bin
	esp8266/tools/esptool.py -p $(ESP_PORT) write_flash 0x00000 esp8266/release/0x00000.bin 0x40000 esp8266/release/0x40000.bin

copy_debug: $(FW_BUILD_DIR)/0x00000.bin $(FW_BUILD_DIR)/0x40000.bin
	for fw in $^; do cp $$fw esp8266/debug/; done

copy_release: $(FW_BUILD_DIR)/0x00000.bin $(FW_BUILD_DIR)/0x40000.bin
	for fw in $^; do cp $$fw esp8266/release/; done

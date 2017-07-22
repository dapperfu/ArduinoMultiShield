# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

MONITOR_BAUDRATE ?= 115200

# Board Configuration
VENDOR ?= arduino
ARCHITECTURE ?= avr
BOARD_TAG ?= uno

# Configure directory paths.
WORKSPACE ?= $(realpath $(dir $(firstword $(MAKEFILE_LIST)))..)
ARDUINO_DIR ?= ${WORKSPACE}/arduino
ARDMK_DIR ?= ${WORKSPACE}/arduino_make

USER_LIB_PATH ?= ${WORKSPACE}/libraries

# Include the Arduino-Makefile project makefile.
include $(ARDMK_DIR)/Arduino.mk

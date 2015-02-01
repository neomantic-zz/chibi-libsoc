LIBSOC_FLAGS := $(shell pkg-config --cflags --libs libsoc)
SRC_PATH := ./libsoc/

all:
	chibi-ffi -c -f $(LIBSOC_FLAGS) $(SRC_PATH)gpio.stub $(SRC_PATH)gpio.c
clean:
	rm $(SRC_PATH)*.c
	rm $(SRC_PATH)*.so

.PHONY: clean all

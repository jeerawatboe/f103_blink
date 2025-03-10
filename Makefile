CORTEX_M=3
PROCESSOR=stm32f103c8t6
ARCH_FLAGS =-mthumb -mcpu=cortex-m$(CORTEX_M) 
PRO_PREFIX=stm32_
CPU_DEFINES=-DSTM32F1 -DSTM32F103C8Tx

PROJECT = f103_blink

SRC_DIR = src
OBJ_DIR = build

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SOURCES))

FL=openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c "program f103_blink.bin verify 0x08000000 reset exit"
DEFINES =-D__STARTUP_CLEAR_BSS -D__START=main

TOOLCHAIN=arm-none-eabi-
CFLAGS=$(ARCH_FLAGS) $(DEFINES) $(CPU_DEFINES) $(INCLUDES) -Wall -ffunction-sections -fdata-sections -fno-builtin
LFLAGS= --specs=nano.specs -Wl,--gc-sections -Wl,-Map=$(PROJECT).map -Tstm32f103.ld

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
		@mkdir -p $(dir $@)
		$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
		@mkdir -p $(dir $@)
		$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

$(OBJ_DIR)/$(PROJECT).elf: $(OBJECTS)
		$(TOOLCHAIN)gcc $(LFLAGS) $^ $(CFLAGS) -o $@

clean:
	rm -f *.bin *.map *.elf
	find . -name '*.o' -delete

flash:
	$(FL)


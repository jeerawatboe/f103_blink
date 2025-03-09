CORTEX_M=3
PROCESSOR=stm32f103c8t6
ARCH_FLAGS =-mthumb -mcpu=cortex-m$(CORTEX_M) 
PRO_PREFIX=stm32_
CPU_DEFINES=-DSTM32F1 -DSTM32F103C8Tx

PROJECT = f103_blink

DEFINES =-D__STARTUP_CLEAR_BSS -D__START=main

OBJECTS += main.o
OBJECTS += gpio.o
OBJECTS += startup.o

TOOLCHAIN=arm-none-eabi-
CFLAGS=$(ARCH_FLAGS) $(DEFINES) $(CPU_DEFINES) $(INCLUDES) -Wall -ffunction-sections -fdata-sections -fno-builtin

LFLAGS= --specs=nano.specs -Wl,--gc-sections -Wl,-Map=$(PROJECT).map -Tstm32f103.ld

%.o: %.s
		$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

%.o: %.c
		$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

$(PROJECT).bin: $(PROJECT).elf
		$(TOOLCHAIN)objcopy -O binary $< $@

$(PROJECT).elf: $(OBJECTS)
		$(TOOLCHAIN)gcc $(LFLAGS) $^ $(CFLAGS) -o $@

clean:
	rm -f *.bin *.map *.elf
	find . -name '*.o' -delete


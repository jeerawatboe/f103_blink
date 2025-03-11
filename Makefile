
CORTEX_M=3
PROCESSOR=stm32f103c8t6
ARCH_FLAGS = -mthumb -mcpu=cortex-m$(CORTEX_M) 
PRO_PREFIX=stm32_
CPU_DEFINES=-DSTM32F1 -DSTM32F103C8Tx

PROJECT = f103_blink

SRC_DIR = src
OBJ_DIR = build

# ค้นหาไฟล์ .c และ .s ทั้งหมดใน src/
SOURCES = $(shell find $(SRC_DIR) -name "*.c" -o -name "*.s")
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SOURCES))
OBJECTS := $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(OBJECTS))

# คำสั่งสำหรับ Flash ด้วย OpenOCD
FL=STM32_Programmer_CLI -c port=SWD -d build/f103_blink.bin 0x08000000 -rst


DEFINES = -D__STARTUP_CLEAR_BSS -D__START=main
TOOLCHAIN=arm-none-eabi-
CFLAGS=$(ARCH_FLAGS) $(DEFINES) $(CPU_DEFINES) $(INCLUDES) -Wall -ffunction-sections -fdata-sections -fno-builtin
LFLAGS= --specs=nano.specs -Wl,--gc-sections -Wl,-Map=$(OBJ_DIR)/$(PROJECT).map -Tstm32f103.ld

# คอมไพล์ไฟล์ Assembly
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(dir $@)
	$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

# คอมไพล์ไฟล์ C
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ $<

# แปลงไฟล์ ELF เป็น BIN
$(OBJ_DIR)/$(PROJECT).bin: $(OBJ_DIR)/$(PROJECT).elf
	$(TOOLCHAIN)objcopy -O binary $< $@

# ลิงก์ไฟล์ทั้งหมดเป็น ELF
$(OBJ_DIR)/$(PROJECT).elf: $(OBJECTS)
	$(TOOLCHAIN)gcc $(LFLAGS) $^ $(CFLAGS) -o $@
	$(TOOLCHAIN)size $@
# คำสั่งทำความสะอาด
clean:
	rm -rf $(OBJ_DIR)/*

# คำสั่ง Flash
flash: $(OBJ_DIR)/$(PROJECT).bin
	$(FL)

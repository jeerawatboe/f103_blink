# ชื่อไฟล์ที่ต้องการสร้าง
TARGET = Build/f103_blink.elf

# ตัวคอมไพล์เลอร์และเครื่องมือที่ใช้
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJDUMP = arm-none-eabi-objdump
OBJCOPY = arm-none-eabi-objcopy

# ตัวเลือกที่ใช้สำหรับคอมไพล์
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall
LDFLAGS = -T stm32f103.ld --specs=nosys.specs

# ชื่อไฟล์ต่างๆ ที่ต้องการคอมไพล์
SRC_C = main.c Driver/gpio.c
SRC_S = startup.s

# การสร้างไฟล์ .o จากไฟล์ .c ในโฟลเดอร์ Build
OBJ_C = $(SRC_C:%.c=Build/%.o)

# การสร้างไฟล์ .o จากไฟล์ .s ในโฟลเดอร์ Build
OBJ_S = $(SRC_S:%.s=Build/%.o)

# ขั้นตอนการสร้างโฟลเดอร์ Build และ Build/Driver
$(shell mkdir -p Build/Driver)

# ขั้นตอนการคอมไพล์ไฟล์ .c ไปเป็น .o ในโฟลเดอร์ Build
Build/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# ขั้นตอนการคอมไพล์ไฟล์ .s ไปเป็น .o ในโฟลเดอร์ Build
Build/%.o: %.s
	$(AS) $< -o $@

# ขั้นตอนการลิงก์ไฟล์ .o ไปเป็นไฟล์ .elf
$(TARGET): $(OBJ_C) $(OBJ_S)
	$(CC) $(OBJ_C) $(OBJ_S) $(LDFLAGS) -o $(TARGET)

# ขั้นตอนที่ทำการแปลงไฟล์ .elf เป็น .bin สำหรับการโปรแกรม
bin: $(TARGET)
	$(OBJCOPY) -O binary $(TARGET) Build/f103_blink.bin

# ขั้นตอนทำความสะอาดไฟล์ที่คอมไพล์แล้ว
clean:
	rm -f Build/$(OBJ_C) Build/$(OBJ_S) $(TARGET) Build/f103_blink.bin

# ขั้นตอนที่ทำให้สามารถใช้ make ได้โดยไม่ต้องระบุเป้าหมาย
all: $(TARGET)


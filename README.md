STM32F103C8T6 FROM SCRATCH USING VIM

openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c "program f103_blink.bin verify 0x08000000 reset exit"

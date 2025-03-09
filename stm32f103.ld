/* กำหนดขนาดของหน่วยความจำ */
MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 64K
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

/* กำหนดจุดเริ่มต้นของ Stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
    /* ตารางเวกเตอร์ขัดจังหวะ */
    .isr_vector :
    {
        . = ALIGN(4);
        KEEP(*(.isr_vector)) /* เก็บตาราง interrupt */
        . = ALIGN(4);
    } >FLASH

    /* ส่วนของโค้ดโปรแกรมหลัก และข้อมูลที่อ่านได้อย่างเดียว (RO Data) */
    .text :
    {
        . = ALIGN(4);
        *(.text)        /* โค้ดโปรแกรม */
        *(.text*)       
        *(.rodata)      /* ข้อมูลที่อ่านได้อย่างเดียว */
        *(.rodata*)     
        . = ALIGN(4);
        _etext = .;
    } >FLASH

    /* ส่วนของข้อมูลที่ต้องคัดลอกจาก FLASH ไปยัง RAM */
    .data :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)        /* ตัวแปรที่มีค่าเริ่มต้น */
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } >RAM AT> FLASH

    /* ตัวแปรที่ไม่ได้กำหนดค่าเริ่มต้น */
    .bss :
    {
        . = ALIGN(4);
        __bss_start__ = .;  /* จุดเริ่มต้นของ .bss */
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;    /* จุดสิ้นสุดของ .bss */
    } >RAM

    /* Stack & Heap */
    .stack :
    {
        . = ALIGN(8);
        _sstack = .;
        . = . + 2K;  /* กำหนดขนาด Stack 2 KB */
        _estack = .;
    } >RAM

    .heap :
    {
        . = ALIGN(8);
        _sheap = .;
        . = . + 2K;  /* กำหนดขนาด Heap 2 KB */
        _eheap = .;
    } >RAM
}


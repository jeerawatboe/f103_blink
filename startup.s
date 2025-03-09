    .section .isr_vector, "a", %progbits
    .word 0x20005000            // Stack Pointer
    .word Reset_Handler         // Reset Handler
    .word NMI_Handler           // NMI Handler
    .word HardFault_Handler     // HardFault Handler
    // เพิ่ม handler อื่นๆ ตามที่ต้องการ

.global Reset_Handler
Reset_Handler:
    ldr sp, =0x20005000         // กำหนด Stack Pointer
    bl main                     // เรียก main()
    b .                         // หาก main() เสร็จแล้วไม่ทำอะไร

.global NMI_Handler
NMI_Handler:
    b .                         // หมุนรอบที่นี่ถ้าเกิด NMI

.global HardFault_Handler
HardFault_Handler:
    b .                         // หมุนรอบที่นี่ถ้าเกิด HardFault



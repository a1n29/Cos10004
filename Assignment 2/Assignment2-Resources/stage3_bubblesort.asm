 ; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r1,r2,r3,r4,r5,r6,r7,r8,r9}
        sub r0,r0,#1
        mov r3,#0 ;set incrementing index
        mov r7,#4
        main_loop:
                mov r4,r3
                small_loop:
                    mul r5,r3,r7
                    mul r6,r4,r7
                    ldr r8,[r1,r5]
                    ldr r9,[r1,r6]
                    cmp r8,r9
                    bge value_change
                        conditional:
                                str r8,[r1,r5]
                                str r9,[r1,r6]
                                add r4,#1
                                cmp r4,r0
                ble small_loop
                add r3,#1
                cmp r3,r0
        ble main_loop
        add r0,#1
        mov r7,r2
        mov r8,r0
        mov r9,r1
        mov r0,r7
        mov r1,r8
        mov r2,r9
        push {lr}
        bl stage2_flash_array
        pop {lr}
        b exit_3

        ; your function must mov the address of the sorted array to r0
        value_change:
                push {r7}
                mov r7,r8
                mov r8,r9
                mov r9,r7
                pop {r7}
                b conditional
        exit_3:
                mov r0,r1
                pop {r1,r2,r3,r4,r5,r6,r7,r8,r9}
        bx lr
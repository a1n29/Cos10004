; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value
        cmp r0,r1
        ble A1
        con_1b:
        cmp r0,r2
        ble B1
        A1:
                mov r0,r1
                b con_1b
        B1:
                mov r0,r2
                b exit_1b

        exit_1b:
        bx lr
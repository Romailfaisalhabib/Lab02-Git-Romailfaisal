.text
.globl main
main:
    li x22, 0 #--> i = Value to increment in both loops
    li x23, 0 #--> sum
    li x19, 10 #--> final limit for i < 10
    li x18, 0 # --> temp variable
    for_loop1:
        li x5, 0x200 #--> loading address in register
        li x6, 0 #--> x6 = i (offset for a integer byte to be added)
        slli x6, x22, 2 # adding offset for integer in i
        add x6, x6, x5 #--> a[i] = incrementing index to store correct index value into memory
        sw x22, 0(x6) # --> storing value into memory
        addi x22, x22, 1 #--> incrementing i = i + 1
        beq x22, x19, exit_for_loop1 # end condition 
        bne x22, x19, for_loop1 # repeating loop condition
    exit_for_loop1:
    li x5, 0x200
    li x22, 0
    for_loop2:
        li x5, 0x200 #--> loading address in register
        li x6, 0 #--> x6 = i (offset for a integer byte to be added)
        slli x6, x22, 2 # adding offset for integer in i
        add x6, x6, x5 #--> [i] = incrementing index to store correct index value into memory
        lw x18, 0(x6) #--> getting value from memory and storing in x18 register --> x18 = a[i]
        addi x22, x22, 1 #--> incrementing i = i + 1
        add x23, x23, x18 #--> adding to sum --> sum = sum + a[i]
        beq x22, x19, exit_for_loop2 #--> end condition
        bne x22, x19, for_loop2 # repeating loop condition
    exit_for_loop2:
    
end:
    j end
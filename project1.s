.data
input_str: .space 11 # reserve 11 bytes for input_str

.text
main:

li $v0, 8 # read string
la $a0, input_str # destination memory address
li $a1, 11 # number of input characters including null char
syscall

li $s0,1 # the number multiplying the final sum by

# 0-9 ascii: 48-57
# A-P ascii: 65-80
# a-p ascii: 91-112

loop:
    lb $t1,0($a0) # load character at this of string into $t0
    beq $t1,$zero, exit_loop # if null character is read, leave the loop
    addi $a0,$a0,1 # increment the address in $a0 by one to move onto next character

    check_0_to_9:
        slti $t0,$t1,'0'
        beq $t0,0,check_a_to_p # if not, do the next check
        slti $t0,$t1,'9' # check if character < ascii code for 9
        bne $t0,1,check_a_to_p # if not, do the next check

    check_a_to_p:
    check_A_to_P:


exit_loop:


li $v0,10 # exit program
syscall
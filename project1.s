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
    li $t9,0 # $t9 will store final value of sum
    lb $t1,0($a0) # load character at this of string into $t1
    beq $t1,$zero, exit_loop # if null character is read, leave the loop
    addi $a0,$a0,1 # increment the address in $a0 by one to move onto next character

    check_0_to_9:
        slti $t0,$t1,'0' # the string char in $t1 should be greater than or equal to '0' char i.e. $t0 should be 0
        bne $t0,$zero,check_a_to_p # if $t0 not 0, do the next check
        # FIX: this only checks for <9, but excludes char 9 itself
        slti $t0,$t1,'9' # check if character < ascii code for 9 
        bne $t0,1,check_a_to_p # if not, do the next check

    check_a_to_p:
    check_A_to_P:


exit_loop:
mult $t9,$t9,$s0 # store product of sum and number in $t9 
li $v0,1 # print integer
add $a0,$t9,$zero # move final value as argument
syscall

li $v0,10 # exit program
syscall
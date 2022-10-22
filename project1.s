.data
input_str: .space 11 # reserve 11 bytes for input_str

.text
main:

li $v0, 8 # read string
la $a0, input_str # destination memory address
li $a1, 11 # number of input characters including null char
syscall

li $s0,1 # the number multiplying the final sum by
li $s1,'9' # store ascii value of char 9 --> UPPER LIMIT
addi $s1,$s1,1 # increment by one so that you can check for value '9, not only <9 with slti in check_0_to_9

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
        slt $t0,$t1,$s1 # check if character <= ascii code for 9 # the string char in $t1 should be less than or equal to '9' char i.e. $t0 should be 1
        beq $t0,$zero,check_a_to_p # if $t0 0 instead of 1, do the next check
        # j to segment of loop that adds char value to value of $t9, the running sum
    check_a_to_p:
    check_A_to_P:


exit_loop:
mult $t9,$t9,$s0 # store product of sum and number in $t9 
li $v0,1 # print integer
add $a0,$t9,$zero # move final value as argument
syscall

li $v0,10 # exit program
syscall
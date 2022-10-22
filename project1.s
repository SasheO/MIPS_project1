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



li $v0,4 # exit program
syscall
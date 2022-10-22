.data
input_str: .space 11 # reserve 11 bytes for input_str

.text
main:

li $v0, 8 # read string
la $a0, input_str # destination memory address
li $a1, 11 # number of input characters including null char
syscall

li $v0,4 # exit program
syscall
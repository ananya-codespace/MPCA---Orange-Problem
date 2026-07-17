.data
a: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
n: .word 10

.text
.globl main
main:

	la t0, a	# pointer to array
	li t2, 0	# sum = 0
	lw s0, 0(t0)    # highest roll number = first element

# TOTAL STUDENTS PRESENT
	la t3, n
	lw t4, 0(t3)    # 'n' is the total number of students present 
	mv s1, t4	# saving the value of n
	
# CALCULATING THE SUM OF ROLL NUMBERS AND THE HIGHEST ROLL NUMBER
loop1:	
	lw t5, 0(t0)    # current element
	add t2, t2, t5 
	bge s0, t5, skip_highest
	mv s0, t5	# updating the highest roll number value

skip_highest:
	addi t0, t0, 4
	addi t4, t4, -1
	bne t4, x0, loop1
	
# CALCULATING THE AVERAGE OF ROLL NUMBERS
	div t6, t2, s1

# PRINTING THE VALUES
	mv a0, s1	# total students 
	li a7, 1
	ecall

	li a0, 10	# to print a new line
	li a7, 11
	ecall

	mv a0, t2	# sum of roll numbers 
	li a7, 1
	ecall

	li a0, 10
	li a7, 11
	ecall

	mv a0, t6	# average of roll numbers
	li a7, 1
 	ecall

	li a0, 10
	li a7, 11
	ecall

	mv a0, s0	# highest roll number
	li a7, 1
	ecall

	li a7, 10
	ecall
.data
a: .word 120, 150, 100, 180, 130, 170, 140
n: .word 7

.text
.globl main
main:

    la t0, a          # pointer to array
    la t2, n	      # address of n 	
    lw t3, 0(t2)      # t3 = N; counter

    mv s1, t3         # save N

    li t4, 0          # sum = 0
    lw s0, 0(t0)      # max = first element

# CACULATING THE TOTAL RATION PACKETS DISTRIBUTED AND THE MAXIMUM RATION VALUE
loop1:
    lw t1, 0(t0)      # current element

    add t4, t4, t1    # sum += element

    bge s0, t1, skip_max
    mv s0, t1         # update max

skip_max:
    addi t0, t0, 4    # move pointer
    addi t3, t3, -1   # decrement counter
    bne t3, x0, loop1

# CALCULATING THE AVERAGE RATION PER DAY
    div t5, t4, s1    # avg = sum / N

# CALCULATING THE NUMBER OF DAYS WHERE RATION DISTRIBUTION IS GREATER THAN AVERAGE
    la t0, a          # reset pointer
    mv t3, s1         # reset counter
    li t6, 0          # count = 0

loop2:
    lw t1, 0(t0)

    blt t5, t1, inc_count   # if element > avg
    beq x0, x0, skip_count

inc_count:
    addi t6, t6, 1

skip_count:
    addi t0, t0, 4
    addi t3, t3, -1
    bne t3, x0, loop2

# PRINTING THE VALUES
    mv a0, t4		# total ration packets
    li a7, 1
    ecall

    li a0, 10		# to print a new line
    li a7, 11
    ecall

    mv a0, t5		# average ration per day
    li a7, 1
    ecall

    li a0, 10		
    li a7, 11
    ecall

    mv a0, t6		# number of days where ration distribution is greater than the average
    li a7, 1
    ecall

    li a0, 10		
    li a7, 11
    ecall

    mv a0, s0		# maximum ration value
    li a7, 1
    ecall

    li a7, 10
    ecall
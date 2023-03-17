.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
#
# If the length of the vector is less than 1, 
# this function exits with error code 7.
# =================================================================
argmax:

    # Prologue
    # 不需要
    
loop_start:
    addi t0, x0, 0 #index
    addi t2, x0, 0 #最大值的index
    addi t3, x0, 0 #目前最大值
    addi t5, x0, 10 #上限
loop_continue:
    bge t0, t5, loop_end
    slli t1, t0, 2
    add t1, a0, t1 #index+地址
    addi t0, t0, 1 #index没有事实上移动？？
    lw t4, 0(t1) #这里加载出了0x10000417，哈人->寄存器使用错误
    bge t3, t4, loop_continue
    #若否 
    addi t3, t4, 0
    addi t2, t0, -1
    j loop_continue
loop_end:
    addi a0, t2, 0

    # Epilogue
    ret 
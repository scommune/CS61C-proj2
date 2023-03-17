.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    # Prologue
    # 应该不需要
    
loop_start:
    addi t0, x0, 0

loop_continue:
    bge t0, a1, loop_end #if(counter>arr_size){break;}
    slli t2, t0, 2
    add t2, a0, t2
    lw t1, 0(t2)
    addi t0, t0, 1
    bge t1, x0, loop_continue #if arr[counter]>0 loop_continue
    sw x0, 0(t2)
    j loop_continue

loop_end:
    # Epilogue
    # 应该也不需要

	ret

#在这个实验中，注意index是个位数（当然具体到地址还要*4）
#然而array的开头是一个很大的数字
#要将array内的index和指向array地址的值区分开
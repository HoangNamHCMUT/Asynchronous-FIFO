#!/bin/csh
# c_shell script to compile and run verilog files

if((-e $fifo/$1/$1.out)) then
	rm $fifo/$1/$1.out
endif
iverilog -o $fifo/$1/$1.out $fifo/$1/$1.v $fifo/$1/$1_tb.sv
vvp $fifo/$1/$1.out

vsim -gui work.alu
# vsim -gui work.alu 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.alu(start)
# Loading work.partb(operators)
# Loading work.partc(right)
# Loading work.partd(left)
add wave sim:/alu/*
force -freeze sim:/alu/A 0000111100001111 0
force -freeze sim:/alu/B 0000000000001010 0
force -freeze sim:/alu/S 0100 0
run
force -freeze sim:/alu/S 0101 0
run
force -freeze sim:/alu/S 0110 0
run
force -freeze sim:/alu/S 0111 0
run
force -freeze sim:/alu/S 1000 0
run
force -freeze sim:/alu/S 1001 0
run
force -freeze sim:/alu/S 1111 0
run
force -freeze sim:/alu/S 1010 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/S 1100 0
run
force -freeze sim:/alu/A 1111000011110000 0
force -freeze sim:/alu/S 1101 0
run
force -freeze sim:/alu/S 1110 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/Cin 1 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/S 1011 0
run
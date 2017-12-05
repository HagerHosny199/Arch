vsim -gui work.alsu
# vsim -gui work.alsu 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.alsu(start)
# Loading work.parta(add)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_adder(a_my_adder)
# Loading work.partb(operators)
# Loading work.partc(right)
# Loading work.partd(left)
add wave sim:/alsu/*
force -freeze sim:/alsu/A 0000111100001111 0
force -freeze sim:/alsu/S 0000 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/B 0000000000000001 0
force -freeze sim:/alsu/S 0001 0
run
force -freeze sim:/alsu/A 1111111111111111 0
run
force -freeze sim:/alsu/S 0010 0
run
force -freeze sim:/alsu/S 0011 0
run
force -freeze sim:/alsu/A 0000111100001110 0
force -freeze sim:/alsu/S 0000 0
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/A 1111111111111111 0
force -freeze sim:/alsu/S 0001 0
run
force -freeze sim:/alsu/A 0000111100001111 0
force -freeze sim:/alsu/S 0010 0
run
force -freeze sim:/alsu/S 0011 0
run
force -freeze sim:/alsu/B 0000000000001010 0
force -freeze sim:/alsu/S 0100 0
run
force -freeze sim:/alsu/S 0101 0
run
force -freeze sim:/alsu/S 0110 0
run
force -freeze sim:/alsu/S 0111 0
run
force -freeze sim:/alsu/S 1000 0
run
force -freeze sim:/alsu/S 1001 0
run
force -freeze sim:/alsu/S 1111 0
run
force -freeze sim:/alsu/S 1010 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S 1100 0
run
force -freeze sim:/alsu/A 1111000011110000 0
force -freeze sim:/alsu/S 1101 0
run
force -freeze sim:/alsu/S 1110 0
force -freeze sim:/alsu/Cin 0 0
run
force -freeze sim:/alsu/Cin 1 0
run
force -freeze sim:/alsu/S 1011 0
run
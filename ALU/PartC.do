vsim -gui work.partc
# vsim -gui work.partc 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partc(right)
add wave sim:/partc/*
force -freeze sim:/partc/A 0000111100001111 0
force -freeze sim:/partc/S 00 0
run
force -freeze sim:/partc/S 01 0
run
force -freeze sim:/partc/Cin 0 0
force -freeze sim:/partc/S 10 0
run
force -freeze sim:/partc/Cin 1 0
run
force -freeze sim:/partc/A 1111000011110000 0
force -freeze sim:/partc/S 11 0
run

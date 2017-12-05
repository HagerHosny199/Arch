vsim -gui work.partd
# vsim -gui work.partd 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partd(left)
add wave sim:/partd/*
force -freeze sim:/partd/A 0000111100001111 0
force -freeze sim:/partd/S 00 0
run
force -freeze sim:/partd/A 1111000011110000 0
force -freeze sim:/partd/S 01 0
run
force -freeze sim:/partd/Cin 0 0
force -freeze sim:/partd/S 10 0
run
force -freeze sim:/partd/Cin 1 0
force -freeze sim:/partd/S 10 0
run
force -freeze sim:/partd/S 11 0
run
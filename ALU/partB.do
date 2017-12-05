vsim -gui work.partb
# vsim -gui work.partb 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.partb(operators)
add wave sim:/partb/*
force -freeze sim:/partb/A 0000111100001111 0
force -freeze sim:/partb/B 0000000000001010 0
force -freeze sim:/partb/S 00 0
run
force -freeze sim:/partb/S 01 0
run
force -freeze sim:/partb/S 10 0
run
force -freeze sim:/partb/S 11 0
run
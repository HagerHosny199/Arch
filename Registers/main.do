vsim -gui work.main
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.dec(decoder)
# Loading work.my_ndff(a_my_ndff)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
add wave sim:/main/*
force -freeze sim:/main/Clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/main/Rst 1 0
run
force -freeze sim:/main/Rst 0 0
force -freeze sim:/main/busx 00000000000000000000000010101010 0
force -freeze sim:/main/en2 1 0
force -freeze sim:/main/S2 00 0
run
force -freeze sim:/main/S2 01 0
force -freeze sim:/main/busx 00000000000000000000000010111011 0
run
force -freeze sim:/main/S2 10 0
force -freeze sim:/main/busx 00000000000000000000000011001100 0
run
force -freeze sim:/main/S2 11 0
force -freeze sim:/main/busx 00000000000000000000000011011101 0
run
noforce sim:/main/busx
force -freeze sim:/main/S1 00 0
force -freeze sim:/main/S2 01 0
force -freeze sim:/main/en1 1 0
run
force -freeze sim:/main/S1 10 0
force -freeze sim:/main/S2 00 0
run
force -freeze sim:/main/S1 11 0
run
run
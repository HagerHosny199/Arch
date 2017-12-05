vsim -gui work.main
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading ieee.numeric_std(body)
# Loading work.ram(syncrama)
add wave sim:/main/*
force -freeze sim:/main/Clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/main/Clk2 1 0, 0 {50 ps} -r 100
force -freeze sim:/main/Rst 1 0
force -freeze sim:/main/addressBus 000000 0
run
force -freeze sim:/main/Rst 0 0
force -freeze sim:/main/S2 001 0
force -freeze sim:/main/en2 1 0
force -freeze sim:/main/busx 1000100010001000 0
run
force -freeze sim:/main/S2 000 0
force -freeze sim:/main/busx 1001100110011001 0
run
force -freeze sim:/main/addressBus 000100 0
force -freeze sim:/main/S2 100 0
run
mem load -filltype inc -filldata 100 -fillradix hexadecimal -skip 0 /main/r/ram
run
force -freeze sim:/main/memEnR 1 0
run
noforce sim:/main/busx
force -freeze sim:/main/memEnR 0 0
force -freeze sim:/main/S1 100 0
force -freeze sim:/main/S2 000 0
force -freeze sim:/main/en1 1 0
force -freeze sim:/main/en2 0 0
force -freeze sim:/main/memEnW 0 0
run
force -freeze sim:/main/en1 0 0
force -freeze sim:/main/en2 1 0
run
force -freeze sim:/main/S1 001 0
force -freeze sim:/main/en1 1 0
force -freeze sim:/main/en2 0 0
run
force -freeze sim:/main/S2 100 0
force -freeze sim:/main/en1 0 0
force -freeze sim:/main/en2 1 0
run
force -freeze sim:/main/S1 100 0
force -freeze sim:/main/en1 1 0
force -freeze sim:/main/en2 0 0
force -freeze sim:/main/memEnW 1 0
force -freeze sim:/main/we 1 0
run


force -freeze sim:/main/S2 101 0
force -freeze sim:/main/addressBus 000001 0
force -freeze sim:/main/en1 0 0
force -freeze sim:/main/en2 1 0
run
force -freeze sim:/main/S2 100 0
force -freeze sim:/main/memEnR 1 0
run
force -freeze sim:/main/S2 101 0
force -freeze sim:/main/addressBus 000100 0
run
force -freeze sim:/main/S2 100 0
run



vsim -gui work.main
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.main(control)
# Loading ieee.numeric_std(body)
# Loading work.counter(count)
# Loading work.rom(syncrom)
# Loading work.my_ndff(a_my_ndff)
# Loading work.dec(decoder)
# Loading work.ram(syncrama)
add wave sim:/main/*
force -freeze sim:/main/Clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/main/Clk2 1 0, 0 {50 ps} -r 100
mem load -filltype inc -filldata 100 -fillradix hexadecimal -skip 0 /main/r/ram
mem load -filltype value -filldata 01011 -fillradix binary /main/rom1/rom(0)
mem load -filltype value -filldata 01001 -fillradix binary /main/rom1/rom(1)
mem load -filltype value -filldata 11000 -fillradix binary /main/rom1/rom(2)
mem load -filltype value -filldata 01011 -fillradix binary /main/rom1/rom(3)
mem load -filltype value -filldata 11001 -fillradix binary /main/rom1/rom(4)
mem load -filltype value -filldata 01011 -fillradix binary /main/rom1/rom(5)
mem load -filltype value -filldata 11001 -fillradix binary /main/rom1/rom(6)
force -freeze sim:/main/addressBus 0000000000000010 0
run
force -freeze sim:/main/busx 1001100110011001 0
run
run
force -freeze sim:/main/addressBus 0000000000000101 0
run
run
force -freeze sim:/main/addressBus 0000000000000010 0
run
run

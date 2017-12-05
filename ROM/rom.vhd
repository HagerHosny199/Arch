LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY rom IS
	PORT(
		clk : IN std_logic;
		romOut : OUT std_logic_vector(4 DOWNTO 0));
		SIGNAL INDEX :std_logic_vector(2 DOWNTO 0);
END ENTITY rom;

ARCHITECTURE syncrom OF rom IS

	TYPE rom_type IS ARRAY(0 TO 6) OF std_logic_vector(4 DOWNTO 0);
	SIGNAL rom : rom_type ;
	
	BEGIN
		PROCESS(clk) IS
		    variable current:integer range 0 to 8;  --counter
			BEGIN
				IF (clk='0') THEN  
				  IF(current<6) THEN
				current:=current+1;
				index<=std_logic_vector(to_unsigned(current,3));
				END IF;
				romOut <= rom(to_integer(unsigned(index)));
				END IF;
		END PROCESS;
		
END syncrom;



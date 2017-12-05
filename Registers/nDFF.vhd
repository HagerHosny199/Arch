LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY my_nDFF IS
GENERIC ( n : integer := 32);
PORT( Clk,Rst,buf,enb : IN std_logic; -- i use the same rst for all reg -- buf to enable tristate -- en -- to enable reg
		   d : IN std_logic_vector(n-1 DOWNTO 0); 
		   q : INOUT std_logic_vector(n-1 DOWNTO 0);
		   busx: OUT std_logic_vector(n-1 DOWNTO 0));
		
END my_nDFF;

ARCHITECTURE a_my_nDFF OF my_nDFF IS
BEGIN
PROCESS (Clk,Rst,enb,d)
BEGIN
IF (Rst = '1') THEN  -- to reset the register --
		q <= (OTHERS=>'0');
		busx<=(OTHERS=>'0'); -- i take the same value to the bus 
ELSIF(buf='0') THEN  --- buf =0 it means i do not need to send data from q to bus 
		busx<=(others=>'Z');
ELSIF(buf='1') THEN  --- buf =0 it means i need to send data from q to bus 
		busx<=q;	

END IF;
IF ( (rising_edge(Clk)) and (enb='1') ) THEN  -- to work as a dest register
		q <= d;
    busx<=d;

END IF;
END PROCESS;
END a_my_nDFF;


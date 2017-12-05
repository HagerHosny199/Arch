LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ALU IS
  
-- start of define ports --
PORT(A,B:IN std_logic_vector(15 downto 0);
     S:IN std_logic_vector(3 downto 0);
     F:OUT std_logic_vector(15 downto 0));
 --end of define ports --
 
 -- signals --
 SIGNAL  Cin,Cout:std_logic;
 SIGNAL x,y,z:std_logic_vector(15 downto 0); --temp signals --
 --end of signals --
 
END ENTITY ALU;

ARCHITECTURE start OF ALU IS 
--start of partB--
COMPONENT partB IS
  -- start of define ports --
PORT(A,B:IN std_logic_vector(15 downto 0);
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(15 downto 0));
 --end of define ports --
END COMPONENT;
--end of partB --

--start of partC--
COMPONENT partC IS
  -- start of define ports --
PORT(A:IN std_logic_vector(15 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(15 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
END COMPONENT;
--end of partC --

--start of partD--
COMPONENT partD IS
  -- start of define ports --
PORT(A:IN std_logic_vector(15 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(15 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
END COMPONENT;
--end of partD --

BEGIN

U0:partB PORT MAP (A,B,S(1 downto 0),x);
U1: partC PORT MAP (A,Cin,S(1 downto 0),y,Cout) ;
U2: partD PORT MAP (A,Cin,S(1 downto 0),z,Cout);
F<=x WHEN (S(3)='0' and S(2)='1')
ELSE y WHEN (S(3)='1' and S(2)='0')
ELSE z WHEN (S(3)='1' and S(2)='1');


END start;

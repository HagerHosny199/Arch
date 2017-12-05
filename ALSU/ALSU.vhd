LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ALSU IS
  
-- start of define ports --
GENERIC (n : integer := 16);
PORT(A,B:IN std_logic_vector(n-1 downto 0);
     S:IN std_logic_vector(3 downto 0);
     F:OUT std_logic_vector(n-1 downto 0));
 --end of define ports --
 
 -- signals --
 SIGNAL  Cin,CoutA,CoutC,CoutD:std_logic;
 SIGNAL x,y,z,tempO:std_logic_vector(n-1 downto 0); --temp signals --
 --end of signals --
 
END ENTITY ALSU;

ARCHITECTURE start OF ALSU IS 
--start of partA--
COMPONENT partA IS
  -- start of define ports --
GENERIC (n : integer := 16);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
             carryIn : IN std_logic;  
             F : OUT std_logic_vector(n-1 DOWNTO 0);   
             S:IN std_logic_vector(1 DOWNTO 0); 
             carryOut : OUT std_logic);
 --end of define ports --
END COMPONENT;
--end of partA --

--start of partB--
COMPONENT partB IS
  -- start of define ports --
  GENERIC (n : integer := 16);
PORT(A,B:IN std_logic_vector(n-1 downto 0);
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0));
 --end of define ports --
END COMPONENT;
--end of partB --

--start of partC--
COMPONENT partC IS
  -- start of define ports --
  GENERIC (n : integer := 16);
PORT(A:IN std_logic_vector(n-1 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
END COMPONENT;
--end of partC --

--start of partD--
COMPONENT partD IS
  -- start of define ports --
  GENERIC (n : integer := 16);
PORT(A:IN std_logic_vector(n-1 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
END COMPONENT;
--end of partD --

BEGIN
U0:partA GENERIC MAP (n=>16) PORT MAP (A,B,Cin,tempO,S(1 downto 0),CoutA);
U1:partB GENERIC MAP (n=>16) PORT MAP (A,B,S(1 downto 0),x);
U2:partC GENERIC MAP (n=>16) PORT MAP (A,Cin,S(1 downto 0),y,CoutC) ;
U3:partD GENERIC MAP (n=>16) PORT MAP (A,Cin,S(1 downto 0),z,CoutD);
F<=x WHEN (S(3)='0' and S(2)='1')
ELSE tempO WHEN (S(3)='0' and S(2)='0')
ELSE y WHEN (S(3)='1' and S(2)='0')
ELSE z WHEN (S(3)='1' and S(2)='1');


END start;


LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY partD IS
GENERIC (n : integer := 16);  
-- start of define ports --
PORT(A:IN std_logic_vector(n-1 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
 
END ENTITY partD;

ARCHITECTURE LEFT OF partD IS 
BEGIN
  -- SHIFT LEFT A--
  F<=  (A(14 downto 0 )& '0')  WHEN (S(1)='0' and S(0)= '0')
  -- ROTATE LEFT A--
  ELSE (A(14 downto 0)& A(15))   WHEN (S(1)='0' and S(0)= '1')
  -- ROTATE LEFT A WITH CARRY --
  ELSE (A(14 downto 0)& Cin)  WHEN (S(1)='1' and S(0)= '0')
  -- 0000 --
  ELSE ("0000000000000000")    WHEN (S(1)='1' and S(0)= '1');
  Cout<=A(15);
END LEFT;


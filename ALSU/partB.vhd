LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY partB IS
  
-- start of define ports --
GENERIC (n : integer := 16);
PORT(A,B:IN std_logic_vector(n-1 downto 0);
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0));
 --end of define ports --
 
END ENTITY partB;

ARCHITECTURE operators OF partB IS 
BEGIN
  -- AND OPERATOR --
  F<=  (A AND B ) WHEN (S(1)='0' and S(0)= '0')
  -- OR OPERATOR--
  ELSE (A OR B)   WHEN (S(1)='0' and S(0)= '1')
  -- XOR OPERATOR --
  ELSE (A XOR B)  WHEN (S(1)='1' and S(0)= '0')
  -- NOT OPERATOR --
  ELSE (NOT A)    WHEN (S(1)='1' and S(0)= '1');
END operators;
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY partC IS
 GENERIC (n : integer := 16); 
-- start of define ports --
PORT(A:IN std_logic_vector(n-1 downto 0);
     Cin:IN std_logic;
     S:IN std_logic_vector(1 downto 0);
     F:OUT std_logic_vector(n-1 downto 0);
     Cout:OUT std_logic);
 --end of define ports --
 
END ENTITY partC;

ARCHITECTURE RIGHT OF partC IS 
BEGIN
  -- SHIFT RIGHT A--
  F<=  ('0'&A(15 downto 1) )  WHEN (S(1)='0' and S(0)= '0')
  -- ROTATE RIGHT A--
  ELSE (A(0)&A(15 downto 1))   WHEN (S(1)='0' and S(0)= '1')
  -- ROTATE RIGHT A WITH CARRY --
  ELSE (Cin & A(15 downto 1))  WHEN (S(1)='1' and S(0)= '0')
  -- ARITHMATIC SHIFT RIGHT A --
  ELSE (A(15)&A(15 downto 1))    WHEN (S(1)='1' and S(0)= '1');
  Cout<=A(0);
END RIGHT;

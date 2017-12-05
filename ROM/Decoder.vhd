LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Dec IS

PORT( S:IN std_logic_vector(2 downto 0);
      en:IN std_logic;
      R:OUT std_logic_vector(5 downto 0));
END ENTITY Dec;

ARCHITECTURE Decoder OF Dec IS
BEGIN
PROCESS (S,en)
BEGIN
IF(en = '0') THEN 
    R<="000000";
ELSIF (S = "000") THEN
		R<="000001";
ELSIF (S="001") THEN
		R<="000010";
ELSIF (S="010") THEN
		R<="000100";
ELSIF (S="011") THEN
		R<="001000";
ELSIF (S="100") THEN
		R<="010000";	
ELSIF (S="101") THEN
		R<="100000";
END IF;
END PROCESS;
END Decoder;



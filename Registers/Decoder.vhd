LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Dec IS

PORT( S:IN std_logic_vector(1 downto 0);
      en:IN std_logic;
      R:OUT std_logic_vector(3 downto 0));
END ENTITY Dec;

ARCHITECTURE Decoder OF Dec IS
BEGIN
PROCESS (S,en)
BEGIN
IF(en = '0') THEN 
    R<="0000";
ELSIF (S = "00") THEN
		R<="0001";
ELSIF (S="01") THEN
		R<="0010";
ELSIF (S="10") THEN
		R<="0100";
ELSIF (S="11") THEN
		R<="1000";
		
END IF;
END PROCESS;
END Decoder;



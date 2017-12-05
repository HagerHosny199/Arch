LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY partA IS
  
-- start of define ports --
GENERIC (n : integer := 16);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
             carryIn : IN std_logic;  
             F : OUT std_logic_vector(n-1 DOWNTO 0);   
             S:IN std_logic_vector(1 DOWNTO 0); 
             carryOut : OUT std_logic);
 --end of define ports --
 SIGNAL tempA,tempB,tempO : std_logic_vector(n-1 DOWNTO 0);
 SIGNAL carry:std_logic;
END ENTITY partA;




ARCHITECTURE ADD OF partA IS 


-- start of nadder --
 COMPONENT my_nadder IS
  -- define ports of n adder -- 
GENERIC (n : integer := 16);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;  
            s : OUT std_logic_vector(n-1 DOWNTO 0);    
            cout : OUT std_logic);
 -- end of define ports of n adder --           
END COMPONENT;
--end of nadder --



BEGIN
U1:my_nadder GENERIC MAP(n => 16) PORT MAP (tempA,tempB,carry,tempO,carryOut);  
PROCESS(S(1),S(0),a,b,carryIn,tempO)
  BEGIN  
      
--------------- cin =0 ----------------------------------
  IF(S(1)='0' and S(0)='0' and carryIn='0') THEN
  tempA<=a;
  tempB<=(others => '0');
 carry<='0';
ELSIF (S(1)='0' and S(0)='1' and carryIn='0') THEN
  tempA<=a;
  tempB<=b;
  carry<='0';
ELSIF (S(1)='1' and S(0)='0' and carryIn='0') THEN
  tempA<=a;
  tempB<=(not b);
  carry<='0';
ELSIF (S(1)='1' and S(0)='1' and carryIn='0') THEN
  tempA<=a;
  tempB<=(others => '1');
  carry<='0';
  
--------------- cin =1 ----------------------------------
ELSIF(S(1)='0' and S(0)='0' and carryIn='1') THEN
  tempA<=a;
  tempB<=(others => '0');
  carry<='1';
ELSIF (S(1)='0' and S(0)='1' and carryIn='1') THEN
  tempA<=a;
  tempB<=b;
  carry<='1';
ELSIF (S(1)='1' and S(0)='0' and carryIn='1') THEN
  tempA<=a;
  tempB<=(not b);
  carry<='1';
ELSIF (S(1)='1' and S(0)='1' and carryIn='1') THEN
  tempA<=(others => '0');
  tempB<=(others => '0');
  carry<='0';

END IF ;
END PROCESS;
F<=tempO;
END ADD;

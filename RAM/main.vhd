LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY main IS
GENERIC ( n : integer := 16);
PORT( Clk,Rst,Clk2,we: IN std_logic;
		   
	    	
		   S1,S2:IN std_logic_vector(2 DOWNTO 0);
		   busx:INOUT std_logic_vector(n-1 downto 0);
		   addressBus:INOUT std_logic_vector(5 downto 0));
		   
		   SIGNAL ramAddress :std_logic_vector(5 DOWNTO 0);
	    	SIGNAL datain ,dataout :   std_logic_vector(15 DOWNTO 0);
	    	
		   SIGNAL q1,q2,q3,q4,q5 :std_logic_vector(n-1 DOWNTO 0);  --q of the 4,MDR registers 
		   SIGNAL q6:std_logic_vector(5 DOWNTO 0);
		   SIGNAL d1,d2,d3,d4,d5 :std_logic_vector(n-1 DOWNTO 0); -- d of the 4,MDR reg
		   SIGNAL d6:std_logic_vector(5 DOWNTO 0);
		   SIGNAL ren1,ren2,ren3,ren4,ren5,ren6:std_logic;  -- enables of the registers 
		   SIGNAL R1,R2:std_logic_vector(5 downto 0);  -- the output of the dest,src decoders
		   SIGNAL en1,en2,memEnR,memEnW:std_logic; --enables of decoder --
		   SIGNAL buf1,buf2,buf3,buf4,buf5,buf6:std_logic; --buffers of registers --
END ENTITY main;



ARCHITECTURE control OF main IS
COMPONENT my_nDFF IS
  --ports of nDFF to create 4 registers --
GENERIC ( n : integer := 32);
PORT( Clk,Rst,buf,enb : IN std_logic;
		   d : IN std_logic_vector(n-1 DOWNTO 0);
		   q : INOUT std_logic_vector(n-1 DOWNTO 0);
		   busx: OUT std_logic_vector(n-1 DOWNTO 0));
 END COMPONENT;
 --end of ports of nDFF to create 4 registers --
 -- start of component of decoder --
 COMPONENT Dec IS

PORT( S:IN std_logic_vector(2 downto 0);
      en:IN std_logic;
      R:OUT std_logic_vector(5 downto 0));

 END COMPONENT ;
 -- end of component of decoder --
 
 
 --RAM component ---
  COMPONENT ram IS

PORT(
		clk : IN std_logic;
		we  : IN std_logic;
		address : IN  std_logic_vector(5 DOWNTO 0);
		datain  : IN  std_logic_vector(15 DOWNTO 0);
		dataout : OUT std_logic_vector(15 DOWNTO 0));
 END COMPONENT ;
 --END of RAM Component
 
BEGIN
 
   --create 4 registers--
   re1: my_nDFF GENERIC MAP(16)  PORT MAP(Clk,Rst,buf1,ren1,d1,q1,busx);
   re2: my_nDFF GENERIC MAP(16)  PORT MAP(Clk,Rst,buf2,ren2,d2,q2,busx);
   re3: my_nDFF GENERIC MAP(16)  PORT MAP(Clk,Rst,buf3,ren3,d3,q3,busx);
   re4: my_nDFF GENERIC MAP(16)  PORT MAP(Clk,Rst,buf4,ren4,d4,q4,busx);
   MDR: my_nDFF GENERIC MAP(16)  PORT MAP(Clk,Rst,buf5,ren5,d5,q5,busx);
   MAR: my_nDFF GENERIC MAP(6)   PORT MAP(Clk,Rst,buf6,ren6,d6,q6,addressBus);
     
--to check what is the input of the MDR  
    PROCESS(memEnR,busx)
      BEGIN
      IF(memEnR='1') THEN 
      d5<=dataout;
    ELSE 
      d5<=busx;
       
     END IF;
     END PROCESS ;
     
     
-- to make the d= bus 
     d1<=busx; 
     d2<=busx;
     d3<=busx;
     d4<=busx;
    -- d5<=busx; --MDR IN--
     d6<=addressBus; --MAR IN --
     ramAddress<=addressBus;
       -- create 2 decoder --
   src: Dec PORT MAP(S1,en1,R1);
   des: Dec PORT MAP(S2,en2,R2);
  --Create a RAM --
r: ram PORT MAP (Clk2,we,ramAddress,datain,dataout); 

         -- for the source ---
   PROCESS(R1,buf1,buf2,buf3,buf4,buf5,buf6)
     BEGIN 
       -- here i enable the right buffer of the src register
        IF(R1="000000") THEN   
       buf1<='0';
       buf2<='0';
       buf3<='0';
       buf4<='0';
       buf5<='0';
       buf6<='0';
     ELSIF(R1="000001") THEN   
       buf1<='1';
       buf2<='0';
       buf3<='0';
       buf4<='0';
       buf5<='0';
       buf6<='0';
     ELSIF(R1="000010") THEN 
       buf2<='1';
       buf1<='0';
       buf3<='0';
       buf4<='0';
       buf5<='0';
       buf6<='0';
     ELSIF(R1="000100") THEN 
       buf3<='1';
       buf2<='0';
       buf1<='0';
       buf4<='0';
       buf5<='0';
       buf6<='0';
     ELSIF(R1="001000") THEN 
       buf4<='1';
       buf2<='0';
       buf3<='0';
       buf1<='0';
       buf5<='0';
       buf6<='0';
     ELSIF(memEnW='0' and R1="010000") THEN --if memEnW=0 then write on the bus 
       buf4<='0';
       buf2<='0';
       buf3<='0';
       buf1<='0';
       buf5<='1';
       buf6<='0';
     ELSIF(memEnW='1' and R1="010000") THEN --then write on the RAM
       buf4<='0';
       buf2<='0';
       buf3<='0';
       buf1<='0';
       buf5<='0';
       buf6<='0';
       datain<=q5;
     ELSIF(R1="100000") THEN 
       buf4<='0';
       buf2<='0';
       buf3<='0';
       buf1<='0';
       buf5<='0';
       buf6<='1';
  END IF;  
   END PROCESS;
   
   -- for the dest--
   PROCESS(R2,en2) 
     
     BEGIN 
       -- here i enable the right register as dest reg
       IF(R2="000000") THEN 
       ren1<='0';
       ren2<='0';
       ren3<='0';
       ren4<='0';
       ren5<='0';
       ren6<='0';
       ELSIF( en2='1' and R2="000001") THEN  
       ren1<='1';
       ren2<='0';
       ren3<='0';
       ren4<='0';
       ren5<='0';
       ren6<='0';
     ELSIF( en2='1' and R2="000010") THEN 
       ren2<='1';
       ren1<='0';
       ren3<='0';
       ren4<='0';
       ren5<='0';
       ren6<='0';
   
     ELSIF(en2='1' and R2="000100") THEN 
       ren3<='1';
       ren2<='0';
       ren1<='0';
       ren4<='0';
       ren5<='0';
       ren6<='0';
     ELSIF(en2='1' and R2="001000") THEN 
       ren4<='1';
       ren2<='0';
       ren3<='0';
       ren1<='0';
       ren5<='0';
       ren6<='0';
    ELSIF(en2='1' and R2="010000") THEN 
       ren5<='1';
       ren2<='0';
       ren3<='0';
       ren1<='0';
       ren4<='0';
       ren6<='0';
     ELSIF(en2='1' and R2="100000") THEN 
       ren6<='1';
       ren2<='0';
       ren3<='0';
       ren1<='0';
       ren5<='0';
       ren4<='0';
       
   END IF;   
  
   END PROCESS;
   
END control;




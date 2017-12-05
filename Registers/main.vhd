LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY main IS
GENERIC ( n : integer := 32);
PORT( Clk,Rst: IN std_logic;
		   
		   S1,S2:IN std_logic_vector(1 DOWNTO 0);
		   busx:INOUT std_logic_vector(n-1 downto 0));
		   
		   SIGNAL q1,q2,q3,q4 :std_logic_vector(n-1 DOWNTO 0);  --q of the 4 registers 
		   SIGNAL d1,d2,d3,d4 :std_logic_vector(n-1 DOWNTO 0); -- d of the 4 reg
		   SIGNAL ren1,ren2,ren3,ren4:std_logic;  -- enables of the registers 
		   SIGNAL R1,R2:std_logic_vector(3 downto 0);  -- the output of the dest,src decoders
		   SIGNAL en1,en2:std_logic; --enables of decoder --
		   SIGNAL buf1,buf2,buf3,buf4:std_logic; --buffers of registers --
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

PORT( S:IN std_logic_vector(1 downto 0);
      en:IN std_logic;
      R:OUT std_logic_vector(3 downto 0));

 END COMPONENT ;
 -- end of component of decoder --
 
BEGIN
 
   --create 4 registers--
   re1: my_nDFF GENERIC MAP(32)  PORT MAP(Clk,Rst,buf1,ren1,d1,q1,busx);
   re2: my_nDFF GENERIC MAP(32)  PORT MAP(Clk,Rst,buf2,ren2,d2,q2,busx);
   re3: my_nDFF GENERIC MAP(32)  PORT MAP(Clk,Rst,buf3,ren3,d3,q3,busx);
   re4: my_nDFF GENERIC MAP(32)  PORT MAP(Clk,Rst,buf4,ren4,d4,q4,busx);
-- to make the d= bus 
     d1<=busx; 
     d2<=busx;
     d3<=busx;
     d4<=busx;
       -- create 2 decoder --
   src: Dec PORT MAP(S1,en1,R1);
   des: Dec PORT MAP(S2,en2,R2);
         -- for the source ---
   PROCESS(R1,buf1,buf2,buf3,buf4)
     BEGIN 
       -- here i enable the right buffer of the src register
     IF(R1="0001") THEN   
       buf1<='1';
       buf2<='0';
       buf3<='0';
       buf4<='0';
     ELSIF(R1="0010") THEN 
       buf2<='1';
       buf1<='0';
       buf3<='0';
       buf4<='0';
     ELSIF(R1="0100") THEN 
       buf3<='1';
       buf2<='0';
       buf1<='0';
       buf4<='0';
     ELSIF(R1="1000") THEN 
        buf4<='1';
       buf2<='0';
       buf3<='0';
       buf1<='0';
  END IF;  
   END PROCESS;
   
   -- for the dest--
   PROCESS(R2,en2) 
     
     BEGIN 
       -- here i enable the right register as dest reg
       IF( en2='1' and R2="0001") THEN  
       ren1<='1';
       ren2<='0';
       ren3<='0';
       ren4<='0';
     ELSIF( en2='1' and R2="0010") THEN 
       ren2<='1';
       ren1<='0';
       ren3<='0';
       ren4<='0';
   
     ELSIF(en2='1' and R2="0100") THEN 
       ren3<='1';
       ren2<='0';
       ren1<='0';
       ren4<='0';
    
     ELSIF(en2='1' and R2="1000") THEN 
       ren4<='1';
       ren2<='0';
       ren3<='0';
       ren1<='0';
   END IF;   
  
   END PROCESS;
   
END control;




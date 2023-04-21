LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY  counter IS
	
	GENERIC(
		clk_freq : integer := 50000000;
		
		stable_time : integer := 4
	);

	PORT(
		
		clk : in std_logic;
		resetb : in std_logic;		
		SCLR : in std_logic;
		counter_out : out std_logic
		
	);
	
END ENTITY;


ARCHITECTURE bhv OF counter IS
	
	

BEGIN
	
	PROCESS(clk, resetb)
	
		variable count :  integer range 0 to clk_freq*stable_time/1000;
		
	BEGIN
	
		if(resetb = '0') then 
		
			counter_out <= '0';    
			
		elsif(rising_edge(clk)) then           
		
			if(SCLR = '1') then
				count := 0;
			elsif(count < clk_freq*stable_time/1000) then
				count := count + 1;
			else
				counter_out <= '1';
			end if;
		
		end if;
		
	END PROCESS;
		
		
END ARCHITECTURE;
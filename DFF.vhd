LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY myDFF IS

	port(
	
		clk : IN std_logic;
		resetb : IN std_logic;
		input_value : IN std_logic;
		
		stored_value : OUT std_logic
	
	);
	
	
END ENTITY;



ARCHITECTURE bhv OF myDFF IS


BEGIN

	process(clk, resetb)
	
	begin
	
		if(resetb = '0') then
			stored_value <= '0';	
		elsif(falling_edge(clk)) then
			stored_value <= input_value;
		end if;
	
	end process;

END ARCHITECTURE;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY myDFF_EN IS

	port(
	
		clk : IN std_logic;
		resetb : IN std_logic;
		en : IN std_logic;
		input_value : IN std_logic;
		stored_value : OUT std_logic
	
	);
	
	
END ENTITY;



ARCHITECTURE bhv OF myDFF_EN IS


BEGIN

	process(clk, resetb, en)
	
	begin
	
		if(resetb = '0') then
			stored_value <= '0';
		elsif((clk = '0') and (en = '1')) then
			stored_value <= input_value;
		end if;
	
	end process;

END ARCHITECTURE;
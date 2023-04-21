LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY REG_3bit IS

	port(
	
		clk : IN std_logic;
		resetb : IN std_logic;
		input_value : IN unsigned(2 downto 0);
		
		stored_value : OUT unsigned(2 downto 0)
	
	);
	
	
END ENTITY;



ARCHITECTURE bhv OF REG_3bit IS


BEGIN

	process(clk, resetb)
	
	begin
	
		if(resetb = '0') then
			stored_value <= "000";	
		elsif(falling_edge(clk)) then
			stored_value <= input_value;
		end if;

	end process;

END ARCHITECTURE;
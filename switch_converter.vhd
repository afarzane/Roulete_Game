LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY switch_converter IS

	port(
	
		SW_in : IN std_logic_vector(17 downto 0);
		
		SW_unsigned : OUT unsigned(17 downto 0)
	
	);
	
	
END ENTITY;



ARCHITECTURE bhv OF switch_converter IS


BEGIN

--	SW_unsigned <= to_unsigned(SW_in, 18);

END ARCHITECTURE;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY  debouncer IS

	PORT(
		
		clk : in std_logic;
		resetb : in std_logic;
		Key_in : in std_logic;
		key_out : out std_logic
		
	);
	
END ENTITY;


ARCHITECTURE behavioral OF debouncer IS
	
	signal s0 : std_logic;
	signal s1 : std_logic;
	signal s2 : std_logic;
	
	signal SCLR : std_logic;

BEGIN
	
	DFF1 : entity work.myDFF(bhv)
		port map(
			clk => clk,
			resetb => resetb,
			input_value => key_in,
			stored_value => s0
		);
	
	DFF2 : entity work.myDFF(bhv)
		port map(
			clk => clk,
			resetb => resetb,
			input_value => s0,
			stored_value => s1
		);
	
	SCLR <= s0 xor s1;
	
	counter1 : entity work.counter(bhv)
		port map(
			clk => clk,
			resetb => resetb,
			SCLR => SCLR,
			counter_out => s2
		);
		
	DFF_EN1 : entity work.myDFF_EN(bhv)
		port map(
			clk => clk,
			resetb => resetb,
			en => s2,
			input_value => s1,
			stored_value => key_out
		);
	
	
		
END ARCHITECTURE;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY BinarytoBCD IS

	port(
		
		bin_value : IN unsigned(11 downto 0);
		bcd_value : OUT unsigned(15 downto 0)
		
	
	);
	
	
END ENTITY;


ARCHITECTURE bhv OF BinarytoBCD IS
	
	signal bcd_ones, bcd_tens, bcd_hunds, bcd_thous : unsigned(11 downto 0);
	
	signal bcd_ones_f, bcd_tens_f, bcd_hunds_f, bcd_thous_f : unsigned(3 downto 0);
	
	signal temp1 : unsigned(11 downto 0);
	signal temp2 : unsigned(11 downto 0);

BEGIN

	bcd_thous <= bin_value / 1000;
	bcd_thous_f <= bcd_thous(3 downto 0);
	
	temp1 <= bin_value mod 1000;
	bcd_hunds <= temp1 / 100;
	bcd_hunds_f <= bcd_hunds(3 downto 0);
	
	temp2 <= bin_value mod 100;
	bcd_tens <= temp2 / 10;
	bcd_tens_f <= bcd_tens(3 downto 0);
	
	bcd_ones <= bin_value mod 10;
	bcd_ones_f <= bcd_ones(3 downto 0);
	
	
	bcd_value <= bcd_thous_f & bcd_hunds_f & bcd_tens_f & bcd_ones_f;
	

END ARCHITECTURE;
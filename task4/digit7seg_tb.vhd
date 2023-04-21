LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

ENTITY  digit7seg_tb IS

	PORT(
		
		HEX0 : out std_logic_vector(5 downto 0);	
		HEX1 : out std_logic_vector(5 downto 0);
		HEX2 : out std_logic_vector(5 downto 0);
		HEX3 : out std_logic_vector(5 downto 0);
		
		LED : out std_logic_vector(1 downto 0)
	);
	
END ENTITY;


ARCHITECTURE behaviour OF digit7seg_tb IS

	signal outputsig : std_logic_vector(6 downto 0);

BEGIN

	inst_digit7seg1 : entity work.digit7seg(behavioral)
		port map(
			digit => "0000",
			
			seg7 => HEX0(6 downto 0)
		
		);
		
	inst_digit7seg2 : entity work.digit7seg(behavioral)
		port map(
			digit => "0001",
			
			seg7 => HEX1(6 downto 0)
		
		);
		
	inst_digit7seg3 : entity work.digit7seg(behavioral)
		port map(
			digit => "0010",
			
			seg7 => HEX2(6 downto 0)
		
		);
		
	inst_digit7seg4 : entity work.digit7seg(behavioral)
		port map(
			digit => "0011",
			
			seg7 => HEX3(6 downto 0)
		
		);
		
		
END ARCHITECTURE;
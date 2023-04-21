LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY WORK;
USE WORK.ALL;

-----------------------------------------------------
--
--  This block will contain a decoder to decode a 4-bit number
--  to a 7-bit vector suitable to drive a HEX dispaly
--
--  It is a purely combinational block (think Pattern 1) and
--  is similar to a block you designed in Lab 1.
--
--------------------------------------------------------

ENTITY digit7seg IS
	PORT(
          digit : IN  UNSIGNED(3 DOWNTO 0);  -- number 0 to 0xF
          seg7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  -- one per segment
	);
END;


ARCHITECTURE behavioral OF digit7seg IS
BEGIN

-- Your code goes here
	process(digit)
	
	begin
	
		if(digit = "0000") then-- 0
			seg7 <= "1000000";
		elsif(digit = "0001") then-- 1
			seg7 <= "1111001";
			
		elsif(digit = "0010") then-- 2
			seg7 <= "0100100";
			
		elsif(digit = "0011") then-- 3
			seg7 <= "0110000";
			
		elsif(digit = "0100") then-- 4
			seg7 <= "0011001";
			
		elsif(digit = "0101") then-- 5
			seg7 <= "0010010";
			
		elsif(digit = "0110") then-- 6
			seg7 <= "0000010";
			
		elsif(digit = "0111") then-- 7
			seg7 <= "1111000";
			
		elsif(digit = "1000") then-- 8
			seg7 <= "0000000";
			
		elsif(digit = "1001") then-- 9
			seg7 <= "0011000";
			
		elsif(digit = "1010") then-- A
			seg7 <= "0001000";
			
		elsif(digit = "1011") then-- B
			seg7 <= "0000011";
			
		elsif(digit = "1100") then-- C
			seg7 <= "1000110";
			
		elsif(digit = "1101") then-- D
			seg7 <= "0100001";
			
		elsif(digit = "1110") then-- E
			seg7 <= "0000110";
			
		elsif(digit = "1111") then-- F
			seg7 <= "0001110";
			
		end if;	
		
		
	end process;
	
END;

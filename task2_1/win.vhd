LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
LIBRARY WORK;
USE WORK.ALL;

--------------------------------------------------------------
--
--  This is a skeleton you can use for the win subblock.  This block determines
--  whether each of the 3 bets is a winner.  As described in the lab
--  handout, the first bet is a "straight-up" bet, teh second bet is 
--  a colour bet, and the third bet is a "dozen" bet.
--
--  This should be a purely combinational block.  There is no clock.
--  Remember the rules associated with Pattern 1 in the lectures.
--
---------------------------------------------------------------

ENTITY win IS
	PORT(spin_result_latched : in unsigned(5 downto 0);  -- result of the spin (the winning number)
             bet1_value : in unsigned(5 downto 0); -- value for bet 1
             bet2_colour : in std_logic;  -- colour for bet 2
             bet3_dozen : in unsigned(1 downto 0);  -- dozen for bet 3
             bet1_wins : out std_logic;  -- whether bet 1 is a winner
             bet2_wins : out std_logic;  -- whether bet 2 is a winner
             bet3_wins : out std_logic); -- whether bet 3 is a winner
END win;


ARCHITECTURE behavioural OF win IS

BEGIN

	

	process(spin_result_latched, bet1_value, bet2_colour, bet3_dozen)
	
		variable spin_result_int : integer;
		variable even_odd : std_logic;
		variable range_of_spin : unsigned(1 downto 0);
	
		variable temp : integer;
	
	begin
		-- Initiate all variables

		bet1_wins <= '0';
		bet2_wins <= '0';
		bet3_wins <= '0';

		-- Check to see if spin result is even or odd
		
		spin_result_int := to_integer(spin_result_latched);
		
		temp := spin_result_int mod 2;
		
			
		if(spin_result_int >= 0 and spin_result_int<= 10) or (spin_result_int >= 19 and spin_result_int<= 28) then
				
			if (temp = 0) then
			
				even_odd := '0';
			
			else
		
				even_odd := '1';
		
			end if;
			
		elsif(spin_result_int >= 11 and spin_result_int<= 18) or (spin_result_int >= 29 and spin_result_int<= 36) then
				
			if (temp = 0) then
			
				even_odd := '1';
			
			else
		
				even_odd := '0';
		
			end if;
			
		end if;
		
		-- Find range of spin_result_latched
		
		if (spin_result_int <= 12 and spin_result_int >= 1) then
		
			range_of_spin := "00";
			
		elsif (spin_result_int <= 24 and spin_result_int >= 13) then
		
			range_of_spin := "01";
			
		elsif (spin_result_int <= 36 and spin_result_int >= 25) then
		
			range_of_spin := "10";
		
		end if;
		
		
		-- Begin comparisons
		
		if (bet1_value = spin_result_latched) then
		
			bet1_wins <= '1';
		
		end if; 
			
		if (bet2_colour = even_odd) then
			
			if(spin_result_int = 0) then
				bet2_wins <= '0';
			else
				bet2_wins <= '1';
			end if;
				
		end if;
			
		if (bet3_dozen = range_of_spin) then
			
			bet3_wins <= '1';
				
		end if;
		
	
	end process;
END;

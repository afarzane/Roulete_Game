LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
LIBRARY WORK;
USE WORK.ALL;

--------------------------------------------------------------
--
-- Skeleton file for new_balance subblock.  This block is purely
-- combinational (think Pattern 1 in the slides) and calculates the
-- new balance after adding winning bets and subtracting losing bets.
--
---------------------------------------------------------------


ENTITY new_balance IS
  PORT(money : in unsigned(11 downto 0);  -- Current balance before this spin
       value1 : in unsigned(2 downto 0);  -- Value of bet 1
       value2 : in unsigned(2 downto 0);  -- Value of bet 2
       value3 : in unsigned(2 downto 0);  -- Value of bet 3
       bet1_wins : in std_logic;  -- True if bet 1 is a winner
       bet2_wins : in std_logic;  -- True if bet 2 is a winner
       bet3_wins : in std_logic;  -- True if bet 3 is a winner
       new_money : out unsigned(11 downto 0));  -- balance after adding winning
                                                -- bets and subtracting losing bets
END new_balance;


ARCHITECTURE behavioural OF new_balance IS

BEGIN
  
	process(money, value1, value2, value3, bet1_wins, bet2_wins, bet3_wins)
	
		variable balance : unsigned(11 downto 0);
		
--		variable value1_acquired : integer;
--		variable value2_acquired : integer;
--		variable value3_acquired : integer;
--		
--		variable temp1 : signed(11 downto 0);
--		variable temp2 : unsigned(11 downto 0);
--		variable temp3 : integer;

	
	begin
	
	-- Calculate total loss/gain from game
	
--	-- Calculate bet 1
--	if (bet1_wins = '1') then
--		value1_acquired := (35)*to_integer(value1);
--	else
--		value1_acquired := to_integer(value1) * (-1);
--	end if;
--	
--	-- Calculate bet 1
--	if(bet2_wins = '1') then
--		value2_acquired := to_integer(value2);
--	else
--		value2_acquired := to_integer(value2) * (-1);
--	end if;
--	
--	-- Calculate bet 1
--	if(bet3_wins = '1') then
--		value3_acquired := (2)*to_integer(value3);
--	else
--		value3_acquired := to_integer(value3) * (-1);
--	end if;
--	
--	-- Find total
--	total_acquired := value1_acquired + value2_acquired + value3_acquired;
--	
--	temp1 := to_signed(total_acquired, 12);
--	temp2 := unsigned(abs(temp1));
--	-- Check if money will be 0
--	
--		if (total_acquired < 0) then
--			
--			if(temp2 > money) then
--			
--				new_money <= "000000000000";
--			else
--				temp3 := to_integer(money);
--				temp3 := temp3 + total_acquired;
--				new_money <= to_unsigned(temp3, 12);
--			end if;
--		
--		else
--	
--			new_money <= money + to_unsigned(total_acquired, 12);
--	
--		end if;

		balance := money;
		
		if(bet1_wins = '1') then
			balance := balance + to_unsigned(35,9)*value1;
		else
			balance := balance - value1;
		end if;
		
		if(bet2_wins = '1') then
			balance := balance + value2;
		else
			balance := balance - value2;
		end if;

		if(bet3_wins = '1') then
			balance := balance + to_unsigned(2,9)*value3;
		else
			balance := balance - value3;
		end if;
		
	
		new_money <= balance;
		
	end process;
  
END;

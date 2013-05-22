------------------------------
--  Constant value for reset vector
--  Author: LTC Paul Maxwell
--	 File:  reset_vector.vhd
--  date modified: 20 May 2013 
--  
--  
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reset_vector1 is
	 port(
			rst_vec : OUT STD_LOGIC_VECTOR(15 downto 0)
	     );
end reset_vector1;

architecture rvector of reset_vector1 is
begin

	rst_vec <= X"0080";			--reset vector address
	
end rvector;
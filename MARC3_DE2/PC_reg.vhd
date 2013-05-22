---------------------------------------------------------------------------------------------------
--
-- Title       : PC register
-- Design      : DesignProj1
-- Author      : LTC Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : pc_reg.vhd
-- Generated   : 20 May 2013
--
---------------------------------------------------------------------------------------------------
--
-- Description :   16-bit register for the PC.
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC_reg is
	 port(
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 clk : in STD_LOGIC;
		 data_out : out STD_LOGIC_VECTOR(15 downto 0);
		 reset : in STD_LOGIC
	     );
end PC_reg;


architecture pc16bit of PC_reg is



begin

	reg : process (clk, data_in, reset)
	begin
	   if (reset = '0') then
			data_out <= X"0080";									--reset vector
		elsif (clk'event and clk = '1') then
			data_out <= data_in;
		end if;
	end process;
	

end pc16bit;

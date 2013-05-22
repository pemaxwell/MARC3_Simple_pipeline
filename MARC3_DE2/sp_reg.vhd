---------------------------------------------------------------------------------------------------
--
-- Title       : SP register
-- Design      : DesignProj1
-- Author      : LTC Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : sp_reg.vhd
-- Generated   : 20 May 2013
--
---------------------------------------------------------------------------------------------------
--
-- Description :   16-bit register for the PC.
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sp_reg is
	 port(
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 Wr_en : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 data_out : out STD_LOGIC_VECTOR(15 downto 0);
		 reset : in STD_LOGIC
	     );
end sp_reg;


architecture sp16bit of sp_reg is
begin

	reg : process (clk, Wr_en, data_in, reset)
	begin
	   if (reset = '0') then
			data_out <= X"03FF";									--Stack Pointer initial vector
		elsif (clk'event and clk = '1') then
			if (Wr_en = '1') then
				data_out <= data_in;
			end if;
		end if;
	end process;
	

end sp16bit;

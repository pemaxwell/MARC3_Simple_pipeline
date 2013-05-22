---------------------------------------------------------------------------------------------------
--
-- Title       : reg16bit
-- Design      : DesignProj1
-- Author      : CPT Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : reg16bit.vhd
-- Generated   : Tue Jan 21 12:29:26 2003
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description :   16-bit register for DP 1.
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg16bit is
	 port(
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 Wr_en : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 data_out : out STD_LOGIC_VECTOR(15 downto 0);
		 reset : in STD_LOGIC
	     );
end reg16bit;


architecture reg16bit of reg16bit is
begin

	reg : process (clk, Wr_en, data_in, reset)
	begin
	   if (reset = '0') then
			data_out <= (others=>'0');
		elsif (clk'event and clk = '1') then
			if (Wr_en = '1') then
				data_out <= data_in;
			end if;
		end if;
	end process;
	

end reg16bit;

------------------------------
--Memory/writeback register
--  Author: CDT Christian Grado
--	 File:  mem_wb_reg.vhd
--  date modified:  10 May 2013 by LTC Paul Maxwell
--  This file contains the register which holds the instruction and address of the instruction between the data memory and mux which sends data to the registers in the control unit.
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mem_wb_reg is
	 port(
		 clock : in STD_LOGIC;
		 ram_in : in STD_LOGIC_VECTOR(15 downto 0);				-- data from the RAM
		 alu_data_in : in STD_LOGIC_VECTOR(15 downto 0);		-- data from the alu_data_in
		 ctrl_in : STD_LOGIC_VECTOR(13 downto 2);
		 R_we	: in STD_LOGIC;											-- value to pass R_We signal to register file
		 R_we_out : out STD_LOGIC;
		 ram_out : out STD_LOGIC_VECTOR(15 downto 0);
		 alu_data_out : out STD_LOGIC_VECTOR(15 downto 0);
		 dest_reg : out STD_LOGIC_VECTOR(2 downto 0);			-- destination register to write data into
		 ctrl_out : out STD_LOGIC_VECTOR(5 downto 0);			-- values to control WB stage mux
		 reset : IN STD_LOGIC
	     );
end mem_wb_reg;

architecture mem_wb_reg of mem_wb_reg is
begin

	reg : process (clock, reset,R_we,ram_in,alu_data_in,ctrl_in)
	begin
		if (reset = '0') then
			R_we_out <= '0';
			ram_out <=(others=>'0');
			alu_data_out <= (others=>'0');
			dest_reg <= (others=>'0');
			ctrl_out <= (others=>'0');
		elsif (clock'event and clock = '1') then
			R_we_out <= R_we;
			ram_out <= ram_in;
			alu_data_out <= alu_data_in;
			dest_reg <= ctrl_in(11 downto 9);
			ctrl_out <= ctrl_in(13 downto 12) & ctrl_in(8 downto 5);
		end if;
	end process;
	

end mem_wb_reg;
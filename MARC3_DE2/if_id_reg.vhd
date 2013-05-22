--------------------------------
--Fetch/Decode register
--  Author: CDT Christian Grado
--	 File:  if_id_reg.vhd
--  date modified:  7 May 13 by LTC Maxwell
--  This file contains the register which holds the instruction and address of the instruction between the instruction memory and control unit.
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity if_id_reg is
	 port(
		 inst_in : in STD_LOGIC_VECTOR(15 downto 0); -- takes the instruction in
		 addr_in : in STD_LOGIC_VECTOR(15 downto 0); -- takes in the address of the instruction
		 --write_ctrl : in std_logic; 						--control bit from hazard detect
		 clock : in STD_LOGIC;
		 instr_to_cntl : out STD_LOGIC_VECTOR(15 downto 0);	--pass part of instruction to control unit
		 srcA_sel	: out STD_LOGIC_VECTOR(6 downto 4);		--bits for selecting source register A
		 srcB_sel	: out STD_LOGIC_VECTOR(3 downto 1);		--bits for selecting source register B
		 PC_out : out STD_LOGIC_VECTOR(15 downto 0); -- passes the address out to the next register
		 reset : IN STD_LOGIC
	     );
end if_id_reg;

architecture if_id_reg of if_id_reg is
begin

	reg : process (clock, addr_in, inst_in, reset)
	begin
	   if (reset = '0') then
			instr_to_cntl <= X"0000";				-- nop RD = 0, RS1 = 1, RS2 = 2
			srcA_sel <= "000";
			srcB_sel <= "000";
			PC_out <= (others=>'0');
		elsif (clock'event and clock = '1') then   -- and write_ctrl = '1') then
			
				instr_to_cntl <= inst_in(15 downto 0);
				srcA_sel <= inst_in(6 downto 4);
				srcB_sel <= inst_in(3 downto 1);
				PC_out <= addr_in;
			
		end if;
	end process;
	

end if_id_reg;
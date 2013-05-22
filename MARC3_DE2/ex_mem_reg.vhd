------------------------------
--Execute/Memory register
--  Author: CDT Christian Grado
--	 File:  ex_mem_reg.vhd
--  date modified:  20 May 2013 by LTC Maxwell
--  This file contains the register which holds the instruction and address of the instruction between the control unit and functional unit.
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex_mem_reg is
	 port(
		 pc_in : in STD_LOGIC_VECTOR(15 downto 0); 		
		 alu_in : in STD_LOGIC_VECTOR(15 downto 0); 		-- takes in the output of the ALU
		 dataB_in : in STD_LOGIC_VECTOR(15 downto 0);	-- src reg B value
		 zero : in STD_LOGIC;									-- status register zero bit from EX stage
		 negative : in STD_LOGIC;								-- status register negative bit from EX stage
		 ctrl_in : in std_logic_vector(13 downto 2); 	-- takes in the control word
		 clock : in STD_LOGIC;
		 pc_out : out STD_LOGIC_VECTOR(15 downto 0); 
		 alu_out : out STD_LOGIC_VECTOR(15 downto 0); 	-- passes the ALU ouput out to the next stage
		 dataB_out : out STD_LOGIC_VECTOR(15 downto 0);
		 zero_out : out STD_LOGIC;
		 negative_out : out STD_LOGIC;
		 mem_read : out std_logic;								-- control bit for RAM read op
		 mem_write : out std_logic;							-- control bit for RAM write op
		 R_we : out std_logic;									-- read/not write bit	
	    ctrl_out : out std_logic_vector(13 downto 2);
		 reset : IN std_logic
	     );
end ex_mem_reg;

architecture ex_mem_reg of ex_mem_reg is
begin

	reg : process (clock, reset,pc_in,alu_in,dataB_in,zero,negative,ctrl_in)
	begin
		if (reset = '0') then
			pc_out <=(others=>'0');
			alu_out <= (others=>'0');
			dataB_out <= (others=>'0');
			zero_out <= '0';
			negative_out <= '0';
			mem_read <= '0';
			mem_write <= '0';
			R_we <= '0';
			ctrl_out <= (others=>'0');							--no op
		elsif (clock'event and clock = '1') then
			pc_out <= pc_in;
			alu_out <= alu_in;
			dataB_out <= dataB_in;
			zero_out <= zero;
			negative_out <= negative;
			mem_read <= ctrl_in(3);
			mem_write <= ctrl_in(2);
			R_we <= ctrl_in(4);
			ctrl_out <= ctrl_in;
		end if;
	end process;
	

end ex_mem_reg;
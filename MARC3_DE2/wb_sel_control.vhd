------------------------------
--	 WB_Select Control Logic
--  Author: LTC Paul Maxwell
--	 File:  wb_sel_control.vhd
--  date modified:  10 May 2013
--  
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity wb_sel_control is
	port
	(
		-- Input ports
		ctrl_wd	: in std_logic_vector(5 downto 0);	-- system control word
		-- Output ports
		wb_sel : out std_logic								-- control bit for the data wb value in ID stage
	);
end wb_sel_control;


architecture wb_sel of wb_sel_control is

begin

				 
	wb_sel <= '1' when ctrl_wd = "000001" else			--ld operation
				 '1' when ctrl_wd = "011110" else			--ret operation
				 '0';
				 
end wb_sel;

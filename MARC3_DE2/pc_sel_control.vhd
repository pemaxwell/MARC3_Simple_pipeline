------------------------------
--	 PC_Select Control Logic
--  Author: LTC Paul Maxwell
--	 File:  pc_sel_control.vhd
--  date modified:  10 May 2013
--  
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pc_sel_control is
	port
	(
		-- Input ports
		negative	: in  std_logic;
		zero		: in std_logic;
		reset		: in std_logic;							-- system reset signal
		ctrl_wd	: in std_logic_vector(13 downto 2);	-- system control word
		-- Output ports
		pc_sel : out std_logic_vector(1 downto 0);		-- control bits for the next PC value in IF stage
		--sp_sel : out std_logic;								-- select SP or SP-1 for next SP
		sp_wr_en : out std_logic							-- write enable for SP
	);
end pc_sel_control;


architecture pc_sel of pc_sel_control is

signal branch : std_logic;

begin

	branch <= '1' when (ctrl_wd(13 downto 12)= "00" AND ctrl_wd(8 downto 5) = "0111") else		--jmp
				 '1' when (ctrl_wd(13 downto 12)= "01" AND ctrl_wd(8 downto 5) = "0100") else		--ba
				 '1' when (ctrl_wd(13 downto 12)= "01" AND ctrl_wd(8 downto 5) = "0101") else		--bn
				 '1' when (ctrl_wd(13 downto 12)= "01" AND ctrl_wd(8 downto 5) = "0110") else		--bz
				 '1' when (ctrl_wd(13) = '1') else																--call
				 '0';
					 
	pc_sel <= "11" when reset = '0' else
				 "10" when reset = '1' AND (ctrl_wd(13 downto 12)= "01" AND ctrl_wd(8 downto 5) = "1110") else	--handle return instruction
				 "01" when reset = '1' AND branch = '1' else			-- handle call, jmp, ba, bn, bz instructions
				 "00";
	
	--sp_sel <= '1' when ctrl_wd(13)= '1' else		-- choose SP-1 when call instruction
	--			 '0';
				 
	sp_wr_en <= '1' when (ctrl_wd(13)= '1') else																-- write when call instruction
					'1' when (ctrl_wd(13 downto 12)= "01" AND ctrl_wd(8 downto 5) = "1110") else  -- write when ret instruction
					'0';

end pc_sel;

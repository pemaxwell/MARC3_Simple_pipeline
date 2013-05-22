------------------------------
--  Hazard detection unit
--  Author: CDT Christian Grado
--	 File:  hazard_detect.vhd
--  date modified:  14 NOV 12
--  This file takes the data from intermediate registers and determines if the pipeline needs to be stalled and stalls it
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
entity hazard_detect is
	 port(
	 		clock : in std_logic;	
			id_ex_reg_rt : in std_logic_vector(2 downto 0); --write reg from id/ex reg
			id_ex_mem_rd : in std_logic; --mem_rd control bit from id_ex reg
			if_id_reg_rs : in std_logic_vector(2 downto 0); --select reg from if/id reg
			if_id_reg_rt : in std_logic_vector(2 downto 0); --write reg from if/id reg
			inst_in : in std_logic_vector(15 downto 0); --instruction from if/id reg
			if_id_write : out std_logic; --write bit for if/id reg
			pc_write: out std_logic; --write bit for program counter
			mux_select : out std_logic-- mux select bits for register control vector
		);
	 end hazard_detect;

architecture hazard_detect of hazard_detect is
begin
operation : process (clock)
begin
if (id_ex_mem_rd ='1' AND ((id_ex_reg_rt = if_id_reg_rs) OR (id_ex_reg_rt = if_id_reg_rt)) )then
	mux_select<= '1';
	if_id_write<= '1';
	pc_write <= '1';
else 
	mux_select<='0';
	if_id_write <='0';
	pc_write <= '0';
end if;	
end process;
end hazard_detect; 

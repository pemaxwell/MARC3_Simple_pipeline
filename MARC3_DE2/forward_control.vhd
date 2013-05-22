------------------------------
--  Forwarding unit control
--  Author: CDT Christian Grado
--	 File:  forward_control.vhd
--  date modified:  14 NOV 12
--  This file takes the data from intermediate registers and sends it to the ALU
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity forward_control is
	 port(
			rs_in : in std_logic_vector(2 downto 0); --register source from id/ex reg
			rt_in : in std_logic_vector(2 downto 0); -- register destination from id/ex reg
			wb_ctrl : in std_logic_vector(1 downto 0); -- wb control values from mem/wb reg
			wb_ctrl_mem : in std_logic_vector(1 downto 0); -- wb contorl values from ex/mem reg
			ex_mem_reg_rd : in std_logic_vector(2 downto 0); --destination reg from ex/mem reg
			mem_wb_reg_rd : in std_logic_vector(2 downto 0); --destination reg from mem/wb reg
			alu_a : out std_logic_vector(1 downto 0); --alu a bus
			alu_b : out std_logic_vector(1 downto 0)
			
	     );
end forward_control;

architecture forward_control of forward_control is
begin
	control : process(ex_mem_reg_rd)
	begin
		if ((wb_ctrl_mem(1) = '1') AND (ex_mem_reg_rd /= 0) AND( ex_mem_reg_rd = rs_in)) then
			alu_a <= "10";		
		elsif (wb_ctrl(1)= '1' AND mem_wb_reg_rd /= 0 AND mem_wb_reg_rd = rs_in AND NOT (wb_ctrl_mem ="11" AND (ex_mem_reg_rd /=0) AND (ex_mem_reg_rd /=rs_in))) then
			alu_a <= "01";
		else
			alu_a <= "00";
		end if;
		if (wb_ctrl_mem(1)= '1' AND ex_mem_reg_rd /= 0 AND ex_mem_reg_rd = rt_in) then
			alu_b <= "10";
		
		elsif (wb_ctrl(1)= '1' AND mem_wb_reg_rd /= 0 AND mem_wb_reg_rd = rt_in AND NOT(wb_ctrl_mem="11" AND (ex_mem_reg_rd /=0) AND (ex_mem_reg_rd /=rt_in))) then
			alu_b <= "01";
		else
			alu_b <= "00";
		end if;
	
	end process;
	


end forward_control;
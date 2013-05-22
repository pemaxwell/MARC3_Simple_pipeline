------------------------------
--Decode/ExecuteF register
--  Author: CDT Christian Grado
--	 File:  id_ex_reg.vhd
--  date modified:  6 May 2013 -> Modified by LTC Maxwell
--  This file contains the register which holds the instruction and address of the instruction between the control unit and functional unit.
--  Based off "Computer Organization and Design". Patterson, David A., Hennessy, John L. Revised Fourth Edition, 2012. Chapter 4.
--------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity id_ex_reg is
	 port(
		 pc_in : in STD_LOGIC_VECTOR(15 downto 0); 			-- takes in the address of the instruction for branch address usage
		 clock : in STD_LOGIC;
		 aluB_sel_in : in STD_LOGIC_VECTOR(1 downto 0);				--operation code for current instruction
		 offset_in : in std_logic_vector(15 downto 0); 		--offset/displacement from ID stage for immediate based operations
		 ctrl_in : in std_logic_vector(13 downto 2); 		--ctrl lines in from control unit
		 pc_sel_in : in std_logic_vector(1 downto 0);		--control for EX stage PC source
		 aluA_sel_in : in std_logic;								--control for EX stage ALU A src input
		 regA_data : IN STD_LOGIC_VECTOR(15 downto 0);		--source register A data
		 regB_data : IN STD_LOGIC_VECTOR(15 downto 0);		--source register B data
		 regA_out : out STD_LOGIC_VECTOR(15 downto 0);
		 regB_out : out STD_LOGIC_VECTOR(15 downto 0);
		 PC_src : out STD_LOGIC_VECTOR(15 downto 0);
		 offset_out : out std_logic_vector(15 downto 0);	--sign extended constant out or displacement value
		 alu_op : out STD_LOGIC_VECTOR(3 downto 0);			--operation for the ALU
		 pc_sel_out : out std_logic_vector(1 downto 0);	
		 aluA_sel_out : out std_logic; 
		 aluB_sel_out : out STD_LOGIC_VECTOR(1 downto 0);
		 cntl_out : out std_logic_vector(13 downto 2); 		--lines to next register
		 reset : IN STD_LOGIC
	     );
end id_ex_reg;

architecture id_ex_reg of id_ex_reg is
begin

	reg : process (clock, reset, pc_in,regA_data,regB_data,ctrl_in,offset_in,pc_sel_in,aluA_sel_in,aluB_sel_in)
	begin
		if (reset = '0') then 
				PC_src <=(others=>'0');
				regA_out<=(others=>'0');
				regB_out<=(others=>'0');
				alu_op <="0000";						--no op
				offset_out <= (others=>'0');
				cntl_out <= (others=>'0');					--no op
				pc_sel_out <= (others=>'0');
				aluA_sel_out <= '0';
				aluB_sel_out <= "00";
				
		elsif (clock'event and clock = '1') then
			
				PC_src <= pc_in;
				regA_out<=regA_data;
				regB_out<=regB_data;
				alu_op <=ctrl_in(8 downto 5);
				offset_out <= offset_in;
				cntl_out <= ctrl_in;
				pc_sel_out <= pc_sel_in;
				aluA_sel_out <= aluA_sel_in;
				aluB_sel_out <= aluB_sel_in;
		end if;
	end process;
	
end id_ex_reg;
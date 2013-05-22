---------------------------------------------------------------------------------------------------
--
-- Title       : ControlUnit
-- Design      : designproj2
-- Author      : MAJ Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : ControlUnit.vhd
-- Generated   : 6 Aug 14:10:36 2003
-- Modified 	: 7 May 2013 by LTC Maxwell
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : Control unit for the MARC1 processor for design project 2 in CS380.
--		 Modified to add an Address Register and fixed Tristate bus access
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity controlunit is
	 port(
		IR : IN STD_logic_vector(15 downto 0);			--instruction to decode
		reset : IN std_logic;
		ctl_wd : OUT std_logic_vector(13 downto 2); 	--control word to pass to ID/EX reg
		aluA_sel : OUT std_logic;							--select line for EX stage ALU src A input
		aluB_sel : OUT STD_logic_vector(1 downto 0);	--select line for EX stage ALU src B input
		pc_sel	: OUT std_logic_vector(1 downto 0); --select line for EX stage PC source
		offset : OUT std_logic_vector(15 downto 0);	--sign-extended displacement or sethi immediate value
		regA_src_sel : OUT Std_logic						--select RS1 or RD for Reg Src A input to register file
	     );
end controlunit;


architecture controlunit of controlunit is

--Instructions set types
--type operations is (subx, st, addx, andx, notx, srlx, sllx, ld, hlt, sethi, addi, ret,
--bz, bn, ba, orx, call, nop, jmp, xorx);
--signal op : operations;

--signal ld_op, st_op, R_we : std_logic;
signal test : std_logic_vector(3 downto 0);		        --dummy signal for case statement

--------------------------------------------------------------------------- 
-- control word format
--      |cw(13)|cw(12)|cw(11-9)|cw(8-5)|cw(4) |cw(3)  |cw(2)  |
--      |  MD  |  MB  |  selD  |  FS   | R_we | ld_op | st_op |
----------------------------------------------------------------------- 

begin
	test <= IR(10 downto 7);
	--ctl_wd(4) <= R_we;
	--ctl_wd(3) <= ld_op;
	--ctl_wd(2) <= st_op;
	
	aluA_sel <= '1' when (reset='1' AND ((IR(15 downto 14)="01" AND test="X001") OR (IR(15)='1'))) else		--source SP only for call and return commands
					'0';
					
	aluB_sel <= "00" when (reset = '1' AND IR(15 downto 14)="00") else													--format 0 instructions source data B lines
					"11" when (reset='1' AND ((IR(15 downto 14)="01" AND test="X001") OR (IR(15)='1'))) else		--source ALU B with a constant 1  call or return
					"01";																														--source ALU B with offset field
	
	pc_sel <= "01" when (reset='1' AND IR(15)='1') else																		--(op = call) else
				 "10" when (reset='1' AND IR(15 downto 14)="00" AND test="0111") else									--(op = jmp)  else
				 "00";
	
	regA_src_sel <= '1' when IR(15 downto 14)="01" else		--use for sethi and addi instructions
						 '0';													--use for all other instructions
	
	main: process (reset, IR, test)
	begin
					   
		if (reset = '0') then
			ctl_wd(3) <= '0';
			ctl_wd(2) <= '0';
			ctl_wd(4) <= '0';
			--op <= nop;
			offset <= (others=>'0');
			ctl_wd(13 downto 5) <= (others=>'0');
		elsif IR(15)='1' then 							--format 2 instructions, call
			--op <= call; 
			offset <= '0' & IR(14 downto 0);	 
			ctl_wd(3) <= '0'; 
			ctl_wd(2) <= '1';								--st_op was a '0'
			ctl_wd(4) <= '0';
			ctl_wd(13) <= '1';							--set high to allow PC_sel to recognize format 2
			ctl_wd(12 downto 9) <= (others=>'0'); 
			ctl_wd(8 downto 5) <= "1001";				-- SP <= SP - 1
		elsif IR(14)='0' then							--format 0 instructions
			offset <= (others=>'0');
			case test is
				when "1011" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= xorx;
				when "1001" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= subx; 
				when "1000" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= orx; 
				when "0111" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <='0';ctl_wd(4) <= '0';			-- op <= jmp; --ld_op was '1', r_we was '1'
				when "0110" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= addx; 
				when "0101" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			-- op <= andx;
				when "0100" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= notx; 
				when "0011" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			-- op <= srlx;
				when "0010" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '1';			--op <= sllx; 
				when "0001" => ctl_wd(13 downto 5) <= IR(15 downto 7); ctl_wd(3) <='1'; ctl_wd(2) <= '0'; ctl_wd(4) <= '1';			--op <= ld; r_we was a '0', '1'& IR(14 downto 7)			
				when "0000" => ctl_wd(13 downto 5) <= IR(15 downto 7);ctl_wd(3) <= '0'; ctl_wd(2) <= '1';ctl_wd(4) <= '0';			--op <= st; r_we was a '1'
				when others => ctl_wd(13 downto 5) <= (others=>'0');ctl_wd(3) <= '0'; ctl_wd(2) <= '0';ctl_wd(4) <= '0';				--op <= nop; r_we was a '1'
			 end case;
		else											--format 1 instructions
			case IR(10 downto 8) is
				when "000" => ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(7 downto 5) <= IR(10 downto 8);			--op <= hlt; 
								  ctl_wd(8) <= '0'; ctl_wd(4) <= '0'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';offset <= (others=>'0');
				when "001" => ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(8 downto 5) <= "1110";						--op <= ret; SP <= SP + 1
								  ctl_wd(4) <= '0'; ctl_wd(3) <= '1'; ctl_wd(2) <= '0';offset <= (others=>'0');										--ld_op was a '0'
				when "011" => ctl_wd(13 downto 9) <= IR(15 downto 11);ctl_wd(8 downto 6) <= IR(10 downto 8);				--op <= addi; 
								  ctl_wd(5) <= '0'; ctl_wd(4) <= '1'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';
								if IR(7)='1' then
									offset <= X"FF"&IR(7 downto 0);
								else
									offset <= X"00"&IR(7 downto 0);
								end if;
				when "100" =>  ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(7 downto 5) <= IR(10 downto 8);			--op <= ba; 
								  ctl_wd(8) <= '0'; ctl_wd(4) <= '0'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';
								if IR(7)='1' then
									offset <= X"FF"&IR(7 downto 0);
								else
									offset <= X"00"&IR(7 downto 0);
								end if;
				when "101" => ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(7 downto 5) <= IR(10 downto 8);			--op <= bn; 
								  ctl_wd(8) <= '0'; ctl_wd(4) <= '0'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';
								if IR(7)='1' then
									offset <= X"FF"&IR(7 downto 0);
								else
									offset <= X"00"&IR(7 downto 0);
								end if;
				when "110" => ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(7 downto 5) <= IR(10 downto 8);			--op <= bz; 
								  ctl_wd(8) <= '0'; ctl_wd(4) <= '0'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';
								if IR(7)='1' then
									offset <= X"FF"&IR(7 downto 0);
								else
									offset <= X"00"&IR(7 downto 0);
								end if;
				when "111" => offset<=IR(7 downto 0)&X"00"; ctl_wd(4) <= '1'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';		--op <= sethi; 
							  ctl_wd(13 downto 9) <= IR(15 downto 11);ctl_wd(7 downto 5) <= IR(10 downto 8);ctl_wd(8) <= '0';				
				when others => ctl_wd(13 downto 9) <= IR(15 downto 11); ctl_wd(7 downto 5) <= IR(10 downto 8);			--op <= nop; 
							  ctl_wd(8) <= '0'; ctl_wd(4) <= '0'; ctl_wd(3) <= '0'; ctl_wd(2) <= '0';offset <= (others=>'0');
			end case;
		end if;					
	end process;				 

end controlunit;

---------------------------------------------------------------------------------------------------
--
-- Title       : function_unit
-- Design      : DesignProj1
-- Author      : MAJ Paul Maxwell
-- Company     : USMA
--
---------------------------------------------------------------------------------------------------
--
-- File        : function_unit.vhd
-- Generated   : August 5, 14:22:10 2003, modified 21 May 2013 by LTC Maxwell
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : Function Unit for DP 1.
--
---------------------------------------------------------------------------------------------------
 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_unsigned.all;

entity function_unit is
	 port(
		 Bus_A : in STD_LOGIC_VECTOR(15 downto 0);
		 Bus_B : in STD_LOGIC_VECTOR(15 downto 0);
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 zero : out STD_LOGIC;
		 Neg : out STD_LOGIC;
		 F_out : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end function_unit;


architecture function_unit of function_unit is 

signal F_temp : std_logic_vector(15 downto 0);

begin

	with Sel select
	F_temp <= Bus_B when "0111",								--sethi, jmp				
			 Bus_A + Bus_B when "0110",						--addx, addi
			 Bus_A + Bus_B when "1110", 						--ret
			 Bus_A and Bus_B when "0101",						--andx
			 not (Bus_A) when "0100",							--notx
			 (Bus_A(14 downto 0) & '0') when "0010",		--sllx
			 ('0'& Bus_A(15 downto 1)) when "0011",		--srlx
			 Bus_A - Bus_B when "1001",						--subx, call
			 Bus_A or Bus_B when "1000", 						--orx
			 Bus_A xor Bus_B when "1011",						--xorx
			 Bus_A when others;   								--st, ld, nop, hlt, ba, bn, bz
			 
Neg <= '1' when F_temp(15)='1' else
	   '0';
	
zero <= '1' when F_temp = 0 else
		'0';
		
F_out <= F_temp;

end function_unit;

--  Author: MAJ Paul Maxwell
--	 File:  Datapath.vhd
--  date modified:  6 May 2013
--  This file contains initial entity information for the design
--  of a datapath as described in the CS380 DP1 Handout for AY041. 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY DP_MARC1 IS
	PORT(
	clk: IN std_logic; 		-- clock	
	R_we: IN std_logic; 	-- register file & flag write enable
	--ld_op: IN std_logic;	-- op is load (from control unit)
	--st_op: IN std_logic; 	-- op is store (from control unit)
	--Z: OUT std_logic; 	-- zero flag (Z=1, result of Func Unit is 0)
	--N: OUT std_logic; 	-- negative flag (N=1, sign of result is neg)
	--ctl_wd: IN  std_logic_vector(14 downto 0);			-- control word
	regA_sel : IN std_LOGIC_VECTOR(2 downto 0);		--src register A
	regB_sel : IN std_LOGIC_VECTOR(2 downto 0);		--src register B
	write_reg_sel : IN STD_LOGIC_VECTOR(2 downto 0);  --write register select
	--const_in: IN  std_logic_vector(15 downto 0);		-- constant in
	R1out,R2out,R3out,R4out,R5out,R6out,R7out : out std_logic_vector(15 downto 0);  --only needed for register content visibility
	dp_write_data_in: IN  std_logic_vector(15 downto 0);	-- data to/from memory
	dp_dataA_out: OUT std_logic_vector(15 downto 0);
	dp_dataB_out: OUT std_logic_vector(15 downto 0);
	reset : IN std_logic
	--dp_addr_in: IN  std_logic_vector(15 downto 0);	  	-- address to memory
	--dp_addr_out:OUT std_logic_vector(15 downto 0)
		 );
END DP_MARC1;

ARCHITECTURE dataflow OF DP_MARC1 IS

CONSTANT highZ: std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
Constant R0 : Std_logic_vector(15 downto 0) := "0000000000000000";

component reg16bit is
	 port(
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 Wr_en : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 data_out : out STD_LOGIC_VECTOR(15 downto 0);
		 reset : in STD_LOGIC
	     );
end component; 

signal R1outT,R2outT,R3outT,R4outT,R5outT,R6outT,R7outT : std_logic_vector(15 downto 0);
--signal Abus, Bbus, btemp :std_logic_vector(15 downto 0);
--signal func_out, func_data : std_logic_vector(15 downto 0);
signal R1in, R2in,R3in,R4in,R5in,R6in,R7in : std_logic;
signal R1Wr,R2Wr,R3Wr,R4Wr,R5Wr,R6Wr,R7Wr : std_logic;

BEGIN 
	R1out <= R1outT;
	R2out <= R2outT;
	R3out <= R3outT;
	R4out <= R4outT;
	R5out <= R5outT;
	R6out <= R6outT;
	R7out <= R7outT;

	--dp_addr_out <= Abus when (ld_op='1' or st_op='1') else (others=>'Z');
	--dp_data_out <= Bbus when (st_op='1') else (others=>'Z');


	R1 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R1in,clk=> clk,data_out=> R1outT,reset=>reset); 
	R2 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R2in,clk=> clk,data_out=> R2outT,reset=>reset); 
	R3 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R3in,clk=> clk,data_out=> R3outT,reset=>reset); 
	R4 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>r4in,clk=> clk,data_out=> R4outT,reset=>reset); 
	R5 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R5in,clk=> clk,data_out=> R5outT,reset=>reset); 
	R6 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R6in,clk=> clk,data_out=> R6outT,reset=>reset); 
	R7 :  reg16bit port map (data_in=> dp_write_data_in,Wr_en=>R7in,clk=> clk,data_out=> R7outT,reset=>reset); 
	
	--Fnc_unit : function_unit port map(Bus_A=>Abus,Bus_B=> Bbus,Sel=> ctl_wd(9 downto 6),zero=>Z,Neg=>N,F_out=> func_out);
	
	with regA_sel select
	dp_dataA_out    <= R0 when "000",
						R1outT when "001",
						R2outT when "010",
						R3outT when "011",
						R4outT when "100",
						R5outT when "101",
						R6outT when "110",
						R7outT when others;
			
	with regB_sel select
	dp_dataB_out   <= R0 when "000",					   --input from reg file
						R1outT when "001",
						R2outT when "010",
						R3outT when "011",
						R4outT when "100",
						R5outT when "101",
						R6outT when "110",
						R7outT when others;	
			
	--Bbus <= Btemp when ctl_wd(13)= '0' else	--constant or register input		
	--		const_in when ctl_wd(13)= '1';
			
	--func_data <= func_out when ctl_wd(14)= '0' else  --FU output or data bus
	--			 dp_data_in when ctl_wd(14) = '1';
		
	R1in <= '1' when (R_we = '1' and write_reg_sel="001" )else
			'0';
			
	R2in <= '1' when (R_we = '1' and write_reg_sel="010") else
			'0';
	
	R3in <= '1' when (R_we = '1' and write_reg_sel="011") else
			'0';		  
	
	R4in <= '1' when (R_we = '1' and write_reg_sel="100") else
			'0';   
			
	R5in <= '1' when (R_we = '1' and write_reg_sel="101") else
		'0';	 
		
	R6in <= '1' when (R_we = '1' and write_reg_sel="110") else
			'0';												   
			
	R7in <= '1' when (R_we = '1' and write_reg_sel="111") else
			'0';		
	
END dataflow;
	




--This packages defines a standard for designers
--  to use in describing the interconnection data types
--  used in vhdl modeling. Declares std_logic, rising_edge(), etc
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity CPU_MARC1 is
    port (
     clk: IN std_logic;					-- system clock
     mem_rd : OUT std_logic;			-- memory read control
     mem_wr : OUT std_logic;			-- memory write control  
	  mem_cs : OUT std_logic;			-- memory chip select
     address: INOUT std_logic_vector(15 downto 0); -- system addr bus
     data: INOUT std_logic_vector(15 downto 0);  -- system data bus
	  R1out,R2out,R3out,R4out,R5out,R6out,R7out : out std_logic_vector(15 downto 0);  
	  run : IN std_logic;   				-- external run signal
	  rst: IN  std_logic	  				-- external reset signal
     ); 
end entity;	

architecture it of CPU_MARC1 is

component  DP_MARC1 IS
	PORT(
	clk: IN std_logic; 		-- clock	
	R_we: IN std_logic; 	-- register file & flag write enable
	ld_op: IN std_logic;	-- op is load (from control unit)
	st_op: IN std_logic; 	-- op is store (from control unit)
	Z: OUT std_logic; 	-- zero flag (Z=1, result of Func Unit is 0)
	N: OUT std_logic; 	-- negative flag (N=1, sign of result is neg)
	ctl_wd: IN  std_logic_vector(14 downto 0);			-- control word
	const_in: IN  std_logic_vector(15 downto 0);		-- constant in
	reset : IN STD_LOGIC;		--added 19 Nov 2012
	R1out,R2out,R3out,R4out,R5out,R6out,R7out : out std_logic_vector(15 downto 0);
	dp_data_bus: INOUT  std_logic_vector(15 downto 0);	-- data to/from memory
	dp_addr_bus: INOUT  std_logic_vector(15 downto 0)	  	-- address to memory
		 );
END component;

component Control_Unit is
	 port(
		clk: IN  std_logic;	
		Mem_rd: OUT  std_logic  :='1';	 
		Mem_wr: OUT  std_logic  :='1';		
		Mem_cs: OUT std_logic :='1'; 
		Z: IN std_logic; 
		N: IN std_logic; 
		R_we: OUT std_logic; 
		ld_op: OUT std_logic; 
		st_op: OUT std_logic;
		ctl_wd: OUT std_logic_vector(14 downto 0); 
		const_out: OUT  std_logic_vector(15 downto 0); 
		CU_addr_bus: INOUT  std_logic_vector(15 downto 0);	
		CU_data_bus: INOUT  std_logic_vector(15 downto 0);
  	     run: IN std_logic; 	
		rst: IN  std_logic 
	     );
end component;

signal zero, neg, RW, LD, ST : std_logic;
signal const : std_logic_vector(15 downto 0);	
signal CNTLWD : std_logic_vector(14 downto 0);
signal cu_addr, fnu_addr : std_logic_vector(15 downto 0);

begin

	address <= fnu_addr when LD = '1' or ST = '1' else
				 cu_addr when LD = '0' and ST = '0' else
				 "ZZZZZZZZZZZZZZZZ";

	CU: Control_Unit port map (clk, Mem_rd, Mem_wr, Mem_cs, zero, neg, RW, LD, ST, CNTLWD, const, 
	cu_addr, data, run, rst);	--address

	FNU: DP_MARC1 port map (clk, RW,LD,st,Zero,Neg,cntlwd,const,rst,R1out,R2out,R3out,R4out,R5out,R6out,R7out,data,fnu_addr);  --address	

end;
-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity MARC3 is
	port
	(
		clk : in std_logic;
		LCD_DATA_BUS : out std_logic_vector(7 downto 0);
		LCD_E : out std_logic;
		LCD_ON : out std_logic;
		LCD_RS : out std_logic;
		LCD_RW : out std_logic;
		reg_select : in std_logic_vector(2 downto 0);
		RESET_LED : out std_logic;
		Reset_Pin : in std_logic
	);

end MARC3;

architecture ppl_type of MARC3 is

begin

end;

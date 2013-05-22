transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/X16bit_4_to_1_mux.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/datapath.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/reg16bit.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/function_unit.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/ex_mem_reg.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/mem_wb_reg.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/id_ex_reg.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/if_id_reg.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/DE2_CLOCK.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/controlunit.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/systemrom.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/systemram.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/PC_adder.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/bit16_2_to_1_mux.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/PC_displ_adder.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/pc_sel_control.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/wb_sel_control.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/mux3bit_2_to_1.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/LCD_mux.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/constant0.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/constant1.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/reset_vector1.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/PC_reg.vhd}
vcom -93 -work work {C:/Users/paul.maxwell/Documents/MARC3_DE2/sp_reg.vhd}


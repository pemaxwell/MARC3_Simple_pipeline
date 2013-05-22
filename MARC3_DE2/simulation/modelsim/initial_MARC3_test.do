onerror {resume}
quietly virtual signal -install /marc3 { (context /marc3 )(\inst15|LPM_MUX_component|auto_generated|result_node[15]~9_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[14]~11_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[13]~10_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[12]~15_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[11]~6_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[10]~8_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[9]~7_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[8]~14_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[7]~3_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[6]~5_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[5]~4_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[4]~12_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[3]~0_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[2]~2_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[1]~1_combout\ & \inst15|LPM_MUX_component|auto_generated|result_node[0]~13_combout\ )} wb_mux_result
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /marc3/LCD_RS
add wave -noupdate -color Gold /marc3/LCD_E
add wave -noupdate -color Gold /marc3/RESET_LED
add wave -noupdate -color Gold /marc3/LCD_RW
add wave -noupdate -color Gold /marc3/LCD_ON
add wave -noupdate -color Gold -radix hexadecimal /marc3/LCD_DATA_BUS
add wave -noupdate -color Gold /marc3/Reset_Pin
add wave -noupdate -color Gold /marc3/clk
add wave -noupdate -color Gold -radix hexadecimal /marc3/reg_select
add wave -noupdate -expand -group {IF Stage} -label {if/id instr_to_cntl} -radix hexadecimal /marc3/\\inst|instr_to_cntl\\
add wave -noupdate -expand -group {IF Stage} -label {if/id reg PC out} -radix hexadecimal /marc3/\\inst|PC_out\\
add wave -noupdate -expand -group {IF Stage} /marc3/\\inst|srcB_sel\\
add wave -noupdate -expand -group {IF Stage} /marc3/\\inst|srcA_sel\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/pc_sel_out -radix hexadecimal -childformat {{{/marc3/\inst4|pc_sel_out\(1)} -radix hexadecimal} {{/marc3/\inst4|pc_sel_out\(0)} -radix hexadecimal}} -subitemconfig {{/marc3/\inst4|pc_sel_out\(1)} {-height 15 -radix hexadecimal} {/marc3/\inst4|pc_sel_out\(0)} {-height 15 -radix hexadecimal}} /marc3/\\inst4|pc_sel_out\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/alu_op -radix hexadecimal -childformat {{{/marc3/\inst4|alu_op\(3)} -radix hexadecimal} {{/marc3/\inst4|alu_op\(2)} -radix hexadecimal} {{/marc3/\inst4|alu_op\(1)} -radix hexadecimal} {{/marc3/\inst4|alu_op\(0)} -radix hexadecimal}} -subitemconfig {{/marc3/\inst4|alu_op\(3)} {-height 15 -radix hexadecimal} {/marc3/\inst4|alu_op\(2)} {-height 15 -radix hexadecimal} {/marc3/\inst4|alu_op\(1)} {-height 15 -radix hexadecimal} {/marc3/\inst4|alu_op\(0)} {-height 15 -radix hexadecimal}} /marc3/\\inst4|alu_op\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/PC_src -radix hexadecimal /marc3/\\inst4|PC_src\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/offset_out -radix hexadecimal /marc3/\\inst4|offset_out\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/regA_out -radix hexadecimal /marc3/\\inst4|regA_out\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/regB_out -radix hexadecimal /marc3/\\inst4|regB_out\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/cntl_out -radix hexadecimal -childformat {{{/marc3/\inst4|cntl_out\(13)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(12)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(11)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(10)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(9)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(8)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(7)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(6)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(5)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(4)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(3)} -radix hexadecimal} {{/marc3/\inst4|cntl_out\(2)} -radix hexadecimal}} -subitemconfig {{/marc3/\inst4|cntl_out\(13)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(12)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(11)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(10)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(9)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(8)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(7)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(6)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(5)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(4)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(3)} {-height 15 -radix hexadecimal} {/marc3/\inst4|cntl_out\(2)} {-height 15 -radix hexadecimal}} /marc3/\\inst4|cntl_out\\
add wave -noupdate -expand -group {ID Stage} -label id/ex_reg/aluB_sel_out /marc3/\\inst4|aluB_sel_out\\
add wave -noupdate -expand -group {ID Stage} /marc3/\\inst4|aluA_sel_out~q\\
add wave -noupdate -expand -group {EX Stage} -label ex/mem_reg/alu_out -radix hexadecimal /marc3/\\inst1|alu_out\\
add wave -noupdate -expand -group {EX Stage} -label ex/mem/pc_out -radix hexadecimal /marc3/\\inst1|pc_out\\
add wave -noupdate -expand -group {Mem Stage} -label mem/wb_reg/ctrl_out /marc3/\\inst6|ctrl_out\\
add wave -noupdate -expand -group {Mem Stage} -label mem/wb_reg/ram_out -radix hexadecimal /marc3/\\inst6|ram_out\\
add wave -noupdate -expand -group {Mem Stage} -label mem/wb_reg/alu_data_out -radix hexadecimal /marc3/\\inst6|alu_data_out\\
add wave -noupdate -expand -group {Mem Stage} -label mem/wb_reg/dest_reg /marc3/\\inst6|dest_reg\\
add wave -noupdate -expand -group {Mem Stage} -label mem/wb_reg/R_we_out /marc3/\\inst6|R_we_out~q\\
add wave -noupdate -expand -group {WB Stage} -radix hexadecimal /marc3/wb_mux_result
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R1|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R2|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R3|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R4|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R5|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R6|data_out\\
add wave -noupdate -radix hexadecimal /marc3/\\RegisterFile|R7|data_out\\
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2760 ps} 0}
configure wave -namecolwidth 220
configure wave -valuecolwidth 56
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {2083 ps} {3204 ps}
bookmark add wave bookmark0 {{2078 ps} {3199 ps}} 0
bookmark add wave bookmark1 {{2078 ps} {3199 ps}} 0
bookmark add wave bookmark2 {{2078 ps} {3199 ps}} 0
bookmark add wave bookmark3 {{2078 ps} {3199 ps}} 0
bookmark add wave bookmark4 {{2078 ps} {3199 ps}} 0

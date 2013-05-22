onerror {resume}
quietly virtual signal -install /marc3 { (context /marc3 )(\PC|data_out[9]~8_combout\ & \PC|data_out[8]~7_combout\ & \PC|data_out[7]~_wirecell_combout\ & \PC|data_out[6]~6_combout\ & \PC|data_out[5]~5_combout\ & \PC|data_out[4]~4_combout\ & \PC|data_out[3]~3_combout\ & \PC|data_out[2]~2_combout\ & \PC|data_out[1]~1_combout\ & \PC|data_out[0]~0_combout\ )} PC
quietly virtual signal -install /marc3 { (context /marc3 )(\inst5|pc_sel[1]~1_combout\ & \inst5|pc_sel[0]~3_combout\ )} pc_sel
quietly WaveActivateNextPane {} 0
add wave -noupdate /marc3/LCD_RS
add wave -noupdate /marc3/LCD_E
add wave -noupdate /marc3/RESET_LED
add wave -noupdate /marc3/LCD_RW
add wave -noupdate /marc3/LCD_ON
add wave -noupdate -radix hexadecimal /marc3/LCD_DATA_BUS
add wave -noupdate /marc3/Reset_Pin
add wave -noupdate /marc3/clk
add wave -noupdate -radix hexadecimal /marc3/reg_select
add wave -noupdate -radix hexadecimal -childformat {{{/marc3/\inst4|pc_sel_out\(1)} -radix hexadecimal} {{/marc3/\inst4|pc_sel_out\(0)} -radix hexadecimal}} -subitemconfig {{/marc3/\inst4|pc_sel_out\(1)} {-height 15 -radix hexadecimal} {/marc3/\inst4|pc_sel_out\(0)} {-height 15 -radix hexadecimal}} /marc3/\\inst4|pc_sel_out\\
add wave -noupdate -radix hexadecimal /marc3/\\inst|PC_out\\
add wave -noupdate -radix hexadecimal /marc3/\\inst|instr_to_cntl\\
add wave -noupdate /marc3/pc_sel
add wave -noupdate -radix hexadecimal /marc3/PC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1744 ps} 0}
configure wave -namecolwidth 324
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {1050 ps} {1840 ps}

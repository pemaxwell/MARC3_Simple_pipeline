onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /marc3/Reset_Pin
add wave -noupdate /marc3/clk
add wave -noupdate -label PC_in -radix hexadecimal /reg16bit/data_in
add wave -noupdate -label PC_out -radix hexadecimal /reg16bit/data_out
add wave -noupdate -label Instr_mem_out -radix hexadecimal /systemrom/q
add wave -noupdate -radix hexadecimal /if_id_reg/addr_in
add wave -noupdate -radix hexadecimal /if_id_reg/srcA_sel
add wave -noupdate -radix hexadecimal /if_id_reg/srcB_sel
add wave -noupdate -radix hexadecimal /pc_mux/data0x
add wave -noupdate -radix hexadecimal /pc_mux/data1x
add wave -noupdate -radix hexadecimal /pc_mux/data2x
add wave -noupdate -radix hexadecimal /pc_mux/data3x
add wave -noupdate -radix hexadecimal /pc_mux/sel
add wave -noupdate -radix hexadecimal /pc_mux/result
add wave -noupdate -radix hexadecimal /controlunit/pc_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}

## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets <u2/u2/U1/sw[6]_0>]

# Clock signal

set_property PACKAGE_PIN W5 [get_ports clk_placuta]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk_placuta]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_placuta]
# Switches
set_property PACKAGE_PIN V17 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN V16 [get_ports {usa}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {usa}]
set_property PACKAGE_PIN W16 [get_ports {start}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {start}]
set_property PACKAGE_PIN T3 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN T2 [get_ports {sw[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN R3 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W2 [get_ports {sw[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN U1 [get_ports {sw[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN T1 [get_ports {sw[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN R2 [get_ports {sw[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
# LEDs
set_property PACKAGE_PIN V3 [get_ports {led_final}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_final}]
set_property PACKAGE_PIN W3 [get_ports {led_centrifugare}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_centrifugare}]
set_property PACKAGE_PIN U3 [get_ports {led_clatiresup}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_clatiresup}]
set_property PACKAGE_PIN P3 [get_ports {led_clatire}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_clatire}]
set_property PACKAGE_PIN N3 [get_ports {led_spalare}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_spalare}]
set_property PACKAGE_PIN P1 [get_ports {led_prespalare}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_prespalare}]
set_property PACKAGE_PIN L1 [get_ports {led_usa}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_usa}]
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {catod[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[0]}]
set_property PACKAGE_PIN W6 [get_ports {catod[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[1]}]
set_property PACKAGE_PIN U8 [get_ports {catod[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[2]}]
set_property PACKAGE_PIN V8 [get_ports {catod[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[3]}]
set_property PACKAGE_PIN U5 [get_ports {catod[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[4]}]
set_property PACKAGE_PIN V5 [get_ports {catod[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[5]}]
set_property PACKAGE_PIN U7 [get_ports {catod[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[6]}]
	
	
set_property PACKAGE_PIN U2 [get_ports {anod[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[0]}]
set_property PACKAGE_PIN U4 [get_ports {anod[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[1]}]
set_property PACKAGE_PIN V4 [get_ports {anod[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[2]}]
set_property PACKAGE_PIN W4 [get_ports {anod[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[3]}]

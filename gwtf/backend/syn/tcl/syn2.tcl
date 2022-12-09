#*********************************************************
# synthesize script for cell: spi_top_level
# company: ontwerp_practicum
# designer: noakant
#*********************************************************
set_db lib_search_path /data/designkit/tsmc-180nm/lib/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/
set_db init_hdl_search_path ../../../VHDL/
set_db library {tcb018gbwp7twc.lib}
set_db use_scan_seqs_for_non_dft false

#include backend/syn/tcl/read_hdl.tcl
read_hdl -vhdl {driver.vhd}
read_hdl -vhdl {edge_detector.vhd}
read_hdl -vhdl {high_edgedetec.vhd}
read_hdl -vhdl {spc_clockgen.vhd}
read_hdl -vhdl {spi_data_ctrl.vhd}
read_hdl -vhdl {spi_rom.vhd}
read_hdl -vhdl {spi_top_lvl.vhd}
read_hdl -vhdl {driver_SYN.vhd}
read_hdl -vhdl {edgedetector-behaviour.vhd}
read_hdl -vhdl {high_edgedetec-behaviour.vhd}
read_hdl -vhdl {spc_clockgen_SYN.vhd}
read_hdl -vhdl {spi_data_ctrl-behaviour.vhd}
read_hdl -vhdl {spi_rom-behaviour.vhd}
read_hdl -vhdl {spi_data_ctrl_behaviour_cfg.vhd}
read_hdl -vhdl {spi_rom_behaviour_cfg.vhd}
read_hdl -vhdl {high_edgedetec_high_edgedetector_rtl_cfg.vhd}
read_hdl -vhdl {edgedetector_edgedetector_rtl_cfg.vhd}
read_hdl -vhdl {driver_synthesised_cfg.vhd}
read_hdl -vhdl {spc_clockgen_synthesised_cfg.vhd}
read_hdl -vhdl {spi_top_level_structural_cfg.vhd}
#endincl

elaborate spi_top_level_structural_cfg

#include backend/syn/in/spi_top_level.sdc
# We will use a 25 MHz clock, 
# but use 33 MHz as constraint to be more sure it works.
dc::create_clock -name clk -period 30 -waveform {0 15} [dc::get_ports clk]
dc::set_driving_cell -cell INVD0BWP7T [dc::all_inputs]
dc::set_input_delay  .2 -clock clk [dc::all_inputs]
dc::set_output_delay .5 -clock clk [dc::all_outputs]
dc::set_load 1 [dc::all_outputs]
#endincl

synthesize -to_mapped
#set_db syn_generic_effort medium
#syn_generic
#syn_map

ungroup -all -flat
insert_tiehilo_cells
write_hdl -mapped > ../out/spi_top_level.v
write_sdf > ../out/spi_top_level.sdf
write_sdc > ../out/spi_top_level.sdc

report timing
report gates

gui_show



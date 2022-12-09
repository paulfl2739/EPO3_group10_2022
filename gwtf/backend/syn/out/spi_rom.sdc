# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.11-s014_1 on Thu Dec 08 15:53:31 CET 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design spi_rom

set_load -pin_load 1.0 [get_ports {spi_data[15]}]
set_load -pin_load 1.0 [get_ports {spi_data[14]}]
set_load -pin_load 1.0 [get_ports {spi_data[13]}]
set_load -pin_load 1.0 [get_ports {spi_data[12]}]
set_load -pin_load 1.0 [get_ports {spi_data[11]}]
set_load -pin_load 1.0 [get_ports {spi_data[10]}]
set_load -pin_load 1.0 [get_ports {spi_data[9]}]
set_load -pin_load 1.0 [get_ports {spi_data[8]}]
set_load -pin_load 1.0 [get_ports {spi_data[7]}]
set_load -pin_load 1.0 [get_ports {spi_data[6]}]
set_load -pin_load 1.0 [get_ports {spi_data[5]}]
set_load -pin_load 1.0 [get_ports {spi_data[4]}]
set_load -pin_load 1.0 [get_ports {spi_data[3]}]
set_load -pin_load 1.0 [get_ports {spi_data[2]}]
set_load -pin_load 1.0 [get_ports {spi_data[1]}]
set_load -pin_load 1.0 [get_ports {spi_data[0]}]
set_clock_gating_check -setup 0.0 
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {address[2]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {address[1]}]
set_driving_cell -lib_cell INVD0BWP7T -library tcb018gbwp7twc -pin "ZN" [get_ports {address[0]}]
set_wire_load_mode "segmented"
set_wire_load_selection_group "WireAreaForZero" -library "tcb018gbwp7twc"
set_dont_use [get_lib_cells tcb018gbwp7twc/BHDBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAN2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAN2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI21D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI21D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GAOI22D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GBUFFD8BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP10BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAP4BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDCAPBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GDFQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL10BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILL4BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GFILLBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GINVD8BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2ND1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GMUX2ND2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND2D3BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND3D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GND3D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR3D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GNR3D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOAI21D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOAI21D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GOR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GSDFCNQD1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GTIEHBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GTIELBWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXNR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXNR2D2BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXOR2D1BWP7T]
set_dont_use [get_lib_cells tcb018gbwp7twc/GXOR2D2BWP7T]

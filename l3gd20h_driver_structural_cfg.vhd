configuration l3gd20h_driver_structural_cfg of l3gd20h_driver is
   for structural
      for all: spc_clockgen use configuration work.spc_clockgen_behaviour_cfg;
      end for;
      for all: driver use configuration work.driver_behaviour_cfg;
      end for;
      for all: spi_rom use configuration work.spi_rom_behaviour_cfg;
      end for;
      for all: spi_data_ctrl use configuration work.spi_data_ctrl_behaviour_cfg;
      end for;
   end for;
end l3gd20h_driver_structural_cfg;

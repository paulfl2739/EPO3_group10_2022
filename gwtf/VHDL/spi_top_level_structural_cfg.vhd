configuration spi_top_level_structural_cfg of spi_top_level is
   for structural
      for all: spc_clockgen use configuration work.spc_clockgen_synthesised_cfg;
      end for;
      for all: driver use configuration work.driver_synthesised_cfg;
      end for;
      for all: edgedetector use configuration work.edgedetector_edgedetector_rtl_cfg;
      end for;
      for all: high_edgedetec use configuration work.high_edgedetec_high_edgedetector_rtl_cfg;
      end for;
      for all: spi_rom use configuration work.spi_rom_behaviour_cfg;
      end for;
      for all: spi_data_ctrl use configuration work.spi_data_ctrl_behaviour_cfg;
      end for;
   end for;
end spi_top_level_structural_cfg;

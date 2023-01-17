configuration top_vga_entity_structural_cfg of top_vga_entity is
   for structural
      for all: vga_platforms use configuration work.vga_platforms_behaviour_cfg;
      end for;
   end for;
end top_vga_entity_structural_cfg;

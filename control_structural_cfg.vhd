configuration control_structural_cfg of control is
   for structural
      for all: counter use configuration work.counter_behavioral_cfg;
      end for;
      for all: offset_count use configuration work.offset_count_behavioral_cfg;
      end for;
      for all: platform use configuration work.platform_behaviour_cfg;
      end for;
      for all: char_location use configuration work.char_location_behaviour_cfg;
      end for;
   end for;
end control_structural_cfg;

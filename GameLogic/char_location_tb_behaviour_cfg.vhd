configuration char_location_tb_behaviour_cfg of char_location_tb is
   for behaviour
      for all: char_location use configuration work.char_location_behaviour_cfg;
      end for;
   end for;
end char_location_tb_behaviour_cfg;

configuration reset_wrapper_structural_cfg of reset_wrapper is
   for structural
      for all: l3gd20h_driver use configuration work.l3gd20h_driver_structural_cfg;
      end for;
      for all: reset_module use configuration work.reset_module_behavioural_cfg;
      end for;
      for all: clk60hz_gen use configuration work.clk60hz_gen_behaviour_cfg;
      end for;
   end for;
end reset_wrapper_structural_cfg;

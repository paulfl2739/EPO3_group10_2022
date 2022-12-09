# but use 33 MHz as constraint to be more sure it works.
dc::set_driving_cell -cell INVD0BWP7T [dc::all_inputs]
dc::set_load 1 [dc::all_outputs]

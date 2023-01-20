configuration vhsync_tb_behaviour_tb_cfg of vhsync_tb is
   for behaviour_tb
      for all: vhsync use configuration work.vhsync_behaviour_cfg;
      end for;
   end for;
end vhsync_tb_behaviour_tb_cfg;

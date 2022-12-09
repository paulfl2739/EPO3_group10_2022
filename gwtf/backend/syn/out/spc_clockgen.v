
// Generated by Cadence Genus(TM) Synthesis Solution 17.11-s014_1
// Generated on: Dec  8 2022 15:46:33 CET (Dec  8 2022 14:46:33 UTC)

// Verification Directory fv/spc_clockgen 

module spc_clockgen(clk, reset, spc_clk);
  input clk, reset;
  output spc_clk;
  wire clk, reset;
  wire spc_clk;
  wire [4:0] state;
  wire UNCONNECTED, n_0, n_1, n_2, n_3, n_4, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12;
  DFQD1BWP7T \state_reg[4] (.CP (clk), .D (n_11), .Q (state[4]));
  NR2XD0BWP7T g120(.A1 (n_10), .A2 (reset), .ZN (n_11));
  AOI22D0BWP7T g122(.A1 (n_6), .A2 (state[3]), .B1 (n_8), .B2
       (state[4]), .ZN (n_10));
  OAI32D1BWP7T g123(.A1 (state[4]), .A2 (n_8), .A3 (n_2), .B1
       (state[2]), .B2 (n_3), .ZN (n_9));
  CKXOR2D1BWP7T g124(.A1 (n_6), .A2 (state[3]), .Z (n_7));
  OR2D4BWP7T g128(.A1 (n_4), .A2 (state[4]), .Z (spc_clk));
  EDFKCND0BWP7T \state_reg[1] (.CP (clk), .CN (n_12), .D (state[1]), .E
       (state[0]), .Q (UNCONNECTED), .QN (state[1]));
  AOI21D0BWP7T g130(.A1 (n_8), .A2 (state[1]), .B (n_0), .ZN (n_4));
  NR2XD0BWP7T g126(.A1 (n_3), .A2 (n_8), .ZN (n_6));
  INVD0BWP7T g127(.I (n_3), .ZN (n_2));
  IND2D1BWP7T g131(.A1 (state[1]), .B1 (state[0]), .ZN (n_3));
  INVD1BWP7T g135(.I (reset), .ZN (n_12));
  DFKCND1BWP7T \state_reg[0] (.CP (clk), .CN (n_12), .D (n_1), .Q
       (state[0]), .QN (n_1));
  DFKCND1BWP7T \state_reg[3] (.CP (clk), .CN (n_12), .D (n_7), .Q
       (state[3]), .QN (n_0));
  DFKCND1BWP7T \state_reg[2] (.CP (clk), .CN (n_12), .D (n_9), .Q
       (state[2]), .QN (n_8));
endmodule


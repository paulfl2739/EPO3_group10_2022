
// Generated by Cadence Genus(TM) Synthesis Solution 17.11-s014_1
// Generated on: Dec  8 2022 15:51:04 CET (Dec  8 2022 14:51:04 UTC)

// Verification Directory fv/spi_data_ctrl 

module spi_data_ctrl(clk, reset, start_switch, data_ready, drdy,
     enable, sdi_select);
  input clk, reset, start_switch, data_ready, drdy;
  output enable;
  output [2:0] sdi_select;
  wire clk, reset, start_switch, data_ready, drdy;
  wire enable;
  wire [2:0] sdi_select;
  wire [3:0] state;
  wire n_0, n_1, n_3, n_4, n_5, n_6, n_7, n_8;
  wire n_10, n_13, n_14, n_15, n_16, n_17, n_18, n_19;
  wire n_20, n_21, n_22, n_23, n_25, n_26, n_27, n_29;
  wire n_30, n_31, n_37;
  DFCNQD1BWP7T \state_reg[1] (.CDN (n_31), .CP (clk), .D (n_30), .Q
       (state[1]));
  OAI31D0BWP7T g735(.A1 (data_ready), .A2 (n_23), .A3 (n_15), .B
       (n_27), .ZN (n_30));
  AO221D0BWP7T g732(.A1 (n_26), .A2 (n_16), .B1 (n_18), .B2 (n_0), .C
       (n_13), .Z (n_29));
  ND2D4BWP7T g738(.A1 (n_37), .A2 (n_1), .ZN (enable));
  AOI22D0BWP7T g737(.A1 (n_26), .A2 (n_17), .B1 (n_20), .B2 (state[1]),
       .ZN (n_27));
  OAI21D0BWP7T g734(.A1 (n_21), .A2 (n_14), .B (n_19), .ZN (n_25));
  MOAI22D0BWP7T g739(.A1 (n_21), .A2 (state[2]), .B1 (n_21), .B2
       (state[2]), .ZN (n_22));
  IOA21D1BWP7T g741(.A1 (n_19), .A2 (n_23), .B (data_ready), .ZN
       (n_20));
  OAI21D0BWP7T g742(.A1 (state[3]), .A2 (start_switch), .B (n_10), .ZN
       (n_18));
  CKND1BWP7T g747(.I (n_16), .ZN (n_17));
  AOI21D0BWP7T g750(.A1 (n_14), .A2 (start_switch), .B (n_7), .ZN
       (n_15));
  NR4D0BWP7T g736(.A1 (n_5), .A2 (state[0]), .A3 (state[1]), .A4
       (state[2]), .ZN (n_13));
  OR2D4BWP7T g749(.A1 (n_4), .A2 (state[3]), .Z (sdi_select[2]));
  AN2D4BWP7T g744(.A1 (n_3), .A2 (n_6), .Z (sdi_select[0]));
  OAI21D0BWP7T g751(.A1 (state[2]), .A2 (start_switch), .B (n_19), .ZN
       (n_16));
  NR2XD0BWP7T g745(.A1 (n_8), .A2 (state[1]), .ZN (n_26));
  IND2D1BWP7T g746(.A1 (n_8), .B1 (state[1]), .ZN (n_21));
  INVD0BWP7T g754(.I (n_19), .ZN (n_7));
  AOI21D0BWP7T g752(.A1 (n_6), .A2 (state[1]), .B (state[2]), .ZN
       (n_10));
  AOI21D0BWP7T g743(.A1 (data_ready), .A2 (drdy), .B (n_6), .ZN (n_5));
  ND2D1BWP7T g756(.A1 (n_14), .A2 (state[3]), .ZN (n_19));
  NR2XD0BWP7T g757(.A1 (n_14), .A2 (state[1]), .ZN (n_4));
  INVD1BWP7T g753(.I (sdi_select[1]), .ZN (n_3));
  AN2D4BWP7T g755(.A1 (state[1]), .A2 (state[2]), .Z (sdi_select[1]));
  ND2D1BWP7T g758(.A1 (state[0]), .A2 (state[3]), .ZN (n_1));
  ND2D1BWP7T g759(.A1 (state[0]), .A2 (data_ready), .ZN (n_8));
  INVD0BWP7T g762(.I (reset), .ZN (n_31));
  INVD0BWP7T g760(.I (data_ready), .ZN (n_0));
  DFCND1BWP7T \state_reg[3] (.CDN (n_31), .CP (clk), .D (n_25), .Q
       (state[3]), .QN (n_6));
  DFCND1BWP7T \state_reg[0] (.CDN (n_31), .CP (clk), .D (n_29), .Q
       (state[0]), .QN (n_23));
  DFCND1BWP7T \state_reg[2] (.CDN (n_31), .CP (clk), .D (n_22), .Q
       (state[2]), .QN (n_14));
  IND2D1BWP7T g2(.A1 (n_10), .B1 (n_23), .ZN (n_37));
endmodule


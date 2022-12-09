
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of spi_top_level is

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component LHQD1BWP7T
    port(E, D : in std_logic; Q : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI33D1BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFCNQD1BWP7T
    port(CDN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component OR3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  signal lb1_state : std_logic_vector(4 downto 0);
  signal sdi_in : std_logic_vector(15 downto 0);
  signal address : std_logic_vector(2 downto 0);
  signal lb2_new_state : std_logic_vector(4 downto 0);
  signal lb2_state : std_logic_vector(4 downto 0);
  signal lb7_state : std_logic_vector(3 downto 0);
  signal UNCONNECTED, enable, lb1_n_5, lb1_n_13, lb1_n_14 : std_logic;
  signal lb1_n_15, lb1_n_16, lb1_n_17, lb1_n_18, lb1_n_19 : std_logic;
  signal lb1_n_20, lb1_n_21, lb1_n_22, lb1_n_23, lb2_n_15 : std_logic;
  signal lb2_n_39, lb2_n_61, lb2_n_88, lb2_n_91, lb2_n_95 : std_logic;
  signal lb2_n_97, lb2_n_99, lb2_n_101, lb2_n_102, lb2_n_104 : std_logic;
  signal lb2_n_105, lb2_n_107, lb2_n_117, lb2_n_118, lb2_n_120 : std_logic;
  signal lb2_n_121, lb2_n_122, lb2_n_124, lb2_n_125, lb2_n_126 : std_logic;
  signal lb2_n_127, lb2_n_128, lb2_n_129, lb2_n_130, lb2_n_131 : std_logic;
  signal lb2_n_132, lb2_n_133, lb2_n_134, lb2_n_135, lb2_n_136 : std_logic;
  signal lb2_n_137, lb2_n_141, lb2_n_142, lb2_n_144, lb2_n_145 : std_logic;
  signal lb2_n_146, lb2_n_147, lb2_n_148, lb2_n_150, lb2_n_151 : std_logic;
  signal lb2_n_152, lb2_n_153, lb2_n_154, lb2_n_156, lb2_n_167 : std_logic;
  signal lb2_n_171, lb2_n_177, lb2_n_178, lb2_n_179, lb2_n_180 : std_logic;
  signal lb2_n_181, lb2_n_182, lb2_n_185, lb2_n_186, lb2_n_187 : std_logic;
  signal lb2_n_188, lb2_n_189, lb6_n_1, lb6_n_3, lb6_n_4 : std_logic;
  signal lb7_n_0, lb7_n_1, lb7_n_2, lb7_n_3, lb7_n_4 : std_logic;
  signal lb7_n_5, lb7_n_6, lb7_n_7, lb7_n_8, lb7_n_9 : std_logic;
  signal lb7_n_10, lb7_n_11, lb7_n_12, lb7_n_13, lb7_n_14 : std_logic;
  signal lb7_n_15, lb7_n_16, lb7_n_17, lb7_n_18, lb7_n_19 : std_logic;
  signal lb7_n_20, lb7_n_30, spc_clk_out : std_logic;

begin

  lb1_g101 : IND2D1BWP7T port map(A1 => lb1_state(4), B1 => lb1_n_22, ZN => spc_clk_out);
  lb1_g102 : OAI21D0BWP7T port map(A1 => lb1_n_23, A2 => lb1_state(2), B => lb1_state(3), ZN => lb1_n_22);
  lb1_state_reg_4 : DFQD1BWP7T port map(CP => clk, D => lb1_n_21, Q => lb1_state(4));
  lb1_state_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => lb1_n_13, D => lb1_n_18, Q => lb1_state(3));
  lb1_g151 : NR2XD0BWP7T port map(A1 => lb1_n_20, A2 => reset, ZN => lb1_n_21);
  lb1_g153 : AOI22D0BWP7T port map(A1 => lb1_n_17, A2 => lb1_state(3), B1 => lb1_n_5, B2 => lb1_state(4), ZN => lb1_n_20);
  lb1_g154 : OAI32D1BWP7T port map(A1 => lb1_state(4), A2 => lb1_n_5, A3 => lb1_n_16, B1 => lb1_state(2), B2 => lb1_n_14, ZN => lb1_n_19);
  lb1_g155 : CKXOR2D1BWP7T port map(A1 => lb1_n_17, A2 => lb1_state(3), Z => lb1_n_18);
  lb1_state_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => lb1_n_13, D => lb1_n_15, Q => lb1_n_23);
  lb1_g157 : NR2XD0BWP7T port map(A1 => lb1_n_14, A2 => lb1_n_5, ZN => lb1_n_17);
  lb1_g158 : INVD0BWP7T port map(I => lb1_n_14, ZN => lb1_n_16);
  lb1_state_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => lb1_n_13, D => lb1_state(0), Q => UNCONNECTED, QN => lb1_state(0));
  lb1_g160 : MOAI22D0BWP7T port map(A1 => lb1_state(0), A2 => lb1_n_23, B1 => lb1_state(0), B2 => lb1_n_23, ZN => lb1_n_15);
  lb1_g161 : IND2D1BWP7T port map(A1 => lb1_state(0), B1 => lb1_n_23, ZN => lb1_n_14);
  lb1_g168 : INVD1BWP7T port map(I => reset, ZN => lb1_n_13);
  lb1_state_reg_2 : DFKCND1BWP7T port map(CP => clk, CN => lb1_n_13, D => lb1_n_19, Q => lb1_state(2), QN => lb1_n_5);
  lb6_g80 : OR2D0BWP7T port map(A1 => sdi_in(10), A2 => sdi_in(11), Z => sdi_in(8));
  lb6_g81 : OAI22D0BWP7T port map(A1 => lb6_n_4, A2 => address(0), B1 => lb6_n_1, B2 => address(1), ZN => sdi_in(3));
  lb6_g82 : AO21D0BWP7T port map(A1 => sdi_in(11), A2 => lb6_n_1, B => sdi_in(10), Z => sdi_in(15));
  lb6_g83 : IND3D1BWP7T port map(A1 => sdi_in(9), B1 => lb6_n_3, B2 => lb6_n_4, ZN => sdi_in(13));
  lb6_g84 : NR2XD0BWP7T port map(A1 => lb6_n_4, A2 => address(0), ZN => sdi_in(4));
  lb6_g85 : NR2XD0BWP7T port map(A1 => lb6_n_3, A2 => lb6_n_1, ZN => sdi_in(12));
  lb6_g86 : CKAN2D1BWP7T port map(A1 => sdi_in(9), A2 => address(1), Z => sdi_in(10));
  lb6_g87 : NR2XD0BWP7T port map(A1 => lb6_n_1, A2 => address(2), ZN => sdi_in(9));
  lb6_g88 : INVD0BWP7T port map(I => lb6_n_3, ZN => sdi_in(11));
  lb6_g89 : IND2D1BWP7T port map(A1 => address(2), B1 => address(1), ZN => lb6_n_4);
  lb6_g90 : IND2D1BWP7T port map(A1 => address(1), B1 => address(2), ZN => lb6_n_3);
  lb6_g91 : INVD1BWP7T port map(I => address(0), ZN => lb6_n_1);
  lb2_g1099 : OR3D4BWP7T port map(A1 => lb2_n_137, A2 => lb2_n_141, A3 => lb2_n_156, Z => sdi);
  lb2_new_state_reg_2 : LHQD1BWP7T port map(E => lb2_n_167, D => lb2_n_152, Q => lb2_new_state(2));
  lb2_new_state_reg_3 : LHQD1BWP7T port map(E => lb2_n_167, D => lb2_n_154, Q => lb2_new_state(3));
  lb2_new_state_reg_4 : LHQD1BWP7T port map(E => lb2_n_167, D => lb2_n_150, Q => lb2_new_state(4));
  lb2_g1103 : ND3D0BWP7T port map(A1 => lb2_n_151, A2 => lb2_n_132, A3 => lb2_n_144, ZN => lb2_n_156);
  lb2_g1104 : AO211D0BWP7T port map(A1 => lb2_n_146, A2 => spc_clk_out, B => lb2_n_147, C => cs, Z => lb2_n_167);
  lb2_g1105 : AO21D0BWP7T port map(A1 => lb2_n_135, A2 => lb2_state(0), B => lb2_n_153, Z => lb2_n_154);
  lb2_g1106 : OAI31D0BWP7T port map(A1 => lb2_state(0), A2 => lb2_state(4), A3 => lb2_n_121, B => lb2_n_148, ZN => lb2_n_153);
  lb2_g1107 : AO211D0BWP7T port map(A1 => lb2_n_129, A2 => lb2_state(0), B => lb2_n_145, C => lb2_n_133, Z => lb2_n_152);
  lb2_g1108 : AOI22D0BWP7T port map(A1 => lb2_n_142, A2 => lb2_n_122, B1 => sdi_in(8), B2 => lb2_n_177, ZN => lb2_n_151);
  lb2_g1109 : IND3D0BWP7T port map(A1 => lb2_n_180, B1 => lb2_n_126, B2 => lb2_n_134, ZN => lb2_n_150);
  lb2_g1110 : OAI31D0BWP7T port map(A1 => lb2_n_185, A2 => lb2_n_179, A3 => lb2_n_130, B => lb2_state(3), ZN => lb2_n_148);
  lb2_g1111 : INR3D0BWP7T port map(A1 => lb2_n_171, B1 => spc_clk_out, B2 => lb2_n_136, ZN => lb2_n_147);
  lb2_g1112 : INR2D0BWP7T port map(A1 => lb2_n_136, B1 => lb2_n_171, ZN => lb2_n_146);
  lb2_g1113 : AOI31D0BWP7T port map(A1 => lb2_n_178, A2 => lb2_n_126, A3 => lb2_n_187, B => lb2_n_118, ZN => lb2_n_145);
  lb2_g1114 : AOI33D1BWP7T port map(A1 => sdi_in(9), A2 => lb2_n_125, A3 => lb2_n_179, B1 => sdi_in(12), B2 => lb2_state(3), B3 => lb2_state(4), ZN => lb2_n_144);
  lb2_g1115 : MOAI22D0BWP7T port map(A1 => lb2_n_131, A2 => lb2_n_182, B1 => sdi_in(4), B2 => lb2_n_180, ZN => lb2_n_142);
  lb2_g1116 : NR3D0BWP7T port map(A1 => lb2_n_124, A2 => lb2_n_120, A3 => lb2_n_187, ZN => lb2_n_141);
  lb2_g1117 : AN3D1BWP7T port map(A1 => sdi_in(11), A2 => lb2_n_125, A3 => lb2_n_186, Z => lb2_n_137);
  lb2_g1118 : AO21D0BWP7T port map(A1 => lb2_n_186, A2 => lb2_state(4), B => lb2_n_128, Z => lb2_n_135);
  lb2_g1119 : AOI31D0BWP7T port map(A1 => lb2_n_186, A2 => lb2_state(3), A3 => lb2_state(0), B => lb2_n_127, ZN => lb2_n_134);
  lb2_g1120 : AOI211D0BWP7T port map(A1 => lb2_n_122, A2 => lb2_n_117, B => lb2_n_181, C => lb2_state(0), ZN => lb2_n_136);
  lb2_g1121 : NR3D0BWP7T port map(A1 => lb2_n_182, A2 => lb2_state(1), A3 => lb2_state(0), ZN => lb2_n_133);
  lb2_g1123 : OR2D4BWP7T port map(A1 => cs, A2 => spc_clk_out, Z => spc);
  lb2_g1124 : ND3D0BWP7T port map(A1 => sdi_in(3), A2 => lb2_n_180, A3 => lb2_n_185, ZN => lb2_n_132);
  lb2_g1125 : AOI22D0BWP7T port map(A1 => sdi_in(12), A2 => lb2_n_39, B1 => sdi_in(13), B2 => lb2_state(0), ZN => lb2_n_131);
  lb2_g1126 : OAI21D0BWP7T port map(A1 => lb2_n_118, A2 => lb2_state(0), B => lb2_n_126, ZN => lb2_n_130);
  lb2_g1127 : IOA21D0BWP7T port map(A1 => lb2_n_120, A2 => lb2_n_185, B => lb2_n_121, ZN => lb2_n_129);
  lb2_g1128 : MOAI22D0BWP7T port map(A1 => lb2_n_182, A2 => lb2_state(2), B1 => lb2_n_185, B2 => lb2_n_117, ZN => lb2_n_128);
  lb2_g1129 : NR3D0BWP7T port map(A1 => lb2_n_120, A2 => lb2_n_121, A3 => lb2_state(0), ZN => lb2_n_177);
  lb2_g1130 : NR2D0BWP7T port map(A1 => lb2_n_122, A2 => lb2_n_117, ZN => lb2_n_127);
  lb2_g1131 : AN2D4BWP7T port map(A1 => lb2_n_181, A2 => lb2_n_122, Z => cs);
  lb2_g1132 : ND2D1BWP7T port map(A1 => lb2_state(1), A2 => lb2_n_39, ZN => lb2_n_187);
  lb2_g1133 : INVD0BWP7T port map(I => lb2_n_125, ZN => lb2_n_178);
  lb2_g1134 : AOI22D0BWP7T port map(A1 => sdi_in(15), A2 => lb2_n_118, B1 => sdi_in(10), B2 => lb2_state(2), ZN => lb2_n_124);
  lb2_g1135 : ND2D0BWP7T port map(A1 => lb2_state(4), A2 => lb2_n_39, ZN => lb2_n_126);
  lb2_g1136 : NR2XD0BWP7T port map(A1 => lb2_n_120, A2 => lb2_n_39, ZN => lb2_n_125);
  lb2_prev_spc_clk_reg : DFCNQD1BWP7T port map(CDN => lb2_n_15, CP => clk, D => spc_clk_out, Q => lb2_n_171);
  lb2_g1140 : NR2XD0BWP7T port map(A1 => lb2_n_117, A2 => lb2_state(3), ZN => lb2_n_180);
  lb2_g1141 : CKAN2D1BWP7T port map(A1 => lb2_state(2), A2 => lb2_state(1), Z => lb2_n_186);
  lb2_g1143 : INVD1BWP7T port map(I => lb2_n_179, ZN => lb2_n_121);
  lb2_g1144 : INVD1BWP7T port map(I => lb2_n_181, ZN => lb2_n_120);
  lb2_g1145 : NR2XD0BWP7T port map(A1 => lb2_state(2), A2 => lb2_state(1), ZN => lb2_n_122);
  lb2_g1146 : ND2D1BWP7T port map(A1 => lb2_n_117, A2 => lb2_state(3), ZN => lb2_n_182);
  lb2_g1147 : INR2XD0BWP7T port map(A1 => lb2_state(1), B1 => lb2_state(2), ZN => lb2_n_185);
  lb2_g1148 : NR2XD0BWP7T port map(A1 => lb2_n_118, A2 => lb2_state(1), ZN => lb2_n_179);
  lb2_g1149 : NR2XD0BWP7T port map(A1 => lb2_state(3), A2 => lb2_state(4), ZN => lb2_n_181);
  lb2_g1150 : INVD0BWP7T port map(I => reset, ZN => lb2_n_15);
  lb2_new_state_reg_0 : LHQD1BWP7T port map(E => lb2_n_167, D => lb2_n_107, Q => lb2_new_state(0));
  lb2_new_state_reg_1 : LHQD1BWP7T port map(E => lb2_n_167, D => lb2_n_105, Q => lb2_new_state(1));
  lb2_g754 : ND2D0BWP7T port map(A1 => lb2_n_104, A2 => lb2_n_187, ZN => lb2_n_107);
  lb2_g755 : ND4D0BWP7T port map(A1 => lb2_n_99, A2 => lb2_n_102, A3 => lb2_n_61, A4 => lb2_n_189, ZN => lb2_n_105);
  lb2_g756 : AOI211D0BWP7T port map(A1 => lb2_n_181, A2 => lb2_n_185, B => lb2_n_101, C => lb2_n_188, ZN => lb2_n_104);
  lb2_g757 : IAO21D0BWP7T port map(A1 => lb2_n_88, A2 => lb2_n_182, B => lb2_n_177, ZN => lb2_n_102);
  lb2_g758 : INR3D0BWP7T port map(A1 => lb2_n_95, B1 => lb2_state(2), B2 => lb2_n_178, ZN => lb2_n_101);
  lb2_g759 : AOI22D0BWP7T port map(A1 => lb2_n_97, A2 => cs, B1 => lb2_n_91, B2 => lb2_n_180, ZN => lb2_n_99);
  lb2_g760 : CKND1BWP7T port map(I => lb2_n_95, ZN => lb2_n_97);
  lb2_g761 : OAI21D0BWP7T port map(A1 => lb2_state(1), A2 => lb2_n_39, B => lb2_n_187, ZN => lb2_n_91);
  lb2_g762 : IND3D0BWP7T port map(A1 => spc_clk_out, B1 => lb2_n_171, B2 => enable, ZN => lb2_n_95);
  lb2_g764 : MAOI22D0BWP7T port map(A1 => lb2_n_179, A2 => lb2_state(0), B1 => lb2_n_179, B2 => lb2_state(0), ZN => lb2_n_88);
  lb2_state_reg_3 : DFCNQD1BWP7T port map(CDN => lb2_n_15, CP => clk, D => lb2_new_state(3), Q => lb2_state(3));
  lb2_state_reg_1 : DFCNQD1BWP7T port map(CDN => lb2_n_15, CP => clk, D => lb2_new_state(1), Q => lb2_state(1));
  lb2_g769 : IND2D0BWP7T port map(A1 => lb2_n_178, B1 => lb2_n_186, ZN => lb2_n_61);
  lb2_state_reg_0 : DFCND1BWP7T port map(CDN => lb2_n_15, CP => clk, D => lb2_new_state(0), Q => lb2_state(0), QN => lb2_n_39);
  lb2_state_reg_2 : DFCND1BWP7T port map(CDN => lb2_n_15, CP => clk, D => lb2_new_state(2), Q => lb2_state(2), QN => lb2_n_118);
  lb2_state_reg_4 : DFCND1BWP7T port map(CDN => lb2_n_15, CP => clk, D => lb2_new_state(4), Q => lb2_state(4), QN => lb2_n_117);
  lb2_g2 : MOAI22D0BWP7T port map(A1 => lb2_n_181, A2 => lb2_state(0), B1 => lb2_state(4), B2 => lb2_state(3), ZN => lb2_n_188);
  lb2_g1159 : OR3D1BWP7T port map(A1 => lb2_state(4), A2 => lb2_n_187, A3 => lb2_state(2), Z => lb2_n_189);
  lb7_g457 : MOAI22D0BWP7T port map(A1 => lb7_n_20, A2 => lb7_state(0), B1 => lb7_state(3), B2 => lb7_state(0), ZN => enable);
  lb7_g458 : OR2D1BWP7T port map(A1 => lb7_n_30, A2 => lb7_state(3), Z => address(2));
  lb7_g459 : NR2XD0BWP7T port map(A1 => address(1), A2 => lb7_state(3), ZN => address(0));
  lb7_g460 : AOI21D0BWP7T port map(A1 => lb7_n_19, A2 => lb7_state(1), B => lb7_state(2), ZN => lb7_n_20);
  lb7_g461 : AN2D1BWP7T port map(A1 => lb7_state(2), A2 => lb7_state(1), Z => address(1));
  lb7_g462 : INR2D1BWP7T port map(A1 => lb7_state(2), B1 => lb7_state(1), ZN => lb7_n_30);
  lb7_g837 : MOAI22D0BWP7T port map(A1 => lb7_n_17, A2 => lb7_n_1, B1 => lb7_n_10, B2 => lb7_state(1), ZN => lb7_n_18);
  lb7_state_reg_2 : DFCNQD1BWP7T port map(CDN => lb7_n_2, CP => clk, D => lb7_n_12, Q => lb7_state(2));
  lb7_g841 : AOI31D0BWP7T port map(A1 => cs, A2 => lb7_n_0, A3 => lb7_state(2), B => lb7_n_13, ZN => lb7_n_17);
  lb7_g842 : OAI211D1BWP7T port map(A1 => lb7_n_6, A2 => cs, B => lb7_n_14, C => lb7_n_11, ZN => lb7_n_16);
  lb7_g843 : AOI21D0BWP7T port map(A1 => lb7_n_8, A2 => lb7_n_3, B => lb7_n_30, ZN => lb7_n_15);
  lb7_g844 : AO211D0BWP7T port map(A1 => lb7_n_4, A2 => lb7_n_5, B => lb7_n_3, C => lb7_state(1), Z => lb7_n_14);
  lb7_g845 : MOAI22D0BWP7T port map(A1 => cs, A2 => lb7_n_3, B1 => lb7_n_7, B2 => start_switch, ZN => lb7_n_13);
  lb7_g846 : MOAI22D0BWP7T port map(A1 => lb7_n_9, A2 => lb7_state(2), B1 => lb7_n_9, B2 => lb7_state(2), ZN => lb7_n_12);
  lb7_g847 : IOA21D1BWP7T port map(A1 => lb7_state(0), A2 => start_switch, B => lb7_n_7, ZN => lb7_n_11);
  lb7_g848 : IOA21D0BWP7T port map(A1 => lb7_n_3, A2 => lb7_n_1, B => cs, ZN => lb7_n_10);
  lb7_g849 : IND2D1BWP7T port map(A1 => lb7_n_4, B1 => lb7_state(2), ZN => lb7_n_8);
  lb7_g850 : OR2D1BWP7T port map(A1 => lb7_n_4, A2 => lb7_n_0, Z => lb7_n_9);
  lb7_g851 : IAO21D0BWP7T port map(A1 => lb7_n_0, A2 => lb7_state(3), B => lb7_state(2), ZN => lb7_n_6);
  lb7_g852 : NR3D0BWP7T port map(A1 => lb7_state(3), A2 => lb7_state(1), A3 => lb7_state(2), ZN => lb7_n_7);
  lb7_g853 : ND2D0BWP7T port map(A1 => cs, A2 => drdy, ZN => lb7_n_5);
  lb7_g854 : ND2D1BWP7T port map(A1 => cs, A2 => lb7_state(0), ZN => lb7_n_4);
  lb7_g855 : IND2D1BWP7T port map(A1 => lb7_state(2), B1 => lb7_state(3), ZN => lb7_n_3);
  lb7_g856 : INVD0BWP7T port map(I => reset, ZN => lb7_n_2);
  lb7_state_reg_3 : DFCND1BWP7T port map(CDN => lb7_n_2, CP => clk, D => lb7_n_15, Q => lb7_state(3), QN => lb7_n_19);
  lb7_state_reg_0 : DFCND1BWP7T port map(CDN => lb7_n_2, CP => clk, D => lb7_n_16, Q => lb7_state(0), QN => lb7_n_1);
  lb7_state_reg_1 : DFCND1BWP7T port map(CDN => lb7_n_2, CP => clk, D => lb7_n_18, Q => lb7_state(1), QN => lb7_n_0);

end synthesised;

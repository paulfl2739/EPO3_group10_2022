
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture routed of driver is

  component BUFFD5BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component BUFFD10BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD6BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component LHQD1BWP7T
    port(D, E : in std_logic; Q : out std_logic);
  end component;

  component OR3XD1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component INVD5BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFCNQD1BWP7T
    port(CDN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component LND1BWP7T
    port(D, EN : in std_logic; Q, QN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component LHD1BWP7T
    port(D, E : in std_logic; Q, QN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFCND0BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal FE_OFN2_spc, FE_OFN1_sdi, FE_OFN0_cs, CTS_6 : std_logic;
  signal new_state : std_logic_vector(4 downto 0);
  signal new_count : std_logic_vector(2 downto 0);
  signal state : std_logic_vector(4 downto 0);
  signal count : std_logic_vector(2 downto 0);
  signal UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2, UNCONNECTED3 : std_logic;
  signal UNCONNECTED4, UNCONNECTED5, UNCONNECTED6, UNCONNECTED7, n_0 : std_logic;
  signal n_1, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_9, n_10 : std_logic;
  signal n_11, n_12, n_13, n_14, n_16 : std_logic;
  signal n_17, n_18, n_19, n_20, n_21 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_29, n_30, n_31 : std_logic;
  signal n_32, n_33, n_34, n_35, n_36 : std_logic;
  signal n_37, n_38, n_40, n_41, n_42 : std_logic;
  signal n_43, n_44, n_45, n_46, n_47 : std_logic;
  signal n_48, n_49, n_50, n_51, n_52 : std_logic;
  signal n_53, n_54, n_55, n_56, n_57 : std_logic;
  signal n_58, n_59, n_60, n_62, n_63 : std_logic;
  signal n_64, n_65, n_66, n_67, n_68 : std_logic;
  signal n_69, n_70, n_71, n_72, n_73 : std_logic;
  signal n_74, n_75, n_76, n_77, n_78 : std_logic;
  signal n_79, n_80, n_81, n_82, n_83 : std_logic;
  signal n_84, n_85, n_87, n_89, n_92 : std_logic;
  signal n_93, n_94, n_96, n_98, n_100 : std_logic;
  signal n_103, n_106, n_108, n_109, n_110 : std_logic;
  signal n_111, n_112, n_113, n_114, n_115 : std_logic;
  signal n_116, n_138, n_139, n_140, n_143 : std_logic;
  signal n_149, n_155 : std_logic;

begin

  data_ready <= cs;
  FE_OFC2_spc : BUFFD5BWP7T port map(I => FE_OFN2_spc, Z => spc);
  FE_OFC1_sdi : BUFFD5BWP7T port map(I => FE_OFN1_sdi, Z => sdi);
  FE_OFC0_cs : BUFFD10BWP7T port map(I => FE_OFN0_cs, Z => cs);
  CTS_ccl_a_BUF_clk_G0_L1_1 : CKBD6BWP7T port map(I => clk, Z => CTS_6);
  new_state_reg_1 : LHQD1BWP7T port map(D => n_100, E => n_103, Q => new_state(1));
  g2866 : OR3XD1BWP7T port map(A1 => n_53, A2 => n_65, A3 => n_98, Z => FE_OFN1_sdi);
  new_count_reg_2 : LHQD1BWP7T port map(D => n_138, E => cs, Q => new_count(2));
  g2891 : INVD5BWP7T port map(I => n_114, ZN => gyro_data(5));
  new_state_reg_0 : LHQD1BWP7T port map(D => n_93, E => n_103, Q => new_state(0));
  state_reg_3 : DFCNQD1BWP7T port map(CDN => n_106, CP => CTS_6, D => new_state(3), Q => state(3));
  g2895 : INVD5BWP7T port map(I => n_112, ZN => gyro_data(3));
  g2907 : INVD5BWP7T port map(I => n_110, ZN => gyro_data(0));
  g2888 : OAI221D0BWP7T port map(A1 => n_69, A2 => n_60, B1 => n_42, B2 => n_64, C => n_94, ZN => n_100);
  g2893 : INVD5BWP7T port map(I => n_113, ZN => gyro_data(1));
  new_state_reg_2 : LHQD1BWP7T port map(D => n_87, E => n_103, Q => new_state(2));
  gyro_data_reg_5 : LND1BWP7T port map(D => n_27, EN => n_82, Q => UNCONNECTED, QN => n_114);
  gyro_data_reg_3 : LND1BWP7T port map(D => n_18, EN => n_84, Q => UNCONNECTED0, QN => n_112);
  new_count_reg_1 : LHQD1BWP7T port map(D => n_139, E => cs, Q => new_count(1));
  g2879 : OAI211D1BWP7T port map(A1 => n_0, A2 => n_92, B => n_63, C => n_80, ZN => n_98);
  g2905 : INVD5BWP7T port map(I => n_111, ZN => gyro_data(2));
  gyro_data_reg_0 : LND1BWP7T port map(D => n_10, EN => n_89, Q => UNCONNECTED1, QN => n_110);
  gyro_data_reg_1 : LHD1BWP7T port map(D => n_28, E => n_77, Q => UNCONNECTED2, QN => n_113);
  new_state_reg_3 : LHQD1BWP7T port map(D => n_79, E => n_103, Q => new_state(3));
  g2901 : AOI221D0BWP7T port map(A1 => n_34, A2 => n_52, B1 => n_5, B2 => n_49, C => n_68, ZN => n_94);
  g2884 : IND4D0BWP7T port map(A1 => n_62, B1 => n_92, B2 => n_7, B3 => n_6, ZN => n_93);
  g2883 : INVD5BWP7T port map(I => n_115, ZN => gyro_data(6));
  g2881 : INVD5BWP7T port map(I => n_116, ZN => gyro_data(7));
  gyro_data_reg_2 : LHD1BWP7T port map(D => n_23, E => n_78, Q => UNCONNECTED3, QN => n_111);
  new_state_reg_4 : LHQD1BWP7T port map(D => n_50, E => n_103, Q => new_state(4));
  g2930 : AOI21D0BWP7T port map(A1 => n_45, A2 => state(3), B => n_83, ZN => n_89);
  g2920 : INVD5BWP7T port map(I => n_109, ZN => gyro_data(4));
  g2900 : AO211D0BWP7T port map(A1 => n_20, A2 => state(0), B => n_59, C => n_81, Z => n_87);
  gyro_data_reg_6 : LND1BWP7T port map(D => n_54, EN => n_73, Q => UNCONNECTED4, QN => n_115);
  gyro_data_reg_7 : LND1BWP7T port map(D => n_30, EN => n_75, Q => UNCONNECTED5, QN => n_116);
  g2914 : AOI21D0BWP7T port map(A1 => n_74, A2 => state(4), B => n_83, ZN => n_84);
  g2915 : AOI21D0BWP7T port map(A1 => n_81, A2 => state(3), B => n_83, ZN => n_82);
  gyro_data_reg_4 : LND1BWP7T port map(D => n_25, EN => n_56, Q => UNCONNECTED6, QN => n_109);
  new_count_reg_0 : LHQD1BWP7T port map(D => n_140, E => cs, Q => new_count(0));
  g2897 : IND2D0BWP7T port map(A1 => n_85, B1 => cycle(1), ZN => n_96);
  g2903 : MAOI22D0BWP7T port map(A1 => n_66, A2 => sdi_in(8), B1 => n_35, B2 => n_3, ZN => n_80);
  g2902 : AO221D0BWP7T port map(A1 => n_72, A2 => n_67, B1 => n_43, B2 => state(0), C => n_58, Z => n_79);
  g2931 : OAI21D0BWP7T port map(A1 => n_48, A2 => n_21, B => n_76, ZN => n_78);
  g2916 : IOA21D0BWP7T port map(A1 => n_81, A2 => state(4), B => n_76, ZN => n_77);
  g2899 : AOI221D0BWP7T port map(A1 => n_74, A2 => state(3), B1 => n_71, B2 => n_16, C => n_70, ZN => n_75);
  g2898 : AOI221D0BWP7T port map(A1 => n_72, A2 => state(3), B1 => n_71, B2 => n_1, C => n_70, ZN => n_73);
  g2933 : INVD0BWP7T port map(I => n_76, ZN => n_83);
  g2889 : OAI211D0BWP7T port map(A1 => spc_clk, A2 => n_32, B => n_40, C => n_69, ZN => n_103);
  g2911 : AO21D0BWP7T port map(A1 => n_74, A2 => n_67, B => n_66, Z => n_68);
  g2886 : OAI22D0BWP7T port map(A1 => n_38, A2 => n_36, B1 => n_14, B2 => n_64, ZN => n_65);
  g2908 : AOI31D0BWP7T port map(A1 => n_44, A2 => n_57, A3 => sdi_in(9), B => n_51, ZN => n_63);
  g2917 : OAI32D0BWP7T port map(A1 => n_55, A2 => state(2), A3 => n_64, B1 => state(0), B2 => n_47, ZN => n_62);
  g2927 : OAI31D0BWP7T port map(A1 => state(1), A2 => state(0), A3 => n_41, B => n_46, ZN => n_59);
  g2929 : OA21D0BWP7T port map(A1 => n_17, A2 => n_57, B => state(3), Z => n_58);
  g2941 : AOI21D0BWP7T port map(A1 => n_24, A2 => n_33, B => n_70, ZN => n_56);
  g2937 : AOI21D0BWP7T port map(A1 => n_71, A2 => n_37, B => n_70, ZN => n_76);
  g2936 : ND2D0BWP7T port map(A1 => cycle(0), A2 => n_55, ZN => n_85);
  g2921 : INR2D0BWP7T port map(A1 => n_72, B1 => n_29, ZN => n_54);
  g2924 : INR2XD0BWP7T port map(A1 => n_52, B1 => n_26, ZN => n_53);
  g2928 : AOI21D0BWP7T port map(A1 => n_8, A2 => n_9, B => n_2, ZN => n_51);
  g2909 : IND3D0BWP7T port map(A1 => n_49, B1 => n_48, B2 => n_11, ZN => n_50);
  g2932 : CKAN2D1BWP7T port map(A1 => n_72, A2 => n_47, Z => n_66);
  g2935 : OAI21D0BWP7T port map(A1 => n_45, A2 => n_44, B => state(2), ZN => n_46);
  g2943 : OAI222D0BWP7T port map(A1 => n_42, A2 => n_67, B1 => state(2), B2 => n_41, C1 => state(4), C2 => n_19, ZN => n_43);
  g2945 : INVD0BWP7T port map(I => n_60, ZN => n_55);
  g2910 : IND3D0BWP7T port map(A1 => prev_spc_clk, B1 => spc_clk, B2 => n_31, ZN => n_40);
  g2912 : AOI22D0BWP7T port map(A1 => n_74, A2 => sdi_in(15), B1 => n_81, B2 => sdi_in(10), ZN => n_38);
  g2955 : OAI21D0BWP7T port map(A1 => n_37, A2 => n_36, B => n_35, ZN => n_70);
  g2934 : HA1D0BWP7T port map(A => n_33, B => n_57, CO => n_72, S => n_34);
  g2923 : IND2D0BWP7T port map(A1 => n_31, B1 => prev_spc_clk, ZN => n_32);
  g2922 : INR2D0BWP7T port map(A1 => n_74, B1 => n_29, ZN => n_30);
  g2918 : AN3D0BWP7T port map(A1 => n_81, A2 => state(4), A3 => sdo, Z => n_28);
  g2925 : INR2D0BWP7T port map(A1 => n_81, B1 => n_29, ZN => n_27);
  g2940 : AOI222D0BWP7T port map(A1 => n_57, A2 => sdi_in(6), B1 => n_13, B2 => sdi_in(7), C1 => n_12, C2 => sdi_in(5), ZN => n_26);
  g2946 : INR2D0BWP7T port map(A1 => n_24, B1 => n_22, ZN => n_25);
  g2947 : NR2D0BWP7T port map(A1 => n_22, A2 => n_21, ZN => n_23);
  g2949 : OAI21D0BWP7T port map(A1 => n_19, A2 => n_47, B => n_21, ZN => n_20);
  g2913 : AN3D0BWP7T port map(A1 => n_74, A2 => state(4), A3 => sdo, Z => n_18);
  g2952 : OAI211D0BWP7T port map(A1 => n_16, A2 => state(0), B => n_48, C => n_19, ZN => n_17);
  g2950 : IND3D0BWP7T port map(A1 => spc_clk, B1 => enable, B2 => prev_spc_clk, ZN => n_60);
  g2948 : OR2D1BWP7T port map(A1 => cs, A2 => spc_clk, Z => FE_OFN2_spc);
  g2953 : AOI22D0BWP7T port map(A1 => n_13, A2 => sdi_in(14), B1 => n_12, B2 => sdi_in(11), ZN => n_14);
  g2942 : AOI32D0BWP7T port map(A1 => n_12, A2 => state(0), A3 => state(3), B1 => n_4, B2 => state(4), ZN => n_11);
  g2957 : NR2D0BWP7T port map(A1 => n_48, A2 => n_29, ZN => n_10);
  g2954 : AOI22D0BWP7T port map(A1 => n_37, A2 => sdi_in(4), B1 => n_13, B2 => sdi_in(3), ZN => n_9);
  g2951 : AOI22D0BWP7T port map(A1 => n_57, A2 => sdi_in(2), B1 => n_12, B2 => sdi_in(1), ZN => n_8);
  g2965 : ND2D1BWP7T port map(A1 => n_37, A2 => n_52, ZN => n_35);
  g2958 : ND2D0BWP7T port map(A1 => n_45, A2 => sdo, ZN => n_22);
  g2944 : AOI211D0BWP7T port map(A1 => n_37, A2 => n_67, B => n_47, C => state(0), ZN => n_31);
  g2939 : NR2XD0BWP7T port map(A1 => n_7, A2 => n_16, ZN => n_81);
  g2938 : NR2XD0BWP7T port map(A1 => n_7, A2 => state(2), ZN => n_74);
  g2962 : ND2D0BWP7T port map(A1 => n_13, A2 => n_47, ZN => n_6);
  g2964 : OAI21D0BWP7T port map(A1 => n_33, A2 => state(1), B => n_7, ZN => n_5);
  g2956 : INVD0BWP7T port map(I => n_64, ZN => n_44);
  g2961 : INVD0BWP7T port map(I => cs, ZN => n_69);
  g2959 : NR2D0BWP7T port map(A1 => n_4, A2 => state(3), ZN => n_24);
  g2963 : AOI22D0BWP7T port map(A1 => n_33, A2 => sdi_in(12), B1 => state(0), B2 => sdi_in(13), ZN => n_3);
  g2967 : INVD0BWP7T port map(I => n_12, ZN => n_42);
  g2979 : CKND0BWP7T port map(I => n_41, ZN => n_52);
  g2970 : INVD0BWP7T port map(I => n_57, ZN => n_21);
  g2966 : CKAN2D1BWP7T port map(A1 => n_37, A2 => n_47, Z => FE_OFN0_cs);
  g2978 : INVD0BWP7T port map(I => n_49, ZN => n_2);
  g2980 : INVD0BWP7T port map(I => n_13, ZN => n_19);
  g2981 : INVD0BWP7T port map(I => n_45, ZN => n_48);
  g2960 : ND2D1BWP7T port map(A1 => n_47, A2 => state(0), ZN => n_64);
  g2972 : INVD5BWP7T port map(I => n_108, ZN => prev_spc_clk);
  prev_spc_clk_reg : DFCND1BWP7T port map(CDN => n_106, CP => CTS_6, D => spc_clk, Q => UNCONNECTED7, QN => n_108);
  g2969 : INVD0BWP7T port map(I => n_47, ZN => n_36);
  g2986 : ND2D1BWP7T port map(A1 => n_67, A2 => state(3), ZN => n_41);
  g2973 : ND2D1BWP7T port map(A1 => n_33, A2 => state(1), ZN => n_7);
  g2977 : NR2XD0BWP7T port map(A1 => n_16, A2 => state(1), ZN => n_57);
  g2968 : INVD0BWP7T port map(I => n_37, ZN => n_4);
  g2984 : NR2XD0BWP7T port map(A1 => n_67, A2 => state(3), ZN => n_49);
  g2988 : NR2D0BWP7T port map(A1 => state(0), A2 => n_67, ZN => n_45);
  g2987 : NR2XD0BWP7T port map(A1 => n_1, A2 => state(2), ZN => n_13);
  g2974 : NR2XD0BWP7T port map(A1 => n_16, A2 => n_1, ZN => n_12);
  g2975 : NR2XD0BWP7T port map(A1 => state(2), A2 => state(1), ZN => n_37);
  g2976 : NR2XD0BWP7T port map(A1 => state(4), A2 => state(3), ZN => n_47);
  g2982 : ND2D1BWP7T port map(A1 => state(4), A2 => state(3), ZN => n_92);
  g2983 : NR2D0BWP7T port map(A1 => state(0), A2 => state(4), ZN => n_71);
  g2985 : ND2D0BWP7T port map(A1 => state(3), A2 => sdo, ZN => n_29);
  g2989 : INVD0BWP7T port map(I => sdi_in(0), ZN => n_0);
  g2990 : INVD0BWP7T port map(I => reset, ZN => n_106);
  g2 : XNR2D1BWP7T port map(A1 => n_96, A2 => count(2), ZN => n_138);
  g3020 : XNR2D1BWP7T port map(A1 => n_85, A2 => count(1), ZN => n_139);
  g3021 : XNR2D1BWP7T port map(A1 => count(0), A2 => n_60, ZN => n_140);
  drc_bufs3022 : INVD5BWP7T port map(I => n_143, ZN => cycle(0));
  drc_bufs3028 : INVD5BWP7T port map(I => n_149, ZN => cycle(1));
  drc_bufs3034 : INVD5BWP7T port map(I => n_155, ZN => cycle(2));
  state_reg_0 : DFCND1BWP7T port map(CDN => n_106, CP => CTS_6, D => new_state(0), Q => state(0), QN => n_33);
  state_reg_4 : DFCND1BWP7T port map(CDN => n_106, CP => CTS_6, D => new_state(4), Q => state(4), QN => n_67);
  state_reg_1 : DFCND1BWP7T port map(CDN => n_106, CP => CTS_6, D => new_state(1), Q => state(1), QN => n_1);
  state_reg_2 : DFCND1BWP7T port map(CDN => n_106, CP => CTS_6, D => new_state(2), Q => state(2), QN => n_16);
  count_reg_0 : DFCND0BWP7T port map(CDN => n_106, CP => CTS_6, D => new_count(0), Q => count(0), QN => n_143);
  count_reg_1 : DFCND0BWP7T port map(CDN => n_106, CP => CTS_6, D => new_count(1), Q => count(1), QN => n_149);
  count_reg_2 : DFCND0BWP7T port map(CDN => n_106, CP => CTS_6, D => new_count(2), Q => count(2), QN => n_155);

end routed;

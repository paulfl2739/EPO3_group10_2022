
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of spi_data_ctrl is

  component DFCNQD1BWP7T
    port(CDN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(3 downto 0);
  signal n_0, n_1, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_10, n_13 : std_logic;
  signal n_14, n_15, n_16, n_17, n_18 : std_logic;
  signal n_19, n_20, n_21, n_22, n_23 : std_logic;
  signal n_25, n_26, n_27, n_29, n_30 : std_logic;
  signal n_31, n_37 : std_logic;

begin

  state_reg_1 : DFCNQD1BWP7T port map(CDN => n_31, CP => clk, D => n_30, Q => state(1));
  g735 : OAI31D0BWP7T port map(A1 => data_ready, A2 => n_23, A3 => n_15, B => n_27, ZN => n_30);
  g732 : AO221D0BWP7T port map(A1 => n_26, A2 => n_16, B1 => n_18, B2 => n_0, C => n_13, Z => n_29);
  g738 : ND2D4BWP7T port map(A1 => n_37, A2 => n_1, ZN => enable);
  g737 : AOI22D0BWP7T port map(A1 => n_26, A2 => n_17, B1 => n_20, B2 => state(1), ZN => n_27);
  g734 : OAI21D0BWP7T port map(A1 => n_21, A2 => n_14, B => n_19, ZN => n_25);
  g739 : MOAI22D0BWP7T port map(A1 => n_21, A2 => state(2), B1 => n_21, B2 => state(2), ZN => n_22);
  g741 : IOA21D1BWP7T port map(A1 => n_19, A2 => n_23, B => data_ready, ZN => n_20);
  g742 : OAI21D0BWP7T port map(A1 => state(3), A2 => start_switch, B => n_10, ZN => n_18);
  g747 : CKND1BWP7T port map(I => n_16, ZN => n_17);
  g750 : AOI21D0BWP7T port map(A1 => n_14, A2 => start_switch, B => n_7, ZN => n_15);
  g736 : NR4D0BWP7T port map(A1 => n_5, A2 => state(0), A3 => state(1), A4 => state(2), ZN => n_13);
  g749 : OR2D4BWP7T port map(A1 => n_4, A2 => state(3), Z => sdi_select(2));
  g744 : AN2D4BWP7T port map(A1 => n_3, A2 => n_6, Z => sdi_select(0));
  g751 : OAI21D0BWP7T port map(A1 => state(2), A2 => start_switch, B => n_19, ZN => n_16);
  g745 : NR2XD0BWP7T port map(A1 => n_8, A2 => state(1), ZN => n_26);
  g746 : IND2D1BWP7T port map(A1 => n_8, B1 => state(1), ZN => n_21);
  g754 : INVD0BWP7T port map(I => n_19, ZN => n_7);
  g752 : AOI21D0BWP7T port map(A1 => n_6, A2 => state(1), B => state(2), ZN => n_10);
  g743 : AOI21D0BWP7T port map(A1 => data_ready, A2 => drdy, B => n_6, ZN => n_5);
  g756 : ND2D1BWP7T port map(A1 => n_14, A2 => state(3), ZN => n_19);
  g757 : NR2XD0BWP7T port map(A1 => n_14, A2 => state(1), ZN => n_4);
  g753 : INVD1BWP7T port map(I => sdi_select(1), ZN => n_3);
  g755 : AN2D4BWP7T port map(A1 => state(1), A2 => state(2), Z => sdi_select(1));
  g758 : ND2D1BWP7T port map(A1 => state(0), A2 => state(3), ZN => n_1);
  g759 : ND2D1BWP7T port map(A1 => state(0), A2 => data_ready, ZN => n_8);
  g762 : INVD0BWP7T port map(I => reset, ZN => n_31);
  g760 : INVD0BWP7T port map(I => data_ready, ZN => n_0);
  state_reg_3 : DFCND1BWP7T port map(CDN => n_31, CP => clk, D => n_25, Q => state(3), QN => n_6);
  state_reg_0 : DFCND1BWP7T port map(CDN => n_31, CP => clk, D => n_29, Q => state(0), QN => n_23);
  state_reg_2 : DFCND1BWP7T port map(CDN => n_31, CP => clk, D => n_22, Q => state(2), QN => n_14);
  g2 : IND2D1BWP7T port map(A1 => n_10, B1 => n_23, ZN => n_37);

end synthesised;

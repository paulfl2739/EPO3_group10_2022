
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of spi_rom is

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D8BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component TIELBWP7T
    port(ZN : out std_logic);
  end component;

  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5 : std_logic;

begin

  spi_data(0) <= spi_data(12);
  spi_data(1) <= spi_data(14);
  spi_data(2) <= spi_data(14);
  spi_data(5) <= spi_data(14);
  spi_data(6) <= spi_data(14);
  spi_data(7) <= spi_data(14);
  g84 : OR2D4BWP7T port map(A1 => spi_data(10), A2 => n_5, Z => spi_data(15));
  g82 : OR2D4BWP7T port map(A1 => spi_data(10), A2 => spi_data(11), Z => spi_data(8));
  g85 : OR3D4BWP7T port map(A1 => n_4, A2 => spi_data(9), A3 => spi_data(11), Z => spi_data(13));
  g83 : OR2D4BWP7T port map(A1 => spi_data(4), A2 => n_3, Z => spi_data(3));
  g87 : CKAN2D4BWP7T port map(A1 => spi_data(9), A2 => address(1), Z => spi_data(10));
  g88 : INR2D0BWP7T port map(A1 => spi_data(11), B1 => address(0), ZN => n_5);
  g89 : CKAN2D8BWP7T port map(A1 => spi_data(11), A2 => address(0), Z => spi_data(12));
  g86 : CKAN2D4BWP7T port map(A1 => n_4, A2 => n_2, Z => spi_data(4));
  g91 : CKAN2D4BWP7T port map(A1 => address(0), A2 => n_0, Z => spi_data(9));
  g90 : NR2D0BWP7T port map(A1 => n_2, A2 => address(1), ZN => n_3);
  g93 : CKAN2D4BWP7T port map(A1 => address(2), A2 => n_1, Z => spi_data(11));
  g92 : INR2D0BWP7T port map(A1 => address(1), B1 => address(2), ZN => n_4);
  g96 : INVD0BWP7T port map(I => address(1), ZN => n_1);
  g95 : INVD0BWP7T port map(I => address(2), ZN => n_0);
  g94 : INVD0BWP7T port map(I => address(0), ZN => n_2);
  tie_0_cell : TIELBWP7T port map(ZN => spi_data(14));

end synthesised;

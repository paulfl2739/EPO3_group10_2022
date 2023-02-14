library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of integrate_tb is
   component integrate
   	port(clk 	: in std_logic;
   	reset 	: in std_logic;
   	start 	: in std_logic;
   	
   	sdo	: in std_logic; --gyroscope chip
   	drdy 	: in std_logic;
   	cs	: out std_logic;
   	spc	: out std_logic;
   	sdi	: out std_logic;
   
   	r	: out std_logic_vector(3 downto 0); --vga
   	g	: out std_logic_vector(3 downto 0);
   	b	: out std_logic_vector(3 downto 0);
   	hsync	: out std_logic;
   	vsync 	: out std_logic);
   end component;
   signal clk 	: std_logic;
   signal reset 	: std_logic;
   signal start 	: std_logic;
   signal sdo	: std_logic;
   signal drdy 	: std_logic;
   signal cs	: std_logic;
   signal spc	: std_logic;
   signal sdi	: std_logic;
   signal r	: std_logic_vector(3 downto 0);
   signal g	: std_logic_vector(3 downto 0);
   signal b	: std_logic_vector(3 downto 0);
   signal hsync	: std_logic;
   signal vsync 	: std_logic;
begin
   test: integrate port map (clk, reset, start, sdo, drdy, cs, spc, sdi, r, g, b, hsync, vsync);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   start <= '0' after 0 ns,
	'1' after 20 ns,
	'0' after 30 ns;
   sdo <= '0' after 0 ns,	
			'1' after 48900 ns,	
			'0' after 50500 ns,
			'1' after 52100 ns,
			'0' after 52900 ns,
			'1' after 53700 ns,
			'0' after 54500 ns,

			'1' after 80900 ns,
			'1' after 82500 ns,
			'0' after 84100 ns,
			'1' after 84900 ns,
			'0' after 85700 ns,
			'1' after 86500 ns;
   drdy <= '0' after 0 ns,
	'1' after 42000 ns,
	'0' after 48000 ns,
	'1' after 74000 ns,
	'0' after 80000 ns;
end behaviour;


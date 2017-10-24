library ieee;
use ieee.std_logic_1164.all;

entity Factorial is
port(
	clk, reset: in std_logic;
	n_i: in integer;
	f_out: out integer
);
end entity;

architecture structure of Factorial is
	
	component DP is
	port(
		clk, reset: in std_logic;
		n_ld, i_ld, f_ld: in std_logic;
		i_sel, f_sel: in std_logic;
		n_i: in integer;
		lt_i_add0: out std_logic;
		f_out: out integer
	);
	end component;

	component CU is
	port(
		clk, reset: in std_logic;
		lt_i_add0: in std_logic;
		n_ld, i_ld, f_ld: out std_logic;
		i_sel, f_sel: out std_logic
	);
	end component;
	
	signal n_ld, i_ld, f_ld, i_sel, f_sel, lt_i_add0: std_logic;
	
begin

	U0: DP port map(clk, reset, n_ld, i_ld, f_ld, i_sel, f_sel, n_i, lt_i_add0, f_out);
	U1: CU port map(clk, reset, lt_i_add0, n_ld, i_ld, f_ld, i_sel, f_sel);
	
end architecture;













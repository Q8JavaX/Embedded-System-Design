library ieee;
use ieee.std_logic_1164.all;

entity DP is
port(
	clk, reset: in std_logic;
	n_ld, i_ld, f_ld: in std_logic;
	i_sel, f_sel: in std_logic;
	n_i: in integer;
	lt_i_add0: out std_logic;
	f_out: out integer
);
end entity;

architecture structure of DP is
	
	component Adder is
	port(
		input1, input2: in integer;
		output: out integer
	);
	end component;
	
	component Multiplier is
	port(
		input1, input2: in integer;
		output: out integer
	);
	end component;

	component ComparatorLT is
	port(
		input1, input2: in integer;
		lt: out std_logic
	);
	end component;

	component Mux2 is
	port(
		selector: in std_logic;
		input1, input2: in integer;
		output: out integer
	);
	end component;

	component Reg is
	port(
		clk, reset: in std_logic;
		load: in std_logic;
		input: in integer;
		output: out integer
	);
	end component;
	
	signal n, add0, add1, i_mux, i, mult0, f_mux, f: integer;
	
begin

	U0: Reg port map(clk, reset, n_ld, n_i, n);
	U1: Adder port map(n, 1, add0);
	U2: ComparatorLT port map(i, add0, lt_i_add0);
	U3: Adder port map(i, 1, add1);
	U4: Mux2 port map(i_sel, 1, add1, i_mux);
	U5: Reg port map(clk, reset, i_ld, i_mux, i);
	U6: Multiplier port map(f, i, mult0);
	U7: Mux2 port map(f_sel, 1, mult0, f_mux);
	U8: Reg port map(clk, reset, f_ld, f_mux, f);
	f_out <= f;

end architecture;













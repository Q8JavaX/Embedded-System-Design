library ieee;
use ieee.std_logic_1164.all;

entity Reg is
port(
	clk, reset: in std_logic;
	load: in std_logic;
	input: in integer;
	output: out integer
);
end entity;

architecture behavior of Reg is
begin
	process(clk, reset) is
	begin
		if(reset = '1') then
			output <= 0;
		elsif(rising_edge(clk) and load = '1') then
			output <= input;
		end if;
	end process;
end architecture;
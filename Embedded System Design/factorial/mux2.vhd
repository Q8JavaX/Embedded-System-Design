library ieee;
use ieee.std_logic_1164.all;

entity Mux2 is
port(
	selector: in std_logic;
	input1, input2: in integer;
	output: out integer
);
end entity;

architecture behavior of Mux2 is
begin
	with selector select
	output <=	input1 when '0',
					input2 when others;
end architecture;
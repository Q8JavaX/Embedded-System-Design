library ieee;
use ieee.std_logic_1164.all;

entity Multiplier is
port(
	input1, input2: in integer;
	output: out integer
);
end entity;

architecture behavior of Multiplier is
begin
	output <= input1 * input2;
end architecture;
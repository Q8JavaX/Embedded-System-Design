library ieee;
use ieee.std_logic_1164.all;

entity ComparatorLT is
port(
	input1, input2: in integer;
	lt: out std_logic
);
end entity;

architecture behavior of ComparatorLT is
begin
	lt <= '1' when (input1 < input2) else '0';
end architecture;
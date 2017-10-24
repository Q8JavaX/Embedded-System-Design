library ieee;
use ieee.std_logic_1164.all;

entity CU is
port(
	clk, reset: in std_logic;
	lt_i_add0: in std_logic;
	n_ld, i_ld, f_ld: out std_logic;
	i_sel, f_sel: out std_logic
);
end entity;

architecture behavior of CU is

	type state is (start, s0, s1, s2, s3, s4, endstate);
	signal c_state, n_state: state;

begin

	CLOCK: process(clk, reset) is
	begin
		if(reset = '1') then
			c_state <= start;
		elsif(rising_edge(clk)) then
			c_state <= n_state;
		end if;
	end process;
	
	
	FSM: process(c_state) is
	begin
		n_ld <= '0';
		i_ld <= '0';
		f_ld <= '0';
		case c_state is
			when start =>
				n_state <= s0;
			when s0 =>
				n_ld <= '1';
				f_sel <= '0';
				f_ld <= '1';
				i_sel <= '0';
				i_ld <='1';
				n_state <= s1;
			when s1 =>
				if(lt_i_add0 = '1') then
					n_state <= s2;
				else
					n_state <= endstate;
				end if;
			when s2 =>
				f_sel <= '1';
				f_ld <= '1';
				n_state <= s3;
			when s3 =>
				i_sel <= '1';
				i_ld <= '1';
				n_state <= s4;
			when s4 =>
				n_state <= s1;
			when endstate =>
				n_state <= endstate;
		end case;
	end process;

end architecture;















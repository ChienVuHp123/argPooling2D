library ieee;

USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.STD_LOGIC_ARITH.all;
use work.library_def.all;

entity pooling_tb is
end entity pooling_tb;

architecture architecture_testbench of pooling_tb is

	constant CLKTIME : time := 20 ns;
	signal	CLK : std_logic := '0';
	signal Din_I, Din_K, D_out: integer;
	signal START, Rst, Done: std_logic;
begin -- begin architecture
        Clk <= NOT CLK AFTER 10 ns;

        -- instance
        DUT: pooling port map(
                Start => Start,
                Clk => CLK,
                Reset => Rst,
                Din_I => Din_I,
                Din_K => Din_K,
                D_out => D_out,
                Done => Done
                );

        process -- process testing
                begin -- begin process

                        Rst <= '1';
                        wait for 100 ns;
                        Rst <= '0';
                        START <= '1';
                        wait;
                end process;
end architecture_testbench;
	

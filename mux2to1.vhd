library ieee;
use ieee.std_logic_1164.ALL;

entity mux2to1 is
    port( 
	din_0:in integer;
	dout_sel : in std_logic;
        dout : out integer 
        );
end mux2to1;

architecture mux2to1_architecture of mux2to1 is
        constant din_1: integer := 0;
begin
    with dout_sel select
        dout <= din_0 when '0',
                    din_1 when others;
end mux2to1_architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- entity declare
entity counter is
	port( 
                Clk, Reset, Enable, Load: in std_logic;
                Dout : out integer
        );
end counter;

architecture counter_architecture of counter is
        signal Count : integer := 0;

begin -- begin architecture
        process ( Clk, Reset )
        begin
                if Reset = '1' then Count <= 0;
                        elsif Load = '1' then Count <= 0;
                        elsif (Clk'event and Clk = '1') then
                        if Enable ='1' then
                                Count <= Count + 1 ;
                        else
                                Count <= Count ;
                        end if;
                end if;
        end process;
        Dout <= Count;
end counter_architecture;

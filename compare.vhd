library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- entity declare
entity compare is
	port(
	Din_1, Din_2: in integer;
	Dout: out std_logic
	);
end compare;

-- architecture declare
architecture architecture_of_compare of compare is

	signal result : std_logic;

begin  -- begin architecture
prs: process (Din_1, Din_2)

        begin -- begin process
                if Din_1 = Din_2 then 
                        result <= '1';
                else 
                        result <= '0';
                end if;
        end process;
        
        Dout <= result;

end architecture_of_compare;

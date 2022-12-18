library ieee;
use ieee.std_logic_1164.all;


-- entity declare
entity adder is
 port (
	Din_0, Din_1: in integer;
	Dout: out integer
	);
end adder;
 
-- architecture of adder entity
architecture architecture_of_adder of adder is
begin
	Dout <= Din_0 + Din_1;
end architecture_of_adder;


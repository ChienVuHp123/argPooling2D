library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul is
   port (
	x, y: in integer;
	m: out integer
	);
end mul;

architecture mul_architect of mul is
begin
	m <= x * y;
end mul_architect;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 

entity data_I is
  port (
   
    Clk        : in  std_logic;	
    addr       : in  integer;   

    Wen        : in  std_logic;	
    Datain     : in  integer ;
  
    Ren        : in  std_logic;	
    Dataout    : out integer := 0 
    );

end data_I;
 
architecture data_I_architecture of data_I is
   
  constant I_Size : Integer := 16; -- Size of input matrix
  type DATA_ARRAY is array (0 to I_Size-1) of integer; -- Memory Type
  signal   M_I       :     DATA_ARRAY := ( --Value of input matrix
	2,4,6,8,
	10,12,14,16,
	18,20,22,24,
	26,28,30,32
  );
	
begin  -- begin of architecture

  RW_Proc : process (clk)
  begin  
   if (clk'event and clk = '1') then 
        if Wen = '1' then
			        M_I(addr) <= Datain;
        else
			        if Ren = '1' then
				Dataout <= M_I(addr);
			end if;
		end if;
      end if;
  end process  RW_Proc;
     
end data_I_architecture;

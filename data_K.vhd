library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity data_K is
  port (
    Clk        : in  std_logic;	
    addr       : in  integer;   
    Wen        : in  std_logic;	
    Datain     : in  integer ; 
    Ren        : in  std_logic;	
    Dataout    : out integer := 0
    );
end data_K;

architecture data_K_architecture of data_K is
  constant K_Size : Integer := 4; -- Size of input matrix
  type DATA_ARRAY is array (0 to K_Size-1) of integer; -- Memory Type
  signal   M_K       :     DATA_ARRAY := ( --Value of kernel matrix
	1,1,
	1,1
  );

begin  -- begin of architecture

  RW_Proc : process (clk)
  begin  
   if (clk'event and clk = '1') then   
        if Wen = '1' then
			        M_K(addr) <= Datain;
        else
			        if Ren = '1' then
				Dataout <= M_K(addr);
			end if;
		end if;
      end if;
  end process  RW_Proc;
     
end data_K_architecture;

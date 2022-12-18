library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 

entity data_O is
  port (

    Clk        : in  std_logic;
    addr       : in  integer;

    Wen        : in  std_logic;
    Datain     : in  integer ; 

    Ren        : in  std_logic;
    Dataout    : out integer := 0 
    );
end data_O;

architecture data_O_architecture of data_O is

  constant O_Size : Integer := 4; 
  signal count_re : Integer := 1;

  type DATA_ARRAY is array (0 to O_Size) of integer; 
  signal   M_O       :     DATA_ARRAY := (others => 0); 

begin  -- begin of data_O_architecture
 
  RW_Proc : process (clk)
  begin  -- begin of process 

   if (clk'event and clk = '1') then
        if Wen = '1' then
                    M_O(addr) <= Datain;
        else
                    if Ren = '1' then
                    if count_re <= O_Size then 
                        count_re <= count_re + 1;
                        end if;
                Dataout <= M_O(addr);
                else
                    if count_re > O_Size then
                    count_re <= 0;
                    M_O(addr) <= M_O(addr) / O_Size;
                        end if;
                    end if;
        end if;
          end if;
  end process  RW_Proc;

end data_O_architecture;

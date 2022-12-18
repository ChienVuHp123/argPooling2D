library ieee;
use ieee.std_logic_1164.all;

entity controller is
port (
        Start, Clk, Reset : in std_logic;
	Zi, Zj, Zm, Zn : in std_logic;
	we_i, we_k, we_o, re_i, re_k, re_o, dout_sel: out std_logic;
	ld_i, ld_j, ld_m, ld_n : out std_logic;
	en_i, en_j, en_m, en_n : out std_logic;
	done: out std_logic 
        ); 
end controller;

architecture controller_architecture of controller is
        type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16);
        signal state: state_type;
begin
        process(Reset, clk)
        begin
                if(Reset = '1') then state <= s0;
                elsif(clk'event and clk = '1') then
                        case state is

                                when s0 => state <= s1;

                                when s1 => 
                                        if(start = '1') then state <= s2;
                                        else state <= s1;
                                        end if;

                                when s2 => 
                                        if(Zi = '0') then state <= s3;
                                        else state <= s15;
                                        end if;

                                when s3 => 
                                        if(Zj = '0') then state <= s4;
                                        else state <= s14;
                                        end if;

                                when s4 => 
                                        if(Zm = '0') then state <= s5;
                                        else state <= s11;
                                        end if;

                                when s5 => 
                                        if(Zn = '0') then state <= s6;
                                        else state <= s10;
                                        end if;

                                when s6 => state <= s7;
                                when s7 => state <= s8;
                                when s8 => state <= s9;
                                when s9 => state <= s5;
                                when s10 => state <= s4;
                                when s11 => state <= s12;
                                when s12 => state <= s13;
                                when s13 => state <= s3;
                                when s14 => state <= s2;
                                when s15 => state <= s16;

                                when s16 => 
                                        if(start = '0') then state <= s0;
                                        else state <= s16;
                                        end if;
                                when others => state <= s0;
                        end case;
                end if;
        end process;

re_i <= '1' when state = s6 else '0';
re_k <= '1' when state = s6 else '0';
we_o <= '1' when (state = s7 or state = s12) else '0';
re_o <= '1' when (state = s8 or state = s13) else '0';

ld_n <= '1' when (state = s10 or state = s0) else '0';
ld_m <= '1' when (state = s11 or state = s0) else '0';
ld_i <= '1' when state = s0 else '0';
ld_j <= '1' when (state = s14 or state = s0) else '0';

en_n <= '1' when state = s9 else '0';
en_m <= '1' when state = s10 else '0';
en_j <= '1' when state = s11 else '0';
en_i <= '1' when state = s14 else '0';

dout_sel <= '1' when state = s12 else '0';
done <= '1' when state = s15 else '0';

end controller_architecture;


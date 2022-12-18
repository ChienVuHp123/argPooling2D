library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.library_def.all;

entity pooling is
 	port(
                Start, Clk, Reset: in std_logic;
                Din_I, Din_K: in integer;
                D_out: out integer;
                Done: out std_logic
        );
end pooling;

architecture pooling_architecture of pooling is
	signal WE_I, RE_I, WE_K, RE_K, WE_O, RE_O: std_logic;
	signal Ld_i, Ld_j, Ld_m, Ld_n, En_i, En_j, En_m, En_n: std_logic;
	signal dout_sel: std_logic;
	signal Zi, Zj, Zm, Zn: std_logic;
	signal Addr_I, Addr_K, Addr_O : integer;
	signal M_I, M_K, M_O, Din_O: integer;

begin -- begin of architecture

instance_data_I: data_I
port map(
	Clk => Clk,
	addr => Addr_I,
	Wen => WE_I,
	Datain => Din_I,
	Ren => RE_I,
	Dataout => M_I
        );

instance_data_K: data_K
port map(
	Clk => Clk,
	addr => Addr_K,
	Wen => WE_K,
	Datain => Din_K,
	Ren => RE_K,
	Dataout => M_K
        );

instance_data_O: data_O
port map(
	Clk => Clk,
	addr => Addr_O,
	Wen => WE_O,
	Datain => Din_O,
	Ren => RE_O,
	Dataout => M_O
        );

instance_controller: controller
port map(
	Start => Start,
	Clk => Clk,
	Reset => Reset,
	Zi => Zi,
	Zj => Zj,
	Zm => Zm,
	Zn => Zn,
	WE_I => WE_I,
	WE_K => WE_K,
	WE_O => WE_O,
	RE_I => RE_I,
	RE_K => RE_K,
	RE_O => RE_O,
	dout_sel => dout_sel,
	Ld_i => Ld_i,
	Ld_j => Ld_j,
	Ld_m => Ld_m,
	Ld_n => Ld_n,
	En_i => En_i,
	En_j => En_j,
	En_m => En_m,
	En_n => En_n,
	done => Done);
instance_datapath: datapath
port map(
	Clk => Clk,
	Reset => Reset, 
	Din_I => M_I,
	Din_K => M_K,
	Din_O => M_O,
	Dout => Din_O, 
	Adr_O => Addr_O, 
	Adr_I => Addr_I, 
	Adr_K => Addr_K,
	Dout_sel => Dout_sel,
	En_i => En_i,
	En_j => En_j,    
	En_m => En_m,
	En_n => En_n,
	Ld_i => Ld_i,
	Ld_j => Ld_j,
	Ld_m => Ld_m,
	Ld_n => Ld_n,
	Zi => Zi,
	Zj => Zj,
	Zm => Zm,
	Zn => Zn);

end pooling_architecture;
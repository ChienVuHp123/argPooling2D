library ieee;
use ieee.std_logic_1164.all;

package library_def is

---------------------------
component counter is
	port (
                Clk, Reset, Enable, Load: in std_logic ;
                Dout : out integer
        );
end component counter;
---------------------------

component data_I is
  port (
    Clk        : in  std_logic;	
    addr       : in  integer;   
    Wen        : in  std_logic;	
    Datain     : in  integer ; 
    Ren        : in  std_logic;	
    Dataout    : out integer  
    );
end component data_I;

---------------------------
component data_K is
  port (
    Clk        : in  std_logic;	
    addr       : in  integer;   
    Wen        : in  std_logic;	
    Datain     : in  integer ; 
    Ren        : in  std_logic;	
    Dataout    : out integer  
    );
end component data_K;
---------------------------

component data_O is
  port (
    Clk        : in  std_logic;	
    addr       : in  integer;   
    Wen        : in  std_logic;	
    Datain     : in  integer ; 
    Ren        : in  std_logic;	
    Dataout    : out integer  
    );
end component data_O;
---------------------------

component controller is
	port (
                Start, Clk, Reset : in std_logic;
                Zi, Zj, Zm, Zn : in std_logic;
                we_i, we_k, we_o, re_i, re_k, re_o, dout_sel: out std_logic;
                ld_i, ld_j, ld_m, ld_n : out std_logic;
                en_i, en_j, en_m, en_n : out std_logic;
                done: out std_logic 
        ); 
end component controller;

---------------------------

component mux2to1 is
    port( 
                din_0:in integer;
                dout_sel : in STD_LOGIC;
                dout : out integer 
        );
end component mux2to1;
---------------------------

component mul is
   port (
                x, y: in integer;
                m: out integer
	);
end component mul;
---------------------------
component adder is
 port (
	Din_0, Din_1: in integer;
	Dout: out integer
	);
end component adder;
---------------------------
component divider is
 port (
	Din : in integer;
	Dout: out integer
	);
end component divider;
---------------------------
component compare is
	port(
	Din_1, Din_2: in integer;
	Dout: out std_logic
	);
end component compare;
---------------------------
component datapath is
	port (
                Clk, Reset: std_logic;
                Din_I, Din_K, Din_O: in integer;
                Adr_I, Adr_K, Adr_O: out integer;
                Dout: out integer;
                dout_sel: in std_logic;
                En_i, En_j, En_m, En_n: in std_logic;
                Ld_i, Ld_j, Ld_m, Ld_n: in std_logic;
                Zi, Zj, Zm, Zn : out std_logic
        );
end component datapath;
---------------------------

component pooling is
 	port(
                Start, Clk, Reset: in std_logic;
                Din_I, Din_K: in integer;
                D_out: out integer;
                Done: out std_logic
        );
end component pooling;
---------------------------
end library_def;
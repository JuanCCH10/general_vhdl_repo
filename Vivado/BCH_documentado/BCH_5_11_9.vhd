----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Pack_Array.all;

entity BCH_5_11_9 is
Generic( AxBits : integer:=25);
Port
(
    Reset : in std_logic;
    Clk   : in std_logic;
    En    : in std_logic;
    Ax    : out std_logic_vector(AxBits-1 downto 0)
);
end BCH_5_11_9;

architecture Behavioral of BCH_5_11_9 is
--COMPONENTES-----------------------------------------------------------------------
component Dual_Port_DRAM is
generic(Nbits_addr : integer := 4;
		Nbits_data : integer := 5);
		
Port ( CLK   : in STD_LOGIC;
	   WE    : in STD_LOGIC;
	   ADDRA : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DIA   : in STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       DOA   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       ADDRB : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DOB   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0));
end component;
component BMA is
Generic( BitsSyndrome : integer :=5;
         AddrSyndrome : integer :=4);
Port
(
    Reset   : in std_logic;
    Clk     : in std_logic;
    En      : in std_logic;
    Sk      : in std_logic_vector(BitsSyndrome-1 downto 0);
    Ski     : in std_logic_vector(BitsSyndrome-1 downto 0);
    Addr_K  : out std_logic_vector(AddrSyndrome-1 downto 0);
    Addr_Ki : out std_logic_vector(AddrSyndrome-1 downto 0);
    AxF     : out Array_Ax
);
end component;
--------------------------------------------------------------------------------------
--CONSTANTES--------------------------------------------------------------------------
constant Bits5 : integer:=5;
constant Bits4 : integer:=4;
--SEÑALES-----------------------------------------------------------------------------
signal Addr_Syndromes  : std_logic_vector(Bits4-1 downto 0);
signal Addr2_Syndromes : std_logic_vector(Bits4-1 downto 0);
signal Sk              : std_logic_vector(Bits5-1 downto 0);
signal Ski             : std_logic_vector(Bits5-1 downto 0);
signal Din             : std_logic_vector(Bits5-1 downto 0);
signal AxF             : Array_Ax;
begin
--INSTANCIACIÓN-----------------------------------------------------------------------
RAM_Sindromes:Dual_Port_DRAM 
generic map(Nbits_addr => 4,
			Nbits_data => 5)
		
Port map ( CLK   => Clk,
		   WE    => '0',
		   ADDRA => Addr_Syndromes,
		   DIA   => Din,
		   DOA   => Sk,
		   ADDRB => Addr2_Syndromes,
		   DOB   => Ski);

U1_BMA : BMA
Generic map
(
    BitsSyndrome =>5,
    AddrSyndrome =>4
 )
Port map
(
    Reset   =>Reset,
    Clk     =>Clk,
    En      =>En,
    Sk      =>Sk,
    Ski     =>Ski,
    Addr_K  =>Addr_Syndromes,
    Addr_Ki =>Addr2_Syndromes,
    AxF     =>AxF
);

end Behavioral;

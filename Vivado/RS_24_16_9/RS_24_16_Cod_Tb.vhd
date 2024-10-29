library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity RS_24_16_Cod_Tb is
--  Port ( );
end RS_24_16_Cod_Tb;

architecture Behavioral of RS_24_16_Cod_Tb is
component RS_24_16_Enc is
    Port (	Reset	: in STD_LOGIC;
    		Clk	: in STD_LOGIC;
			En	: in STD_LOGIC;
			D	: in STD_LOGIC_VECTOR(5 DOWNTO 0);
			Q	: out STD_LOGIC_VECTOR(5 DOWNTO 0));
end component;
signal Reset: STD_LOGIC;
signal Clk	: STD_LOGIC;
signal En	: STD_LOGIC;
signal D	: STD_LOGIC_VECTOR(5 DOWNTO 0);
signal Q	: STD_LOGIC_VECTOR(5 DOWNTO 0);
constant clk_periodo: time := 10 ns;           


Type Array1 is array (0 to 31) of std_logic_Vector(7 downto 0);
--constant ROM_Datos : Array1 := (
--x"11",x"12",x"13",x"14",x"15",x"16",x"17",x"18",x"19",x"20",x"21",x"22",x"23",
--others => x"00");

constant ROM_Datos : Array1 := (
--x"01",x"02",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01",
--x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
--"00000001",
---- solo "cero"
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",
--"00000000",

---- solo alpha0
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",
--"00000001",

------ solo alpha1
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",
"00000010",

--a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15
--"00000001",
--"00000010",
--"00000100",
--"00001000",
--"00010000",
--"00100000",
--"00000011",
--"00000110",
--"00001100",
--"00011000",
--"00110000",
--"00100011",
--"00000101",
--"00001010",
--"00010100",
--"00101000",
others => "00000000");

component Contador_Lim_In_Asc is
    Generic(Nbits: integer:=9);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC);
end component;
signal Addr: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal Busy	: STD_LOGIC;
signal D_Aux: STD_LOGIC_VECTOR(7 DOWNTO 0);

signal En_Dec	: STD_LOGIC;


begin
    process begin
        Clk <= '1';
        wait for clk_periodo/2;
        Clk <= '0';
        wait for clk_periodo/2;
    end process;
--*****************************
    process begin
        Reset <= '1';
        wait for 100 ns;
        Reset <= '0';
        wait;-- for clk_periodo*2;
    end process;

--process
--begin
--    En <= '0';
--    wait for 200 ns;
--    En	<= '1';
--    wait for clk_periodo*2;
--    En	<= '0';
--    wait for clk_periodo*100;
--end process;

    En	<= '1';

    Contador :  Contador_Lim_In_Asc
    Generic Map(Nbits => 5)
    Port Map ( 
	   Reset    => Reset,
	   Clk      => Clk,
       En       => En,
       DIN      => "10000",
       Dout     => Addr,
       En_Out   => Busy);

    D_Aux <= ROM_Datos(conv_integer(Addr));
    
    process(clk) begin
	   if rising_edge(clk) then
	       D <= D_Aux(5 downto 0);
	   end if;
    end process;
    
    En_Dec <= Busy and not Reset;
    
    Test : RS_24_16_Enc
    Port Map (
        Reset	=> Reset,
		Clk	=> Clk,
        En	=> En_Dec,
        D	=> D,
        Q	=> Q);
               
end Behavioral;

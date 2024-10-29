library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity cod_RS241213_tb is
end cod_RS241213_tb;

architecture Behavioral of cod_RS241213_tb is
    
    component RS_24_12 is
    Port (	Reset	: in STD_LOGIC;
			Clk	: in STD_LOGIC;
			En	: in STD_LOGIC;
			D	: in STD_LOGIC_VECTOR(5 DOWNTO 0);
			Q	: out STD_LOGIC_VECTOR(71 DOWNTO 0));
    end component;
    
    signal clk, en, rst	: STD_LOGIC;
    signal D : STD_LOGIC_VECTOR(5 DOWNTO 0);
    signal Q : std_logic_vector(71 downto 0);
    constant per : time := 10 ns; 
    Type Array1 is array (0 to 31) of std_logic_Vector(7 downto 0); 
    constant ROM_Datos : Array1 := (
--        "00000101", --05 
--        "00100011", --43
--        "00110000", --60
--        "00011000", --30
--        "00001100", --14
--        "00000110", --06
--        "00000011", --03
--        "00100000", --40
--        "00010000", --20
--        "00001000", --10
--        "00000100", --04
--        "00000010", --02
        --************************************************
        "00100001", --41
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110101", --65
        "00110010", --62
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
        wait for per/2;
        Clk <= '0';
        wait for per/2;
    end process;

    process begin
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait;-- for clk_periodo*2;
    end process;

    en	<= '1';

    Contador :  Contador_Lim_In_Asc
    Generic Map(Nbits => 5)
    Port Map ( 
	   Reset    => rst,
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
    
    En_Dec <= Busy and not rst;
    
    conexion : RS_24_12
    port map(
        Reset => rst,
        Clk => clk,
        En => En_Dec,
        D => D,
        Q => Q
    );

end Behavioral;

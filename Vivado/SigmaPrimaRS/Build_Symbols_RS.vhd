

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Arrays_Forney.all;
use work.Modulos_Genericos_Pkg.all;

entity Build_Symbols_RS is
Port
(
    Reset        : in std_logic;
    Clk          : in std_logic;
    En           : in std_logic;
    En_index     : in std_logic;
    En_Sigma     : in std_logic;
    Index        : in Array_Ik;
    Sigma        : in Array_Bk;
    Symbol_valid : out std_logic;
    Symbol_Data  : out Array_d
 );
end Build_Symbols_RS;

architecture Behavioral of Build_Symbols_RS is


constant Lim       : std_logic_vector(5 downto 0):="100101";     
constant Lim2      : std_logic_vector(2 downto 0):="111";      	
signal EnableAll   : std_logic;
signal SaveIndex   : Array_Ik;
signal SaveSigma   : Array_Bk;
signal FlgBuild    : std_logic;
signal Count36Dout : std_logic_vector(5 downto 0);
signal Count36Done : std_logic;
signal Count8Dout  : std_logic_vector(2 downto 0);
signal Count8Done  : std_logic;
signal IndexEqual  : std_logic;
signal IndexAux    : std_logic;
signal Position    : std_logic_vector(5 downto 0);
signal NewSymbols  : Array_d;
signal DoneBuild   : std_logic;
signal DoneBuildH  : std_logic;
begin

M1_ContadorSymbol : Contador_Lim_In_Asc
Generic Map(Nbits => 6)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => FlgBuild,
           	DIN      => Lim,
           	Dout     => Count36Dout,
           	En_Out   => Count36Done);
M2_ContadorSymbol : Contador_Lim_In_Asc
Generic Map(Nbits => 3)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => IndexAux,
           	DIN      => Lim2,
           	Dout     => Count8Dout,
           	En_Out   => Count8Done);
           	
M0_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Count36Done,
            PulsoB  => DoneBuild,
            PulsoS  => open);
----------------------------------------------           	
process(Reset,Clk)is
begin
    if Reset='1' then
        EnableAll <= '0';
        DoneBuildH <='0';
    elsif rising_edge(Clk)then
        if En ='1' then
            EnableAll <= '1';
        end if;
        if DoneBuild='1'then
            DoneBuildH <='1';        
        end if;
    end if;
end process;
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset='1' then
        SaveIndex <= (others=>(others=>'0'));
        SaveSigma <= (others=>(others=>'0'));
        FlgBuild  <= '0';
    elsif rising_edge(Clk)then
        if EnableAll ='1' then
            if En_Index='1' then
                SaveIndex <= Index;
            end if;
            if En_Sigma='1' then
                SaveSigma <= Sigma;
                FlgBuild  <='1';
            end if;
        end if;
    end if;
end process;
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset='1' then
        NewSymbols <= (others=>(others=>'0'));
    elsif rising_edge(Clk)then
        if EnableAll ='1' then
            if IndexAux='1' then
                NewSymbols(conv_integer(Position))<=SaveSigma(Conv_integer(7-Count8Dout));
            end if;
        end if;
    end if;
end process;
----------------------------------------------
--IndexEqual   <= '1' when ((35-Count24Dout = Index(conv_integer(7-Count4Dout)))or Index(conv_integer(7-Count4Dout))="000000")  else '0';
IndexEqual   <= '1' when (36-Count36Dout = Index(conv_integer(7-Count8Dout)))  else '0';
IndexAux     <= IndexEqual and FlgBuild;
Position     <= SaveIndex(conv_integer(7-Count8Dout));
----------------------------------------------
Symbol_valid <= DoneBuildH;
Symbol_Data  <= NewSymbols;

end Behavioral;

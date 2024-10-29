----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 16:40:20
-- Design Name: 
-- Module Name: SigmaP_RS - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Modulos_Genericos_Pkg.all;
use work.Arrays_Forney.all;

entity SigmaP_RS is
Port
(
    Reset       : in std_logic;
    Clk         : in std_logic;
    En          : in std_logic;
    Bk_in       : in Array_Bk;
    Sigma_out   : out Array_Bk;
    Sigma_valid : out std_logic
);
end SigmaP_RS;

architecture Behavioral of SigmaP_RS is
component d_dm_1 is
Port
(
    d    : in std_logic_vector(5 downto 0);
    dm   : in std_logic_vector(5 downto 0);
    ddm1 : out std_logic_vector(5 downto 0)
);
end component;

component prod_alpha is
Port
(
    alphaA : in std_logic_vector(5 downto 0);
    alphaB : in std_logic_vector(5 downto 0);
    alphaR : out std_logic_vector(5 downto 0)
);
end component;
-------------------------------------
constant LimCounterBk : std_logic_vector(3 downto 0):="0111";   
constant LimCounter16 : std_logic_vector(6 downto 0):="1111111";
constant a0           : std_logic_vector(5 downto 0):="000001";

signal EnableAll     : std_logic;
signal EnRising      : std_logic;
signal Bk            : Array_Bk;
signal SigmaDataP    : Array_Bk;
signal RstCountBi    : std_logic;
signal EnCounterBk   : std_logic;
signal EnCounterBi   : std_logic;
signal CountBkDout   : std_logic_vector(3 downto 0);
signal CountBiDout   : std_logic_vector(3 downto 0);
signal CountBkDone   : std_logic;
signal CountBiDone   : std_logic;
signal Bi            : std_logic_vector(5 downto 0);
signal BkInv         : std_logic_vector(5 downto 0);
signal BkInvBi       : std_logic_vector(5 downto 0);
signal BkInvBiAux    : std_logic_vector(5 downto 0);
signal a0XorBkBi     : std_logic_vector(5 downto 0);
signal Count16Dout   : std_logic_vector(6 downto 0);
signal Count16Done   : std_logic;
signal XnorCounters  : std_logic_vector(3 downto 0);
signal a0XorBkBiF1   : std_logic_vector(5 downto 0);
signal a0XorBkBiF2   : std_logic_vector(5 downto 0);
signal SaveMultAplha : std_logic_vector(5 downto 0);
signal FlagSigma     : std_logic;
signal ResMult       : std_logic_vector(5 downto 0);
signal DoneSigma     : std_logic;
signal DoneSigmaFF1  : std_logic;
signal SigmaOut      : Array_Bk;
begin
-------------------------------------
M0_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => EnableAll,
            PulsoB  => open,
            PulsoS  => EnRising);
            
M1_ContadorBk : Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => EnCounterBk,
           	DIN      => LimCounterBk,
           	Dout     => CountBkDout,
           	En_Out   => CountBkDone);

M2_ContadorBi : Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => RstCountBi,
            Clk      => Clk,
           	En       => EnCounterBi,
           	DIN      => LimCounterBk,
           	Dout     => CountBiDout,
           	En_Out   => CountBiDone);
           	
M3_Mult_ddm_1 : d_dm_1
Port map(
            d    =>Bi,
            dm   =>BkInv,
            ddm1 =>BkInvBi
);

M4_Contador255 : Contador_Lim_In_Asc
Generic Map(Nbits => 7)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => EnableAll,
           	DIN      => LimCounter16,
           	Dout     => Count16Dout,
           	En_Out   => Count16Done);
           	
M5_Multiplicar : prod_alpha
Port map
(
    alphaA => a0XorBkBiF2,
    alphaB => a0XorBkBi,
    alphaR => SaveMultAplha
);

M6_Multiplicar : prod_alpha
Port map
(
     alphaA => SaveMultAplha,
     alphaB => Bk(conv_integer(CountBkDout)),
     alphaR => ResMult
);  
M7_FlancoFin: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => CountBkDone,
            PulsoB  => DoneSigma,
            PulsoS  => open);   
-------------------------------------
process(Reset,Clk)is
begin
    if Reset='1' then
        EnableAll <= '0';
        Bk        <= (others=>(others=>'0'));
    elsif rising_edge(Clk)then
        if En ='1' then
            EnableAll <= '1';
            Bk        <= Bk_in;
        end if;
    end if;
end process;
-------------------------------------
process(Reset,Clk)is
begin
    if Reset='1'then
        a0XorBkBiF1 <= "000001";
        a0XorBkBiF2 <= "000001";
    elsif rising_edge(Clk)then
        if EnableAll='1' then
            if FlagSigma='0' then
                a0XorBkBiF1 <= SaveMultAplha;
                a0XorBkBiF2 <= a0XorBkBiF1; 
            else
                a0XorBkBiF1<="000001";
                a0XorBkBiF2<="000001";
            end if;      
        end if;
    end if;
end process;
-------------------------------------
process(Reset,Clk)is
begin
    if Reset='1'then
        SigmaDataP   <= (others=>(others=>'0'));
        SigmaOut     <= (others=>(others=>'0'));
        DoneSigmaFF1 <='0';
    elsif rising_edge(Clk)then
        if EnableAll='1' then
            if FlagSigma='1' then
                SigmaDataP(Conv_integer(CountBkDout))<= ResMult;
            end if;  
            if DoneSigma='1'then
                SigmaOut <= SigmaDataP;
            end if; 
            DoneSigmaFF1 <= DoneSigma;       
        end if;
    end if;
end process;
-------------------------------------
EnCounterBi  <= EnableAll and Count16Dout(0);
EnCounterBk  <= EnableAll and (Count16Dout(0) and Count16Dout(1) and Count16Dout(2) and Count16Dout(3));
RstCountBi   <= Reset or Not((Count16Dout(0))or(Count16Dout(1)) or(Count16Dout(2)) or Count16Dout(3));
BkInv        <= Bk(conv_integer(CountBkDout));
Bi           <= Bk(conv_integer(CountBiDout));
BkInvBiAux   <= BkInvBi when Bi>"000000" else "000000";
a0XorBkBi    <= a0 when XnorCounters="1111" else (a0 Xor BkInvBiAux);
XnorCounters <= CountBkDout xnor CountBiDout;  
FlagSigma    <= Count16Dout(0) and Count16Dout(1) and Count16Dout(2) and Count16Dout(3);    

-------------------------------------
Sigma_out    <= SigmaOut;
Sigma_valid  <= DoneSigmaFF1;

end Behavioral;

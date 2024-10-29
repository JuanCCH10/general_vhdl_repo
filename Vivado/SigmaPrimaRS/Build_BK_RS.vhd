----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 16:25:15
-- Design Name: 
-- Module Name: Build_BK_RS - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Modulos_Genericos_Pkg.all;
use work.Arrays_Forney.all;

entity Build_BK_RS is
Port
(
    Reset       : in std_logic;
    Clk         : in std_logic;
    En          : in std_logic;
    B_valid     : in std_logic;
    B_in        : in std_logic_vector(5 downto 0);
    Load_out    : out std_logic;
    Shift_out   : out std_logic;
    IndexBk_out : out Array_Ik;
    Bk_out      : out Array_Bk;
    Bk_valid    : out std_logic
);
end Build_BK_RS;

architecture Behavioral of Build_BK_RS is
constant LimRS       : std_logic_vector(5 downto 0):="100101";
constant Lim8        : std_logic_vector(2 downto 0):="111";
signal EnableAll     : std_logic;
signal EnRising      : std_logic;
signal Count36Dout   : std_logic_vector(5 downto 0);
signal Count36Done   : std_logic;
signal Count8Dout    : std_logic_vector(2 downto 0);
signal Count8Done    : std_logic;
signal ShiftOut      : std_logic;
signal EnShiftStart  : std_logic;
signal EnCounter36   : std_logic;
signal EnCounter8    : std_logic;
signal Error         : std_logic;
signal FlagBZero     : std_logic;
signal FlagBNoZero   : std_logic;
signal BNoZeroRising : std_logic;
signal BZeroRising   : std_logic;
signal BkAux         : Array_Bk;
signal IndexBk       : Array_Ik;

begin

M0_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => EnableAll,
            PulsoB  => open,
            PulsoS  => EnRising);
            
M1_Contador6Bits : Contador_Lim_In_Asc
Generic Map(Nbits => 6)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => EnCounter36,
           	DIN      => LimRS,
           	Dout     => Count36Dout,
           	En_Out   => Count36Done);
 
M2_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => FlagBNoZero,
            PulsoB  => open,
            PulsoS  => BNoZeroRising);   
            
M3_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => FlagBZero,
            PulsoB  => open,
            PulsoS  => BZeroRising);
                 
M4_Contador3Bits : Contador_Lim_In_Asc
Generic Map(Nbits => 3)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => EnCounter8,
           	DIN      => Lim8,
           	Dout     => Count8Dout,
           	En_Out   => Count8Done);  	

M5_FlancoEn: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Count36Done,
            PulsoB  => Bk_valid,
            PulsoS  => open);
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset='1' then
       EnableAll    <= '0';
    elsif rising_edge(Clk)then
        if En='1' then
            EnableAll <= '1'; 
        end if;
    end if;
end process;
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset='1' then
       EnShiftStart <= '0';
    elsif rising_edge(Clk)then
        EnShiftStart <= EnRising; 
    end if;
end process;
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset ='1' then
        Error       <= '0';
        FlagBZero   <= '0';
        FlagBNoZero <= '0';
    elsif rising_edge (Clk)then
        if EnableAll='1' then
            if B_Valid='1'then
                if B_in="000000" then
                    FlagBZero   <='1';
                end if;
                if B_in>"000000"then
                    FlagBNoZero <='1';
                end if;
            else
                FlagBZero   <='0';
                FlagBNoZero <='0';
            end if;
        end if;
    end if;
end process;
----------------------------------------------
process(Reset,Clk)is
begin
    if Reset ='1' then
        BkAux   <= (others=>(others=>'0'));
        IndexBk <= (others=>(others=>'0'));
    elsif rising_edge (Clk)then
        if EnableAll='1' and FlagBNoZero='1' then
            BkAux(7- conv_integer(Count8Dout)) <= B_in;
--             BkAux(conv_integer(Count4Dout)) <= B_in;
            IndexBk(conv_integer(7-Count8Dout)) <= (37-Count36Dout);
        end if;
    end if;
end process;
----------------------------------------------
Shift_out   <= EnableAll and (EnShiftStart or BZeroRising or BNoZeroRising) and(Count36Done);
EnCounter36 <= EnableAll and B_valid;
EnCounter8  <= EnableAll and BNoZeroRising;
---------------------------------------------
Load_out    <= EnRising;
Bk_out      <= BkAux;
IndexBk_out <= IndexBk;
----------------------------------------------
end Behavioral;

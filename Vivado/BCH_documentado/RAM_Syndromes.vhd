----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
entity RAM_Syndromes is
Generic(Ibits    : integer:=5;
        Obits    : integer:=5;
        AddrBits : integer:=4);
Port
(
    Clk   : in std_logic;
    En    : in std_logic;
    RW    : in std_logic;
    Addr  : in std_logic_vector(AddrBits-1 downto 0);
    Addr2 : in std_logic_vector(AddrBits-1 downto 0);
    Din   : in std_logic_vector(Ibits-1 downto 0);
    Dout  : out std_logic_vector(Obits-1 downto 0);
    Dout2 : out std_logic_vector(Obits-1 downto 0)
);
end RAM_Syndromes;

architecture Behavioral of RAM_Syndromes is
type RAM is array (0 to 2**AddrBits-1) of std_logic_vector(Ibits-1 downto 0);
Signal Syndromes : RAM :=
(
    0 => "00000",--0
    1 => "10100",--7
    2 => "11101",--14
    3 => "01001",--29
    4 => "10110",--28
    5 => "00000",--0
    6 => "01011",--27
    7 => "10111",--26
    8 => "11001",--25
    others=>"00000"
);
begin
process(Clk)is
begin
    if rising_edge(Clk) then
        if En = '1' then
            if RW = '1' then
                Syndromes(CONV_INTEGER(Addr)) <= Din;    
            end if;
        end if;
    end if;
end process;
Dout  <= Syndromes(CONV_INTEGER(Addr));
Dout2 <= Syndromes(CONV_INTEGER(Addr2));
end Behavioral;

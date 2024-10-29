
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Ram_Syndroms is
generic
(
    Nbits    : integer:=6;
    AddrBits : integer:=5
);
Port
(
    Clk   : in std_logic;
    En    : in std_logic;
    WR    : in std_logic;
    Addr1 : in std_logic_vector(AddrBits-1 downto 0);
    Addr2 : in std_logic_vector(AddrBits-1 downto 0);
    Din   : in std_logic_vector(Nbits-1 downto 0);
    Dout1 : out std_logic_vector(Nbits-1 downto 0);
    Dout2 : out std_logic_vector(Nbits-1 downto 0)
);
end Ram_Syndroms;

architecture Behavioral of Ram_Syndroms is
type RAM is array (0 to 2**AddrBits-1) of std_logic_vector(Din'Range);

signal Sindromes_RAM : RAM:=
(
   
    others=>"000000"
);
begin
process(Clk) is
begin
    if rising_edge(Clk)then
        if En='1' then
            if WR='1'then
                Sindromes_RAM(CONV_INTEGER(Addr1))<= Din;
            else
                Dout1<=Sindromes_RAM(CONV_INTEGER(Addr1));
                Dout2<=Sindromes_RAM(CONV_INTEGER(Addr2));
            end if;
        end if;
    end if;
end process;

end Behavioral;

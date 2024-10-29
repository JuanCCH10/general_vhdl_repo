----------------------------------------------------------------------------------
-- Company: SEMAR
-- DATA IN SERIE, DATA OUT PARALELO 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------------------------------------
entity convertidorsp is
    Port ( rst : in STD_LOGIC;
            CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           en: in STD_LOGIC;
           Qp : out STD_LOGIC_VECTOR (1 downto 0));
end convertidorsp;

architecture Behavioral of convertidorsp is

signal Q1: std_logic_vector(1 downto 0);

begin
    process (CLK) 
    begin 
        if rst = '1' then
            Q1 <= "00";
        elsif rising_edge (CLK) then
            if en='1' then
           Q1 <= Q1(0)&D;
           end if;
        end if;
    end process;
Qp<=Q1;

end Behavioral;

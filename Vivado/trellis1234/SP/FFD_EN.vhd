----------------------------------------------------------------------------------
-- FFD_EN
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD_EN is
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC_VECTOR (1 downto 0));
end FFD_EN;

architecture Behavioral of FFD_EN is

begin
process (clk) IS
   begin
   if rst = '1' then
     Q <= "00";
   elsif rising_edge (clk) then
    if en = '1' then
        Q <= D;
    end if;
  end if;
end process;   
end Behavioral;

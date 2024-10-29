library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_en is
    generic (Nbits : integer := 6); 
    Port (
        rst, clk, en : in std_logic;
        D : in std_logic_vector(Nbits-1 downto 0);
        Q : out std_logic_vector(Nbits-1 downto 0)
    );
end FF_en;

architecture Behavioral of FF_en is
    signal reg : std_logic_vector(Nbits-1 downto 0);

begin
    reg_enable : process(clk,rst) is begin
        if rst = '1' then
            reg <= (others => '0');
        else
            if en = '1' then
                if rising_edge(clk) then
                    reg <= D;
                end if;
            end if;
        end if; 
    end process;
    Q <= reg;
end Behavioral;

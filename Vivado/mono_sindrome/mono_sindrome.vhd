library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mono_sindrome is
    Port (
        clk, rst : in std_logic;
        simbolo : in std_logic_vector(5 downto 0);
        alpha : in std_logic_vector(5 downto 0);
        sindrome : out std_logic_vector(5 downto 0)
    );
end mono_sindrome;

architecture Behavioral of mono_sindrome is
    
    component prod_alpha is
        Port (
            alphaA : in std_logic_vector(5 downto 0);
            alphaB : in std_logic_vector(5 downto 0);
            alphaR : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal prod_out, sum_out, reg_s : std_logic_vector(5 downto 0);
    
begin   
    sum_out <= simbolo xor prod_out;
    
    registro_s : process(clk, rst) is begin
        if rst = '1' then
            reg_s <= (others => '0');
        elsif rising_edge(clk) then
            reg_s <= sum_out;
        end if;
    end process;
    
    producto : prod_alpha
    port map(
        alphaA => reg_s,
        alphaB => alpha,
        alphaR => prod_out
    );
    
    sindrome <= reg_s;

end Behavioral;

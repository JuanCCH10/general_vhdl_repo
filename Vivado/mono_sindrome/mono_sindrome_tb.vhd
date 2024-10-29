library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mono_sindrome_tb is
end mono_sindrome_tb;

architecture Behavioral of mono_sindrome_tb is

    component mono_sindrome is
        Port (
            clk, rst : in std_logic;
            simbolo : in std_logic_vector(5 downto 0);
            alpha : in std_logic_vector(5 downto 0);
            sindrome : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal simbolo,alpha,sindrome : std_logic_vector(5 downto 0);
    signal clk, rst, en, done : std_logic;
    constant per : time := 10ns;
    
begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : mono_sindrome
    port map(
        clk => clk,
        rst => rst,
        simbolo => simbolo,
        alpha => alpha,
        sindrome => sindrome
    );
    
    estimulos : process is begin
        rst <= '1';
        simbolo <= "000000";
        alpha <= "000000";
        wait for per;
        rst <= '0';
        simbolo <= "000000";
        alpha <= "000001";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000000";
        wait for per;
        simbolo <= "000001";
        wait for per;
        simbolo <= "000001";
        wait for per;
        simbolo <= "000001";
        wait for per;
        simbolo <= "000001";
        wait for per;
        simbolo <= "000001";
        wait;
    end process;

end Behavioral;

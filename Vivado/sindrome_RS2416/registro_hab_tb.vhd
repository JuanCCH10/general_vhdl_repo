library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_hab_tb is
end registro_hab_tb;

architecture Behavioral of registro_hab_tb is

    component registro_hab is
        Port (
            rst, clk, en : in std_logic;
            D : in std_logic_vector(5 downto 0);
            Q : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal rst,clk,en : std_logic;
    signal D,Q : std_logic_vector(5 downto 0);
    signal per : time := 10ns;

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : registro_hab
    port map(
        clk => clk,
        rst => rst,
        en => en,
        D => D,
        Q => Q
    );
    
    estimulos : process begin
        rst <= '1';
        en <= '0';
        D <= "111111";
        wait for per;
        rst <= '0';
        en <= '1';
        wait for 2*per;
        en <= '0';
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        wait;
    end process;
    
end Behavioral;

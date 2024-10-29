library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Et_evaluatorv2_tb is
end Et_evaluatorv2_tb;

architecture Behavioral of Et_evaluatorv2_tb is

    component Et_evaluatorv2 is
    Port(
        c   : in std_logic_vector(35 downto 0);
        Et  : out std_logic_vector(6 downto 0)
    );
    end component;
    
    constant per : time := 10ns;
    signal clk  : std_logic;
    signal c    : std_logic_vector(35 downto 0);
    signal Et   : std_logic_vector(6 downto 0);

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : Et_evaluatorv2
    port map(
        c   => c,
        Et  => Et
    );
    
    estimulos : process is begin
        c <= "000000000000000000000000000000000000";
        wait for 2*per;
        c <= "000000000000000000000000000000000001";
        wait for 2*per;
        c <= "000000000000000000000000000000000011";
        wait for 2*per;
        c <= "000000000000000000000000000000000111";
        wait for 2*per;
        c <= "000000000000000000000000000000001111";
        wait for 2*per;
        c <= "000000000000000000000000000000011111";
        wait for 2*per;
        c <= "000000000000000000000000000000111111";
        wait for 2*per;
        c <= "000000000000000000000000000001111111";
        wait for 2*per;
        c <= "000000000000000000000000000011111111";
        wait for 2*per;
        c <= "000000000000000000000000000111111111";
        wait for 2*per;
        c <= "000000000000000000000000001111111111";
        wait for 2*per;
        c <= "111111111000000000000000000000000000";
        wait for 2*per;
        c <= "000000000000000000000000011111111111";
        wait for 2*per;
        c <= "000000000000000000000000111111111111";
        wait for 2*per;
        c <= "000000000000000000000001111111111111";
        wait for 2*per;
        c <= "000000000000000000000011111111111111";
        wait for 2*per;
        c <= "000000000000000000000111111111111111";
        wait for 2*per;
        c <= "000000000000000000001111111111111111";
        wait for 2*per;
        c <= "000000000000000000011111111111111111";
        wait for 2*per;
        c <= "000000000000000000111111111111111111";
        wait for 2*per;
        c <= "000000000000000001111111111111111111";
        wait for 2*per;
        c <= "000000000000000011111111111111111111";
        wait for 2*per;
        c <= "000000000000000111111111111111111111";
        wait for 2*per;
        c <= "000000000000001111111111111111111111";
        wait for 2*per;
        c <= "000000000000011111111111111111111111";
        wait for 2*per;
        c <= "000000000000111111111111111111111111";
        wait for 2*per;
        c <= "000000000001111111111111111111111111";
        wait for 2*per;
        c <= "000000000011111111111111111111111111";
        wait for 2*per;
        c <= "000000000111111111111111111111111111";
        wait for 2*per;
        c <= "000000001111111111111111111111111111";
        wait for 2*per;
        c <= "000000011111111111111111111111111111";
        wait for 2*per;
        c <= "000000111111111111111111111111111111";
        wait for 2*per;
        c <= "000001111111111111111111111111111111";
        wait for 2*per;
        c <= "000011111111111111111111111111111111";
        wait for 2*per;
        c <= "000111111111111111111111111111111111";
        wait for 2*per;
        c <= "001111111111111111111111111111111111";
        wait for 2*per;
        c <= "011111111111111111111111111111111111";
        wait for 2*per;
        c <= "111111111111111111111111111111111111";
        wait for 2*per;
        
        wait;
    end process;


end Behavioral;

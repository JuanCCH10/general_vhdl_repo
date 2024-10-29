----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.08.2022 09:43:38
-- Design Name: 
-- Module Name: mod_CestVA34_tb - Behavioral
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

entity mod_CestVA34_tb is
end mod_CestVA34_tb;

architecture Behavioral of mod_CestVA34_tb is

    component mod_CestVA34 is
        generic(num_bits : integer := 10);
        Port (
            A, B, C, D, E, F, G, H : in std_logic_vector(num_bits-1 downto 0);
            acc_value : out std_logic_vector(num_bits-1 downto 0);
            est_value : out std_logic_vector(2 downto 0)
        );
    end component;
    
    constant num_b : integer := 10;
    signal a,b,c,d,e,f,g,h, acc_value : std_logic_vector(num_b-1 downto 0);
    signal est_value : std_logic_vector(2 downto 0);
    constant per : time := 10ns;
    signal clk : std_logic;

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : mod_CestVA34
    port map(
        A => a,
        B => b,
        C => c,
        D => d,
        E => e,
        F => f,
        G => g,
        H => h,
        acc_value => acc_value,
        est_value => est_value
    );
    
    estimulos : process begin
        a <= "0000000000";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000000";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000000";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000000";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000000";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000000";
        g <= "0000000010";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000000";
        h <= "0000000010";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000000";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000010";
        d <= "0000000010";
        e <= "0000000010";
        f <= "0000000010";
        g <= "0000000010";
        h <= "0000000010";
        wait;
        --wait for per;
    end process;

end Behavioral;

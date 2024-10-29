----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.08.2022 14:56:57
-- Design Name: 
-- Module Name: CSmin_weightVA12tb - Behavioral
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

entity CSmin_weightVA12tb is
end CSmin_weightVA12tb;

architecture Behavioral of CSmin_weightVA12tb is

component CSmin_weightVA12 is
    generic(num_bits : integer := 10); 
    Port (
        a,b,c,d : in std_logic_vector(num_bits-1 downto 0);
        weight_state : out std_logic_vector(num_bits-1 downto 0)
    );
end component;

constant num_bits : integer := 10;
signal a,b,c,d : std_logic_vector(num_bits-1 downto 0);
signal clk : std_logic;
constant per : time := 10 ns;

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;

    conexiones : CSmin_weightVA12
        port map(
            a => a,
            b => b,
            c => c,
            d => d,
            weight_state => open
        );
    
    estimulos : process begin
        a <= "0000000000";
        b <= "0000000000";
        c <= "0000000000";
        d <= "0000000000";
        wait for per;
        a <= "0000000001";
        b <= "0000000001";
        c <= "0000000001";
        d <= "0000000000";
        wait for per;
        a <= "0000000010";
        b <= "0000000010";
        c <= "0000000001";
        d <= "0000000001";
        wait for per;
        a <= "0000000100";
        b <= "0000000010";
        c <= "0000000001";
        d <= "0000000000";
        wait for per;
        a <= "0000000000";
        b <= "0000000010";
        c <= "0000000100";
        d <= "0000001000";
        wait for per;
        a <= "0000000000";
        b <= "0000000000";
        c <= "0000000000";
        d <= "0000000000";
        wait for per;
        a <= "0000000000";
        b <= "0000000001";
        c <= "0000000001";
        d <= "0000000001";
        wait;
    end process;


end Behavioral;

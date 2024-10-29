----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2022 11:21:37
-- Design Name: 
-- Module Name: modulo_C_VA_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity modulo_C_VA_tb is
end modulo_C_VA_tb;

architecture Behavioral of modulo_C_VA_tb is

component modulo_C_VA is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        G,L,E : out std_logic
    );
end component;

constant num_bits : integer := 10;
signal A : std_logic_vector(num_bits-1 downto 0);
signal B : std_logic_vector(num_bits-1 downto 0);
signal G : std_logic;
signal L : std_logic;
signal E : std_logic;
signal per : time := 10 ns;
signal clk : std_logic;

begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : modulo_C_VA
    port map(
        A => A,
        B => B,
        G => G,
        L => L,
        E => E
    );
    
    estimulos : process begin
        A <= "0000000001";
        B <= "0000000000";
        wait for per;
        A <= "0000000000";
        B <= "0000000001";
        wait for per;
        A <= "0000000001";
        B <= "0000000001";
        wait;
    end process;

end Behavioral;

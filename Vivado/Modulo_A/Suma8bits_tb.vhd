----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2022 10:37:33
-- Design Name: 
-- Module Name: Suma8bits_tb - Behavioral
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

entity Suma8bits_tb is
end Suma8bits_tb;

architecture Behavioral of Suma8bits_tb is

component Suma8bits is
    Port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
end component;

signal A : std_logic_vector(7 downto 0);
signal B : std_logic_vector(7 downto 0);
signal S : std_logic_vector(7 downto 0);
signal clk : std_logic;
signal per : time := 10 ns;

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : Suma8bits
    port map(
        A => A,
        B => B,
        S => S
    );

    estimulos : process begin
        A <= "00000011";
        B <= "00000000";
        wait for per;
        A <= "00001111";
        B <= "00001111";
        wait;
    end process;


end Behavioral;

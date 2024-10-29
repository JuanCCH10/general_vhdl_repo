----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2022 08:26:22
-- Design Name: 
-- Module Name: Suma16bits_tb - Behavioral
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

entity Suma16bits_tb is
end Suma16bits_tb;

architecture Behavioral of Suma16bits_tb is

component Suma16bits is
    Port ( DIN  : in STD_LOGIC_VECTOR (15 downto 0);
           Dout : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal clk : std_logic;
signal per : time := 10 ns;
signal din : std_logic_vector(15 downto 0);
signal dout : std_logic_vector(4 downto 0);

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : Suma16bits
    port map(
        DIN => din,
        Dout => dout 
    );
    
    estimulos : process begin
        din <= "0000000011111111";
        wait for per;
        din <= "0000000000000001";
        wait for per;
        din <= "0000000000000010";
        wait for per;
        din <= "0000000010000000";
        wait;
    end process;


end Behavioral;

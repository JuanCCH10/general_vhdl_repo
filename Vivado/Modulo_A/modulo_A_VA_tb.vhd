----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2022 14:42:59
-- Design Name: 
-- Module Name: modulo_A_VA_tb - Behavioral
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

entity modulo_A_VA_tb is
end modulo_A_VA_tb;

architecture Behavioral of modulo_A_VA_tb is

component modulo_A_VA is
    Port (
        dato_rx : in std_logic_vector(3 downto 0);
        dato_est : in std_logic_vector(3 downto 0);
        peso_acc : in std_logic_vector(7 downto 0);
        peso_ai : out std_logic_vector(7 downto 0)
    );
end component;

signal dato_rx : std_logic_vector(3 downto 0);
signal dato_est : std_logic_vector(3 downto 0);
signal peso_acc : std_logic_vector(7 downto 0);
signal peso_ai : std_logic_vector(7 downto 0);
signal per : time := 10 ns;
signal clk : std_logic;

begin
clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;

conex_est : modulo_A_VA
port map(
    dato_rx => dato_rx,
    dato_est => dato_est,
    peso_acc => peso_acc,
    peso_ai => peso_ai
);

estimulos : process begin
    peso_acc <= "00001111"; 
    dato_rx <= "0011";
    dato_est <= "0011";
    wait for per;
    dato_rx <= "0001";
    dato_est <= "0011";
    wait for per;
    dato_rx <= "0000";
    dato_est <= "0011";
    wait for per;
    dato_rx <= "0111";
    dato_est <= "0011";
    wait for per;
    dato_rx <= "1111";
    dato_est <= "0011";
    wait;

end process;


end Behavioral;

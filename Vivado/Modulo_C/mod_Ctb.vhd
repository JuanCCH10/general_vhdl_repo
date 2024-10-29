----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 09:14:49
-- Design Name: 
-- Module Name: mod_Ctb - Behavioral
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

entity mod_Ctb is
end mod_Ctb;

architecture Behavioral of mod_Ctb is

component mod_C is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0)
    );
end component;

constant num_bits : integer := 10;
signal A : std_logic_vector(num_bits-1 downto 0);
signal B : std_logic_vector(num_bits-1 downto 0);
signal val_out : std_logic_vector(num_bits-1 downto 0);
signal per : time := 10 ns;
signal clk : std_logic;

begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : mod_C
    port map(
        A => A,
        B => B,
        val_out => val_out
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

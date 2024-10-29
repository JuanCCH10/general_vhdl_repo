----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 09:12:31
-- Design Name: 
-- Module Name: mod_C2 - Behavioral
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

entity mod_C2 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0)
    );
end mod_C2;

architecture Behavioral of mod_C2 is

component mod_C is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0)
    );
end component;

signal ABout : std_logic_vector(num_bits-1 downto 0);
signal CDout : std_logic_vector(num_bits-1 downto 0);

begin

    AB : mod_C
    port map(
        A => A,
        B => B,
        val_out => ABout
    );
    
    CD : mod_C
    port map(
        A => C,
        B => D,
        val_out => CDout
    );
    
    ABCD : mod_C
    port map(
        A => ABout,
        B => CDout,
        val_out => val_out
    );

end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 09:33:50
-- Design Name: 
-- Module Name: mod_C4 - Behavioral
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

entity mod_C4 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D, E, F, G, H : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0)
    );
end mod_C4;

architecture Behavioral of mod_C4 is

    component mod_C is
        generic(num_bits : integer := 10);
        Port (
            A, B : in std_logic_vector(num_bits-1 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0)
        );
    end component;
    
    signal ABout : std_logic_vector(num_bits-1 downto 0);
    signal CDout : std_logic_vector(num_bits-1 downto 0);
    signal EFout : std_logic_vector(num_bits-1 downto 0);
    signal GHout : std_logic_vector(num_bits-1 downto 0);
    signal ABCDout : std_logic_vector(num_bits-1 downto 0);
    signal EFGHout : std_logic_vector(num_bits-1 downto 0);
    
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
    
    EF : mod_C
    port map(
        A => E,
        B => F,
        val_out => EFout
    );
    
    GH : mod_C
    port map(
        A => G,
        B => H,
        val_out => GHout
    );
    
    ABCD : mod_C
    port map(
        A => ABout,
        B => CDout,
        val_out => ABCDout
    );
    
    EFGH : mod_C
    port map(
        A => EFout,
        B => GHout,
        val_out => EFGHout
    );
    
    Decision : mod_C
    port map(
        A => ABCDout,
        B => EFGHout,
        val_out => val_out
    );

end Behavioral;

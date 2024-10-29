----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 11:41:18
-- Design Name: 
-- Module Name: mod_CestVA12 - Behavioral
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

entity mod_CestVA12 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
        acc_value : out std_logic_vector(num_bits-1 downto 0);
        est_value : out std_logic_vector(1 downto 0)
    );
end mod_CestVA12;

architecture Behavioral of mod_CestVA12 is

component mod_Cest is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0);
        est_out : out std_logic_vector(1 downto 0)
    );
end component;

component mod_Cest2 is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0);
        est_out : out std_logic_vector(1 downto 0)
    );
end component;

component mod_Cest3 is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        estA, estB : in std_logic_vector(1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0);
        est_out : out std_logic_vector(1 downto 0)
    );
end component;

signal estacc01_out : std_logic_vector(num_bits-1 downto 0);
signal estacc23_out : std_logic_vector(num_bits-1 downto 0);
signal est01_out : std_logic_vector(1 downto 0);
signal est23_out : std_logic_vector(1 downto 0);

begin

    eval_est01 : mod_Cest
    port map(
        A => A,
        B => B,
        val_out => estacc01_out,
        est_out => est01_out
    );
    
    eval_est23 : mod_Cest2
    port map(
        A => C,
        B => D,
        val_out => estacc23_out,
        est_out => est23_out
    );
    
    eval_est : mod_Cest3
    port map(
        A => estacc01_out,
        B => estacc23_out,
        estA => est01_out,
        estB => est23_out,
        val_out => acc_value,
        est_out => est_value
    );


end Behavioral;

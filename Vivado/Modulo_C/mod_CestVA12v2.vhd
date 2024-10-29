----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.08.2022 11:24:28
-- Design Name: 
-- Module Name: mod_CestVA12v2 - Behavioral
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

entity mod_CestVA12v2 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
        acc_value : out std_logic_vector(num_bits-1 downto 0);
        est_value : out std_logic_vector(1 downto 0)
    );
end mod_CestVA12v2;

architecture Behavioral of mod_CestVA12v2 is

    component mod_CestAB is
        generic(num_bits : integer := 10);
        Port (
            A, B : in std_logic_vector(num_bits-1 downto 0);
            Av, Bv : in std_logic_vector(2 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0);
            est_out : out std_logic_vector(2 downto 0)
        );
    end component;
    
    type conec1_val is array (0 to 1) of std_logic_vector(num_bits-1 downto 0);
    signal conv1 : conec1_val;
    
    type conec1_est is array (0 to 1) of std_logic_vector(2 downto 0);
    signal cons1 : conec1_est;
    
    signal trans : std_logic_vector(2 downto 0);
    
begin

    AB : mod_CestAB
    port map(
        A => A,
        B => B,
        Av => "000",
        Bv => "001",
        val_out => conv1(0),
        est_out => cons1(0)
    );
    CD : mod_CestAB
    port map(
        A => C,
        B => D,
        Av => "010",
        Bv => "011",
        val_out => conv1(1),
        est_out => cons1(1)
    );
    
    ABCD : mod_CestAB
    port map(
        A => conv1(0),
        B => conv1(1),
        Av => cons1(0),
        Bv => cons1(1),
        val_out => acc_value,
        est_out => trans
    );
    
    est_value <= trans(1 downto 0);

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2022 15:43:18
-- Design Name: 
-- Module Name: mod_CestVA34 - Behavioral
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

entity mod_CestVA34 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D, E, F, G, H : in std_logic_vector(num_bits-1 downto 0);
        acc_value : out std_logic_vector(num_bits-1 downto 0);
        est_value : out std_logic_vector(2 downto 0)
    );
end mod_CestVA34;

architecture Behavioral of mod_CestVA34 is

    component mod_CestAB is
        generic(num_bits : integer := 10);
        Port (
            A, B : in std_logic_vector(num_bits-1 downto 0);
            Av, Bv : in std_logic_vector(2 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0);
            est_out : out std_logic_vector(2 downto 0)
        );
    end component;
    
    --conexiones para valor
    type conec1_val is array (0 to 3) of std_logic_vector(num_bits-1 downto 0);
    signal conv1 : conec1_val;
    type conec2_val is array (0 to 1) of std_logic_vector(num_bits-1 downto 0);
    signal conv2 : conec2_val; 
    
    --conexiones para estados
    type conec1_est is array (0 to 3) of std_logic_vector(2 downto 0);
    signal cons1 : conec1_est;
    type conec2_est is array (0 to 1) of std_logic_vector(2 downto 0);
    signal cons2 : conec2_est;

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
        val_out => conv2(0),
        est_out => cons2(0)
    );
    
    EF : mod_CestAB
    port map(
        A => E,
        B => F,
        Av => "100",
        Bv => "101",
        val_out => conv1(2),
        est_out => cons1(2)
    );
    GH : mod_CestAB
    port map(
        A => G,
        B => H,
        Av => "110",
        Bv => "111",
        val_out => conv1(3),
        est_out => cons1(3)
    );
    EFGH : mod_CestAB
    port map(
        A => conv1(2),
        B => conv1(3),
        Av => cons1(2),
        Bv => cons1(3),
        val_out => conv2(1),
        est_out => cons2(1)
    );
    
    A_H : mod_CestAB
    port map(
        A => conv2(0),
        B => conv2(1),
        Av => cons2(0),
        Bv => cons2(1),
        val_out => acc_value,
        est_out => est_value
    );

end Behavioral;

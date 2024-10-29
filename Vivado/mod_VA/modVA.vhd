----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.08.2022 10:38:05
-- Design Name: 
-- Module Name: modVA - Behavioral
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

entity modVA is
    Port (
        clk, rst, cs, sel : in std_logic;
        dibits : in std_logic_vector(3 downto 0);
        est_r : out std_logic_vector(2 downto 0)
    );
end modVA;

architecture Behavioral of modVA is

    component modAC_VA12 is
        Port (
            clk, rst, ce : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            est_r : out std_logic_vector(1 downto 0)
        );
    end component;

    component modAC_VA34 is
        Port (
            clk, rst, ce : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            est_r : out std_logic_vector(2 downto 0)
        );
    end component;

begin
    
    Viterbi_12 : modAC_VA12
    port map(
        clk => clk,
        rst => rst,
        ce => cs,
        dibits_rx => dibits,
        est_r => est_r(1 downto 0)
    );
    
    Viterbi_34 : modAC_VA34
    port map(
        clk => clk,
        rst => rst,
        ce => cs,
        dibits_rx => dibits,
        est_r => est_r(2 downto 0)
    ); 


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 14:14:07
-- Design Name: 
-- Module Name: modA_VA12 - Behavioral
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

entity modA_VA12 is
    Port (
        val_rx : std_logic_vector(3 downto 0);
        val_acc : in std_logic_vector(7 downto 0)
    );
end modA_VA12;

architecture Behavioral of modA_VA12 is

    component modulo_A_VA is
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(7 downto 0);
            peso_ai : out std_logic_vector(7 downto 0)
        );
    end component;

begin


end Behavioral;

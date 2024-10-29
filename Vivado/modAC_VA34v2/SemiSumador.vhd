----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2022 10:24:43
-- Design Name: 
-- Module Name: SemiSumador - Behavioral
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

entity SemiSumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           S    : out STD_LOGIC;
           C    : out STD_LOGIC);
end SemiSumador;

architecture Behavioral of SemiSumador is

begin
S <= (A xor B);
C <= (A and B);
end Behavioral;

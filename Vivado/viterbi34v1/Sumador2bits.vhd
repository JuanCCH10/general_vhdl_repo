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

entity Sumador2bits is
    Port ( A    : in STD_LOGIC_VECTOR(1 downto 0);
           B    : in STD_LOGIC_VECTOR(1 downto 0);
           S    : out STD_LOGIC_VECTOR(1 downto 0);
           Cout : out STD_LOGIC);
end Sumador2bits;

architecture Behavioral of Sumador2bits is

component SemiSumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           S    : out STD_LOGIC;
           C    : out STD_LOGIC);
end component;

component Sumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal C1, C2:std_logic;

begin

Sum1:SemiSumador 
Port Map ( A    => A(0),
           B    => B(0),
           S    => S(0),
           C    => C1);

Sum2: Sumador
Port Map ( A    =>A(1),
           B    =>B(1),
           Cin  =>C1,
           S    =>S(1),
           Cout =>Cout);          

end Behavioral;

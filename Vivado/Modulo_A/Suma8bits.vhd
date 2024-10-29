----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2022 09:06:41
-- Design Name: 
-- Module Name: Suma8bits - Behavioral
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

entity Suma8bits is
    Port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
end Suma8bits;

architecture Behavioral of Suma8bits is

component Sumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal resultado : std_logic_vector(7 downto 0);
signal carry_0 : std_logic := '0';

TYPE Array_Type1 IS ARRAY (0 TO 8) OF STD_LOGIC;
signal carry : Array_Type1;

begin

sb0 : Sumador 
port map(
    A => A(0),
    B => B(0),
    Cin => carry_0,
    S => resultado(0),
    Cout => carry(0)
);

sb1 : Sumador 
port map(
    A => A(1),
    B => B(1),
    Cin => carry(0),
    S => resultado(1),
    Cout => carry(2)
);

sb2 : Sumador 
port map(
    A => A(2),
    B => B(2),
    Cin => carry(2),
    S => resultado(2),
    Cout => carry(3)
);

sb3 : Sumador 
port map(
    A => A(3),
    B => B(3),
    Cin => carry(3),
    S => resultado(3),
    Cout => carry(4)
);

sb4 : Sumador 
port map(
    A => A(4),
    B => B(4),
    Cin => carry(4),
    S => resultado(4),
    Cout => carry(5)
);

sb5 : Sumador 
port map(
    A => A(5),
    B => B(5),
    Cin => carry(5),
    S => resultado(5),
    Cout => carry(6)
);

sb6 : Sumador 
port map(
    A => A(6),
    B => B(6),
    Cin => carry(6),
    S => resultado(6),
    Cout => carry(7)
);

sb7 : Sumador 
port map(
    A => A(7),
    B => B(7),
    Cin => carry(7),
    S => resultado(7),
    Cout => carry(8)
);

S <= resultado;

end Behavioral;

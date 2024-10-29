library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Sumador;

architecture Behavioral of Sumador is

begin
S <= (A xor B) xor Cin;
Cout <= (A and B) xor ((A xor B) and Cin);
end Behavioral;

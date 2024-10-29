----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2022 14:22:17
-- Design Name: 
-- Module Name: modulo_A_VA - Behavioral
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

entity modulo_A_VA is
    Port (
        dato_rx : in std_logic_vector(3 downto 0);
        dato_est : in std_logic_vector(3 downto 0);
        peso_acc : in std_logic_vector(7 downto 0);
        peso_ai : out std_logic_vector(7 downto 0)
    );
end modulo_A_VA;

architecture Behavioral of modulo_A_VA is

component Semisumador is 
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           S    : out STD_LOGIC;
           C    : out STD_LOGIC);
end component;

component Sumador2bits is
    Port ( A    : in STD_LOGIC_VECTOR(1 downto 0);
           B    : in STD_LOGIC_VECTOR(1 downto 0);
           S    : out STD_LOGIC_VECTOR(1 downto 0);
           Cout : out STD_LOGIC);
end component;

component Suma8bits is
    Port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
end component;

signal p_inst : std_logic_vector(2 downto 0);
signal op_xor : std_logic_vector(3 downto 0);
signal semi_A : std_logic_vector(1 downto 0);
signal semi_B : std_logic_vector(1 downto 0);
signal peso_inst : std_logic_vector(2 downto 0);

begin

op_xor <= dato_rx xor dato_est;

semi1 : Semisumador
port map(
    A => op_xor(3),
    B => op_xor(2),
    S => semi_A(0),
    C => semi_A(1)
);

semi2 : Semisumador
port map(
    A => op_xor(1),
    B => op_xor(0),
    S => semi_B(0),
    C => semi_B(1)
);

sum : Sumador2bits
port map(
    A => semi_A,
    B => semi_B,
    S => peso_inst(1 downto 0),
    Cout => peso_inst(2)
);

suma_acc : Suma8bits
port map(
    A => peso_acc,
    B => "00000" & peso_inst,
    S => peso_ai
);

end Behavioral;

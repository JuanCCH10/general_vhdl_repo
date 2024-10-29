----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.08.2022 15:14:12
-- Design Name: 
-- Module Name: sumador_nbits - Behavioral
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

entity sumador_nbits is
    generic(nbits : integer := 9);
    Port (
        A : in std_logic_vector(nbits-1 downto 0);
        B : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits downto 0)
    );
end sumador_nbits;

architecture Behavioral of sumador_nbits is

component Sumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
signal resultado : std_logic_vector(nbits downto 0);
signal carry_0 : std_logic := '0';
type carrys is array (0 to nbits) of std_logic;
signal carry : carrys;

begin
    Inst_Sumador : for I in 0 to nbits-1 generate
        inicio : if I = 0 generate
            sumador_1bit : Sumador
            port map(
                A => A(I),
                B => B(I),
                Cin => carry_0,
                S => resultado(I),
                Cout => carry(I)
            );
        end generate inicio;
        
        resto : if I > 0 and I < nbits-1 generate
            sumador_1bit : Sumador
            port map(
                A => A(I),
                B => B(I),
                Cin => carry(I-1),
                S => resultado(I),
                Cout => carry(I)
            );
        end generate resto;
        
        fin : if I = nbits-1 generate
            sumador_1bit : Sumador
            port map(
                A => A(I),
                B => B(I),
                Cin => carry(I-1),
                S => resultado(I),
                Cout => resultado(I+1)
            );
        end generate fin;
    end generate;
    S <= resultado;

end Behavioral;

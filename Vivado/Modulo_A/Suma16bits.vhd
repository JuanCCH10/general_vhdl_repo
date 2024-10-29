----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2022 06:09:23
-- Design Name: 
-- Module Name: SumadorParte1 - Behavioral
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

entity Suma16bits is
    Port ( DIN  : in STD_LOGIC_VECTOR (15 downto 0);
           Dout : out STD_LOGIC_VECTOR (4 downto 0));
end Suma16bits;

architecture Behavioral of Suma16bits is
component SemiSumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           S    : out STD_LOGIC;
           C    : out STD_LOGIC);
end component;
signal S1,C1: std_logic_vector(7 downto 0);

TYPE Array_Type1 IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(1 downto 0);
signal S1_1: Array_Type1;

TYPE Array_Type2 IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(1 downto 0);
signal S2: Array_Type2;
signal C2: std_logic_vector(3 downto 0);

TYPE Array_Type3 IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(2 downto 0);
signal S2_1: Array_Type3;

TYPE Array_Type4 IS ARRAY (0 TO 1) OF STD_LOGIC_VECTOR(2 downto 0);
signal S3: Array_Type4;
signal C3: std_logic_vector(3 downto 0);

TYPE Array_Type5 IS ARRAY (0 TO 1) OF STD_LOGIC_VECTOR(3 downto 0);
signal S3_1: Array_Type5;


component Sumador2bits is
    Port ( A    : in STD_LOGIC_VECTOR(1 downto 0);
           B    : in STD_LOGIC_VECTOR(1 downto 0);
           S    : out STD_LOGIC_VECTOR(1 downto 0);
           Cout : out STD_LOGIC);
end component;

component Sumador3bits is
    Port ( A    : in STD_LOGIC_VECTOR(2 downto 0);
           B    : in STD_LOGIC_VECTOR(2 downto 0);
           S    : out STD_LOGIC_VECTOR(2 downto 0);
           Cout : out STD_LOGIC);
end component;

component Sumador4bits is
    Port ( A    : in STD_LOGIC_VECTOR(3 downto 0);
           B    : in STD_LOGIC_VECTOR(3 downto 0);
           S    : out STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC);
end component;

begin

Nivel1: for i in 0 to 7 generate
    Semi:SemiSumador 
    Port Map ( A    => DIN(i),
               B    => DIN(i+8),
               S    => S1(i),
               C    => C1(i));
    
    S1_1(i) <= C1(i) & S1(i); 
end generate;

--Nivel2: for i in 0 to 3 generate
--    Suma2bits:Sumador2bits
--    Port Map ( A    => S1_1(i),
--               B    => S1_1(i+4),
--               S    => S2(i),
--               Cout => C2(i)); 
--S2_1(i) <= C2(i) & S2(i);
--end generate;

Sum2b0 : Sumador2bits
port map(
    A    => S1_1(0),
    B    => S1_1(1),
    S    => S2(0),
    Cout => C2(0)
);
S2_1(0) <= C2(0) & S2(0);

Sum2b1 : Sumador2bits
port map(
    A    => S1_1(2),
    B    => S1_1(3),
    S    => S2(1),
    Cout => C2(1)
);
S2_1(1) <= C2(1) & S2(1);

Sum2b2 : Sumador2bits
port map(
    A    => S1_1(4),
    B    => S1_1(5),
    S    => S2(2),
    Cout => C2(2)
);
S2_1(2) <= C2(2) & S2(2);

Sum2b3 : Sumador2bits
port map(
    A    => S1_1(6),
    B    => S1_1(7),
    S    => S2(3),
    Cout => C2(3)
);
S2_1(3) <= C2(3) & S2(3);

--Nivel3: for i in 0 to 1 generate
--    Suma3bits:Sumador3bits
--    Port Map ( A    => S2_1(i),
--               B    => S2_1(i+2),
--               S    => S3(i),
--               Cout => C3(i)); 
--    S3_1(i) <= C3(i) & S3(i);
--end generate;

Sum3b0:Sumador3bits
Port Map ( A    => S2_1(0),
           B    => S2_1(1),
           S    => S3(0),
           Cout => C3(0)
); 
S3_1(0) <= C3(0) & S3(0);

Sum3b1:Sumador3bits
Port Map ( A    => S2_1(2),
           B    => S2_1(3),
           S    => S3(1),
           Cout => C3(1)
); 
S3_1(1) <= C3(1) & S3(1);



Suma4bits:Sumador4bits
Port Map ( A    => S3_1(0),
           B    => S3_1(1),
           S    => Dout(3 downto 0),
           Cout => Dout(4));                      

end Behavioral;

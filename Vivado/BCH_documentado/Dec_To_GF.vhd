----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Description: Convierte del campo de Galois a Exponentes 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Dec_To_GF is
Generic(Bits5 : integer:=5);
Port
(
    G1_d   : in std_logic_vector(Bits5-1 downto 0);
    G1_Ax  : in std_logic_vector(Bits5-1 downto 0);
    Exp_d  : out std_logic_vector(Bits5-1 downto 0);
    Exp_Ax : out std_logic_vector(Bits5-1 downto 0)
);
end Dec_To_GF;

architecture Behavioral of Dec_To_GF is
Signal Exp : std_logic_vector(Bits5-1 downto 0);
begin

Exp_d <= "00000" when G1_d = "00001" else
         "00001" when G1_d = "00010" else
         "00010" when G1_d = "00100" else
         "00011" when G1_d = "01000" else
         "00100" when G1_d = "10000" else
         "00101" when G1_d = "00101" else
         "00110" when G1_d = "01010" else
         "00111" when G1_d = "10100" else
         "01000" when G1_d = "01101" else
         "01001" when G1_d = "11010" else
         "01010" when G1_d = "10001" else
         "01011" when G1_d = "00111" else
         "01100" when G1_d = "01110" else
         "01101" when G1_d = "11100" else
         "01110" when G1_d = "11101" else
         "01111" when G1_d = "11111" else
         "10000" when G1_d = "11011" else
         "10001" when G1_d = "10011" else
         "10010" when G1_d = "00011" else
         "10011" when G1_d = "00110" else
         "10100" when G1_d = "01100" else
         "10101" when G1_d = "11000" else
         "10110" when G1_d = "10101" else
         "10111" when G1_d = "01111" else
         "11000" when G1_d = "11110" else
         "11001" when G1_d = "11001" else
         "11010" when G1_d = "10111" else
         "11011" when G1_d = "01011" else
         "11100" when G1_d = "10110" else
         "11101" when G1_d = "01001" else
         "11110" when G1_d = "10010" else
         "11111" when G1_d = "00001" else
         "00000";

Exp_Ax <= "00000" when G1_Ax = "00001" else    
          "00001" when G1_Ax = "00010" else    
          "00010" when G1_Ax = "00100" else    
          "00011" when G1_Ax = "01000" else    
          "00100" when G1_Ax = "10000" else    
          "00101" when G1_Ax = "00101" else    
          "00110" when G1_Ax = "01010" else    
          "00111" when G1_Ax = "10100" else    
          "01000" when G1_Ax = "01101" else    
          "01001" when G1_Ax = "11010" else    
          "01010" when G1_Ax = "10001" else    
          "01011" when G1_Ax = "00111" else    
          "01100" when G1_Ax = "01110" else    
          "01101" when G1_Ax = "11100" else    
          "01110" when G1_Ax = "11101" else    
          "01111" when G1_Ax = "11111" else    
          "10000" when G1_Ax = "11011" else    
          "10001" when G1_Ax = "10011" else    
          "10010" when G1_Ax = "00011" else    
          "10011" when G1_Ax = "00110" else    
          "10100" when G1_Ax = "01100" else    
          "10101" when G1_Ax = "11000" else    
          "10110" when G1_Ax = "10101" else    
          "10111" when G1_Ax = "01111" else    
          "11000" when G1_Ax = "11110" else    
          "11001" when G1_Ax = "11001" else    
          "11010" when G1_Ax = "10111" else    
          "11011" when G1_Ax = "01011" else    
          "11100" when G1_Ax = "10110" else    
          "11101" when G1_Ax = "01001" else    
          "11110" when G1_Ax = "10010" else    
          "11111" when G1_Ax = "00001" else
          "00000";       
       
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_alpha2bits is
    Port (
        pointer : in std_logic_vector(5 downto 0); --dir 0 -> 62
        value : out std_logic_vector(5 downto 0)
    );
end mux_alpha2bits;

architecture Behavioral of mux_alpha2bits is

begin
--            bits                   alpha^
   value <= "000001" when pointer = "000000" else --pointer 2 alpha^0
            "000010" when pointer = "000001" else
            "000100" when pointer = "000010" else
            "001000" when pointer = "000011" else
            "010000" when pointer = "000100" else
            "100000" when pointer = "000101" else
            "000011" when pointer = "000110" else
            "000110" when pointer = "000111" else
            "001100" when pointer = "001000" else
            "011000" when pointer = "001001" else
            "110000" when pointer = "001010" else
            "100011" when pointer = "001011" else
            "000101" when pointer = "001100" else
            "001010" when pointer = "001101" else
            "010100" when pointer = "001110" else
            "101000" when pointer = "001111" else
            "010011" when pointer = "010000" else
            "100110" when pointer = "010001" else
            "001111" when pointer = "010010" else
            "011110" when pointer = "010011" else
            "111100" when pointer = "010100" else
            "111011" when pointer = "010101" else
            "110101" when pointer = "010110" else
            "101001" when pointer = "010111" else
            "010001" when pointer = "011000" else
            "100010" when pointer = "011001" else
            "000111" when pointer = "011010" else
            "001110" when pointer = "011011" else
            "011100" when pointer = "011100" else
            "111000" when pointer = "011101" else
            "110011" when pointer = "011110" else
            "100101" when pointer = "011111" else
            "001001" when pointer = "100000" else
            "010010" when pointer = "100001" else
            "100100" when pointer = "100010" else
            "001011" when pointer = "100011" else
            "010110" when pointer = "100100" else
            "101100" when pointer = "100101" else
            "011011" when pointer = "100110" else
            "110110" when pointer = "100111" else
            "101111" when pointer = "101000" else
            "011101" when pointer = "101001" else
            "111010" when pointer = "101010" else
            "110111" when pointer = "101011" else
            "101101" when pointer = "101100" else
            "011001" when pointer = "101101" else
            "110010" when pointer = "101110" else
            "100111" when pointer = "101111" else
            "001101" when pointer = "110000" else
            "011010" when pointer = "110001" else
            "110100" when pointer = "110010" else
            "101011" when pointer = "110011" else
            "010101" when pointer = "110100" else
            "101010" when pointer = "110101" else
            "010111" when pointer = "110110" else
            "101110" when pointer = "110111" else
            "011111" when pointer = "111000" else
            "111110" when pointer = "111001" else
            "111111" when pointer = "111010" else
            "111101" when pointer = "111011" else
            "111001" when pointer = "111100" else
            "110001" when pointer = "111101" else
            "100001" when pointer = "111110" else
            "000001";
end Behavioral;
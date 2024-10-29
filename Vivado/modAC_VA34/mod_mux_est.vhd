----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2022 10:04:26
-- Design Name: 
-- Module Name: mod_mux_est - Behavioral
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

entity mod_mux_est is
    Port (
        caso : in std_logic;
        sel_mux : in std_logic_vector(2 downto 0);
        out_mux_est0, out_mux_est1, out_mux_est2, out_mux_est3, out_mux_est4, out_mux_est5, out_mux_est6, out_mux_est7 : out std_logic_vector(3 downto 0)
    );
end mod_mux_est;

architecture Behavioral of mod_mux_est is
    constant estados : integer := 8;

    type valor_est is array (0 to estados-1) of std_logic_vector(3 downto 0);
    signal out_mux_est : valor_est;
    
    type selector_est is array (0 to estados-1) of std_logic_vector(2 downto 0);
    signal sel_mux_est : selector_est;

begin
    -- 2 posibles casos
    -- inicio : deben usarse los valores por estado(mux) = 0, 4, 1, 5, 3, 7, 2, 6 (todos los valores de la columna de input 0)
    -- desarrollo & fin : debe obedecer al selector sel_mux &: deben usarse los valores por estado(mux) = 0, 8, 4, 12, 2, 10, 6, 14 (todos los mux apuntando a 000)
    
    --inicio
    out_mux_est0 <= "0000" when (caso = '0') else out_mux_est(0);
    out_mux_est1 <= "0100" when (caso = '0') else out_mux_est(1);
    out_mux_est2 <= "0001" when (caso = '0') else out_mux_est(2);
    out_mux_est3 <= "0101" when (caso = '0') else out_mux_est(3);
    out_mux_est4 <= "0011" when (caso = '0') else out_mux_est(4);
    out_mux_est5 <= "0111" when (caso = '0') else out_mux_est(5);
    out_mux_est6 <= "0010" when (caso = '0') else out_mux_est(6);
    out_mux_est7 <= "0110" when (caso = '0') else out_mux_est(7);
    
    
    --Mux est 0
    out_mux_est(0) <= "0000" when (sel_mux = "000") else
            "0100" when (sel_mux = "001") else
            "0001" when (sel_mux = "010") else
            "0101" when (sel_mux = "011") else
            "0011" when (sel_mux = "100") else
            "0111" when (sel_mux = "101") else
            "0010" when (sel_mux = "110") else
            "0110";
    --Mux est 1
    out_mux_est(1) <= "1000" when (sel_mux = "000") else
            "1100" when (sel_mux = "001") else
            "1001" when (sel_mux = "010") else
            "1101" when (sel_mux = "011") else
            "1011" when (sel_mux = "100") else
            "1111" when (sel_mux = "101") else
            "1010" when (sel_mux = "110") else
            "1110";
    --Mux est 2
    out_mux_est(2) <= "0100" when (sel_mux = "000") else
            "0010" when (sel_mux = "001") else
            "0101" when (sel_mux = "010") else
            "0011" when (sel_mux = "011") else
            "0111" when (sel_mux = "100") else
            "0001" when (sel_mux = "101") else
            "0110" when (sel_mux = "110") else
            "0000";
    --Mux est 3
    out_mux_est(3) <= "1100" when (sel_mux = "000") else
            "1010" when (sel_mux = "001") else
            "1101" when (sel_mux = "010") else
            "1011" when (sel_mux = "011") else
            "1111" when (sel_mux = "100") else
            "1001" when (sel_mux = "101") else
            "1110" when (sel_mux = "110") else
            "1000";
    --Mux est 4
    out_mux_est(4) <= "0010" when (sel_mux = "000") else
            "0110" when (sel_mux = "001") else
            "0011" when (sel_mux = "010") else
            "0111" when (sel_mux = "011") else
            "0001" when (sel_mux = "100") else
            "0101" when (sel_mux = "101") else
            "0000" when (sel_mux = "110") else
            "0100";
    --Mux est 5
    out_mux_est(5) <= "1010" when (sel_mux = "000") else
            "1110" when (sel_mux = "001") else
            "1011" when (sel_mux = "010") else
            "1111" when (sel_mux = "011") else
            "1001" when (sel_mux = "100") else
            "1101" when (sel_mux = "101") else
            "1000" when (sel_mux = "110") else
            "1100";
    --Mux est 6
    out_mux_est(6) <= "0110" when (sel_mux = "000") else
            "0000" when (sel_mux = "001") else
            "0111" when (sel_mux = "010") else
            "0001" when (sel_mux = "011") else
            "0101" when (sel_mux = "100") else
            "0011" when (sel_mux = "101") else
            "0100" when (sel_mux = "110") else
            "0010";
    --Mux est 7
    out_mux_est(7) <= "1110" when (sel_mux = "000") else
            "1000" when (sel_mux = "001") else
            "1111" when (sel_mux = "010") else
            "1001" when (sel_mux = "011") else
            "1101" when (sel_mux = "100") else
            "1011" when (sel_mux = "101") else
            "1100" when (sel_mux = "110") else
            "1010";


end Behavioral;

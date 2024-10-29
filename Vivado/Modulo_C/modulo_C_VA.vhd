----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2022 11:12:42
-- Design Name: 
-- Module Name: modulo_C_VA - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity modulo_C_VA is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        G,L,E : out std_logic
    );
end modulo_C_VA;

architecture Behavioral of modulo_C_VA is
signal aux : std_logic_vector(2 downto 0);

begin
process (A, B) is begin
    if A = B then
        aux <= "001";
--        G <= '0';
--        L <= '0';
--        E <= '1';
    elsif A > B then
        aux <= "100";
--        G <= '1';
--        L <= '0';
--        E <= '0';
    else
        aux <= "010";
--        G <= '0';
--        L <= '1';
--        E <= '0';
    end if;
end process;

G <= aux(2);
L <= aux(1);
E <= aux(0);

end Behavioral;

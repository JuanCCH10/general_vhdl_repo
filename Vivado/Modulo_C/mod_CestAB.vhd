----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2022 15:54:18
-- Design Name: 
-- Module Name: mod_CestAB - Behavioral
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

entity mod_CestAB is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        Av, Bv : in std_logic_vector(2 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0);
        est_out : out std_logic_vector(2 downto 0)
    );
end mod_CestAB;

architecture Behavioral of mod_CestAB is

    signal selector : std_logic_vector(1 downto 0);
    signal aL, bL : std_logic;

begin

--process (A, B) is begin
--    if A < B then
--        aL <= '1';
--        bL <= '0';
--    elsif B < A then
--        aL <= '0';
--        bL <= '1';               
--    elsif A = B then
--        aL <= '1';
--        bL <= '0';
--    elsif B = A then
--        aL <= '1';
--        bL <= '0';
--    elsif B > A then
--        aL <= '1';
--        bL <= '0';
--    else 
--        aL <= '0';
--        bL <= '1';
--    end if;
--end process;
--selector <= aL & bL;
selector <= "10" when A<B else
            "01" when B<A else
            "10" when (A=B and B=A) else
            "10" when B>A else
            "01";

val_out <= A when (selector = "10") else
            B when (selector = "01") else
            (others => '0') when (selector = "00") else
            (others => '1');
            
est_out <= Av when (selector = "10") else
            Bv when (selector = "01") else
            (others => '0') when (selector = "00") else
            (others => '1');


end Behavioral;

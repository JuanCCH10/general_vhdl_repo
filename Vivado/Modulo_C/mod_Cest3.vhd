----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 11:38:29
-- Design Name: 
-- Module Name: mod_Cest3 - Behavioral
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

entity mod_Cest3 is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        estA, estB : in std_logic_vector(1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0);
        est_out : out std_logic_vector(1 downto 0)
    );
end mod_Cest3;

architecture Behavioral of mod_Cest3 is

signal selector : std_logic_vector(1 downto 0);
signal aL, bL : std_logic;

begin

    process (A, B) is begin
        if A < B then
            aL <= '1';
            bL <= '0';
        elsif B < A then
            bL <= '1';
            aL <= '0';               
        elsif A = B then
            aL <= '1';
            bL <= '0';
        elsif B = A then
            aL <= '1';
            bL <= '0';
        elsif B > A then
            aL <= '1';
            bL <= '0';
        else 
            bL <= '1';
            aL <= '0';
        end if;
    end process;

    selector <= aL & bL;

    val_out <= A when (selector = "10") else
                B when (selector = "01") else
                (others => '0') when (selector = "00") else
                (others => '1');
            
    est_out <= estA when (selector = "10") else
                estB when (selector = "01") else
                (others => '0') when (selector = "00") else
                (others => '1');
end Behavioral;

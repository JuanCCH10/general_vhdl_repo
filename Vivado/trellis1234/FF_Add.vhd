----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2021 12:10:55
-- Design Name: 
-- Module Name: FF_Add - Behavioral
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

entity FF_Add_n is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 1);
    Port ( Clk  : in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end FF_Add_n;

architecture Behavioral of FF_Add_n is
TYPE Reg_TYPE IS ARRAY (0 TO nFF-1) OF STD_LOGIC_VECTOR(nbits-1 downto 0);
signal Reg: Reg_TYPE;

begin

process(Clk) is
begin
    if rising_edge(clk) then
        Reg <= D & Reg(0 to nFF-2);
    end if;
end process;
Q <= Reg(nFF-1);

end Behavioral;

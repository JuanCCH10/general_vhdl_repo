----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.02.2021 11:39:21
-- Design Name: 
-- Module Name: FF_Sinc - Behavioral
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

entity FF_Sinc is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end FF_Sinc;

architecture Behavioral of FF_Sinc is
signal FF_IN: std_logic_vector(2 downto 0);
begin

FFs:process(Clk) is
begin
	if rising_edge(Clk) then
		FF_IN <= D & FF_IN(2 downto 1);
	end if;
end process;
Q <= FF_IN(0);

end Behavioral;

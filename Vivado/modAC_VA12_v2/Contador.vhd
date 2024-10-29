----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.07.2020 19:06:22
-- Design Name: 
-- Module Name: Contador_1s - Behavioral
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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity Contador is
    Generic(Nbits: integer:=26);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
           );
end Contador;

architecture Behavioral of Contador is
signal Conta: STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0);
begin

process(Reset,Clk) is
begin
	if Reset = '1' then
		Conta <= (others => '0');
	elsif rising_edge(clk) then
	   if En = '1' then
			Conta <= Conta + 1;
	   end if;
	end if;
end process;
Dout <= Conta;
end Behavioral;

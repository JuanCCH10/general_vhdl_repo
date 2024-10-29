----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2021 16:52:44
-- Design Name: 
-- Module Name: Contador_Lim - Behavioral
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

entity Contador_Lim is
    Generic(Nbits : integer;
    		Limite: integer);
    		
    Port ( Reset : in  STD_LOGIC;
           Clk   : in  STD_LOGIC;
           Dout  : out STD_LOGIC_VECTOR(Nbits-1 downto 0));
end Contador_Lim;

architecture Behavioral of Contador_Lim is

signal Conta : STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0);
Constant Lim : STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0):= conv_std_logic_Vector(Limite,Nbits);
begin

process(Reset,Clk) is
begin
	if Reset = '1' then
		Conta <= (others => '0');
	elsif rising_edge(clk) then
		if Conta < Lim then
			Conta <= Conta + 1;
		end if;
	end if;
end process;

Dout <= Conta;

end Behavioral;


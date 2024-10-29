----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2022 09:20:56
-- Design Name: 
-- Module Name: Contador_Asc_Des - Behavioral
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

entity Contador_Asc_Des is
    Generic(Nbits: integer:=6);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Limite	: In STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Up       : in STD_LOGIC;
           Down     : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0));
end Contador_Asc_Des;

architecture Behavioral of Contador_Asc_Des is

signal Conta: STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0);
constant Ceros: STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0):=(others => '0');
signal En_Out_Aux: std_logic;
begin

process(Reset,Clk) is
begin
	if Reset = '1' then
		Conta <= (others => '0');
	elsif rising_edge(clk) then
	   if En = '1' then
            if Up = '1' then
				if Conta < Limite then
					Conta <= Conta + 1;
				end if;
			end if;
			
			if Down = '1' then
				if Conta > Ceros then
					Conta <= Conta - 1;
				end if;
			end if;
       end if;
	end if;
end process;

Dout <= Conta; 
end Behavioral;

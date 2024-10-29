----------------------------------------------------------------------------------
-- Company: UNINDETEC
-- Engineer: Guillermo Vicencio Gutierrez 
-- 
-- Create Date: 14.07.2020 11:40:41
-- Design Name: 
-- Module Name: SRIP - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: vivado 19.1 
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

entity SRLPS is
    Generic(Nbits: integer);
    
    Port   (Rst  : in  STD_LOGIC;
            Clk	 : in  STD_LOGIC;                          --Reloj general del sistema
            Load : in  STD_LOGIC;                          --habilitador de carga del registro
            En	 : in  STD_LOGIC;                          --habilitador de desplazameinto
            D	 : in  STD_LOGIC_VECTOR (Nbits-1 downto 0);--Dato de entrada
            Q	 : out STD_LOGIC);                         --salida serial
end SRLPS;

architecture Behavioral of SRLPS is

signal Q1: std_logic_vector(Nbits-1 downto 0);

begin

Shif_Register:Process(Rst,Clk,En) is
begin
 if Rst = '1' then
   Q1 <= (others => '0');
	elsif rising_edge(Clk) then
		if Load = '1' then                                --carga el registro
			Q1 <= D;
		else
			if En = '1' then
			     Q1 <= Q1(Nbits-2 downto 0) & '0'; 
			     --Q1 <= Q1(0) & Q1(Nbits-1 downto 1);        --desplza
			end if;
		end if;
	end if;
end process;

Q <= Q1(Nbits-1);
--Q <= Q1(0);
end Behavioral;

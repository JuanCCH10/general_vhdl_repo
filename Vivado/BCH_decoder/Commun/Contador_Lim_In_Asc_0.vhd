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

entity Contador_Lim_In_Asc_0 is
    Generic(Nbits: integer:=26);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC--indica que esta en estado activo
           );
end Contador_Lim_In_Asc_0;

architecture Behavioral of Contador_Lim_In_Asc_0 is
signal Conta: STD_LOGIC_VECTOR(Nbits-1 DOWNTO 0);
signal En_Out_Aux   : STD_LOGIC;

begin

process(Reset,Clk) is
begin
	if Reset = '1' then
		Conta <= (others => '0');
		En_Out_Aux <= '0';
	elsif rising_edge(clk) then
		if En = '1' then
			if Conta < DIN then
				Conta <= Conta + 1;
				En_Out_Aux <= '1';
			else
				En_Out_Aux <= '0';
			end if;
		end if;
	end if;
end process;
Dout <= Conta;
En_Out <= En_Out_Aux;

end Behavioral;

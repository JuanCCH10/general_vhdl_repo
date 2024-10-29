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

entity Contador_Lim_En_C is
    Generic(Nbits: integer:=26;
    		Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC
           );
end Contador_Lim_En_C;

architecture Behavioral of Contador_Lim_En_C is
signal Conta: STD_LOGIC_VECTOR(Nbits DOWNTO 0);
Constant Lim : STD_LOGIC_VECTOR(Nbits DOWNTO 0):= conv_std_logic_Vector(Limite,Nbits+1);
signal En_Out_Aux: std_logic;
begin

process(Reset,Clk) is
begin
	if Reset = '1' then
		Conta <= (others => '0');
		En_Out_Aux <= '0';
	elsif rising_edge(clk) then
	   if En = '1' then
            if Conta < Lim then
                Conta <= Conta + 1;
            else
              En_Out_Aux <= not En_Out_Aux;
              Conta <= (others => '0');
            end if;
       end if;
	end if;
end process;

En_Out <= En_Out_Aux;
Dout <= Conta(Nbits-1 downto 0);
end Behavioral;

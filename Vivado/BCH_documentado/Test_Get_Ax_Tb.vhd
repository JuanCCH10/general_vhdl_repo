----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 14:14:49
-- Design Name: 
-- Module Name: Test_Get_Ax_Tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test_Get_Ax_Tb is
--  Port ( );
end Test_Get_Ax_Tb;

architecture Behavioral of Test_Get_Ax_Tb is
component Test_Get_Ax is
    Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           En		: in STD_LOGIC;
           Fin		: out STD_LOGIC
           );
end component;

signal Reset	: STD_LOGIC;
signal Clk		: STD_LOGIC;
signal En		: STD_LOGIC;
signal Fin		: STD_LOGIC;
constant clk_periodo: time := 10 ns;

           
begin
process
begin
        Clk <= '1';
    wait for clk_periodo/2;
        Clk <= '0';
    wait for clk_periodo/2;
end process;


process
begin
    Reset <= '1';
    wait for 100 ns;
    Reset <= '0';
    wait for 84 ms;
--     Reset <= '1';
    wait for 100 ns;
    Reset <= '0';
    wait;-- for clk_periodo*2;
end process;

Test:Test_Get_Ax 
Port Map ( Reset	=> Reset,
           Clk		=> Clk,
           En		=> En,
           Fin		=> Fin);
           
           
end Behavioral;

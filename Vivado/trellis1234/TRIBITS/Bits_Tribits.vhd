----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2021 14:49:28
-- Design Name: 
-- Module Name: Bits_Tribits - Behavioral
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

entity Bits_Tribits is
   Port ( Rst : in STD_LOGIC;
          Clk : in STD_LOGIC;
          D   : in STD_LOGIC;
          En  : in STD_LOGIC;
          Qp  : out STD_LOGIC_VECTOR (2 downto 0));
end Bits_Tribits;

architecture Behavioral of Bits_Tribits is

signal Q1: std_logic_vector(2 downto 0);

begin

process (CLK) 
    begin 
        if rst = '1' then
            Q1 <= "000";
        elsif rising_edge (CLK) then
            if en='1' then
           Q1 <= Q1(1 DOWNTO 0) &D;
           end if;
        end if;
    end process;
Qp<=Q1;

end Behavioral;

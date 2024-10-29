----------------------------------------------------------------------------------
-- Company: UNINDETEC
-- Engineer: Juan Carlos Chavez Hermoso
-- 
-- Create Date: 11.03.2022 13:48:49
-- Design Name: single_port_RAM
-- Module Name: single_port_RAM - Behavioral
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
use IEEE.numeric_std.all;

entity single_port_RAM is
    Port (
        ram_addr : in std_logic_vector(6 downto 0);
        ram_data_in : in std_logic_vector(3 downto 0);
        ram_wr : in std_logic;
        ram_clk : in std_logic;
        ram_data_out : out std_logic_vector(3 downto 0)
     );
end single_port_RAM;

architecture Behavioral of single_port_RAM is

type ram_array is array (0 to 127) of std_logic_vector (3 downto 0);
signal ram : ram_array := (
    x"5",x"6",x"7",x"7",-- 0x00: 
    x"9",x"0",x"0",x"1",-- 0x04: 
    x"0",x"0",x"0",x"0",-- 0x08: 
    x"0",x"0",x"0",x"0",-- 0x0C: 
    x"0",x"0",x"0",x"0",-- 0x10: 
    x"0",x"0",x"0",x"0",-- 0x14: 
    x"0",x"0",x"0",x"0",-- 0x18: 
    x"0",x"0",x"0",x"0",-- 0x1C: 
    x"0",x"0",x"0",x"0",-- 0x20: 
    x"0",x"0",x"0",x"0",-- 0x24: 
    x"0",x"0",x"0",x"0",-- 0x28: 
    x"0",x"0",x"0",x"0",-- 0x2C: 
    x"0",x"0",x"0",x"0",-- 0x30: 
    x"0",x"0",x"0",x"0",-- 0x34: 
    x"0",x"0",x"0",x"0",-- 0x38: 
    x"0",x"0",x"0",x"0",-- 0x3C: 
    x"0",x"0",x"0",x"0",-- 0x40: 
    x"0",x"0",x"0",x"0",-- 0x44: 
    x"0",x"0",x"0",x"0",-- 0x48: 
    x"0",x"0",x"0",x"0",-- 0x4C: 
    x"0",x"0",x"0",x"0",-- 0x50: 
    x"0",x"0",x"0",x"0",-- 0x54: 
    x"0",x"0",x"0",x"0",-- 0x58: 
    x"0",x"0",x"0",x"0",-- 0x5C: 
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0",
    x"0",x"0",x"0",x"0"
);

begin
process(ram_clk) begin
    if(rising_edge(ram_clk)) then
        if(ram_wr = '1') then
            ram(to_integer(unsigned(ram_addr))) <= ram_data_in;
        end if;
    end if;
end process;

ram_data_out <= ram(to_integer(unsigned(ram_addr)));

end Behavioral;

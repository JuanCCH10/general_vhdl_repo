----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2022 10:20:26
-- Design Name: 
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
use IEEE.std_logic_unsigned.ALL;

entity single_port_RAM is
    generic(Data_bits : integer := 12;
            Loc : integer := 49;
            Addr_bits : integer := 6);
    Port (
        din : in std_logic_vector(Data_bits-1 downto 0);
        dout : out std_logic_vector(Data_bits-1 downto 0);
        addr : in std_logic_vector(Addr_bits-1 downto 0);
        clk, rw, en : std_logic -- read := 0, write := 1
    );
end single_port_RAM;

architecture Behavioral of single_port_RAM is

    type RAM_TYPE is array(Loc-1 downto 0) of std_logic_vector(Data_bits-1 downto 0);
    signal MEM : RAM_TYPE;

begin
     process(clk) begin
        if en = '1' then
            if rising_edge(clk) then
                if rw = '1' then
                    MEM(conv_integer(addr)) <= din;
                else
                    dout <= MEM(conv_integer(addr));
                end if;
            end if;
        end if;
    end process;
end Behavioral;

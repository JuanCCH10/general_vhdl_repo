----------------------------------------------------------------------------------
-- Company: UNIDETEC
-- Engineer: Juan Carlos Chavez Hermoso
-- 
-- Create Date: 17.03.2022 11:15:50
-- Design Name: 
-- Module Name: dualin_port_ram - Behavioral
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

entity dualin_port_ram is
    Port (
        dina : in std_logic_vector(1 downto 0);
        dinb : in std_logic_vector(1 downto 0);
        addra : in std_logic_vector(7 downto 0);
        addrb : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        rw : in std_logic;
        rd  : in std_logic;
        dout : out std_logic_vector(1 downto 0)
    );
end dualin_port_ram;

architecture Behavioral of dualin_port_ram is

 type RAM_TYPE is array(127 downto 0) of std_logic_vector(1 downto 0);
 shared variable MEM : RAM_TYPE;
--signal MEM1 : RAM_TYPE;
--signal MEM2 : RAM_TYPE;
begin
    process(clk) begin
        if rising_edge(clk) then
            if rw = '1' then
                MEM(conv_integer(addra)):= dina;--<= dina; --;
                MEM(conv_integer(addrb)):= dinb;--<= dinb; --
            elsif rd = '1' then
                dout <= MEM(conv_integer(addra));               
            end if;
        end if;
    end process;
    
 --dout <= MEM1(conv_integer(addra));  
 
end Behavioral;

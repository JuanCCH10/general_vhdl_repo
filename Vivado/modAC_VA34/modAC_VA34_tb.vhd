----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2022 14:28:48
-- Design Name: 
-- Module Name: modAC_VA34_tb - Behavioral
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

entity modAC_VA34_tb is
end modAC_VA34_tb;

architecture Behavioral of modAC_VA34_tb is

    component modAC_VA34v4 is
        Port (
            clk, rst, ce : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            est_r : out std_logic_vector(2 downto 0)
        );
    end component;
    
    type state_values is array (0 to 48) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
    -- Datos de Matlab
--    "0000",
--    "0000",
--    "1100",
--    "1101",
--    "0110",
--    "0011",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "0010",
--    "0101",
--    "0010",
--    "1100",
--    "0101",
--    "0010",
--    "0111",
--    "1001",
--    "0010",
--    "0001",
--    "0000",
--    "0000",
--    "0000",
--    "1000",
--    "1110",
--    "0011",
--    "0010",
--    "0010",
--    "0111",
--    "0011",
--    "0101",
--    "0100",
--    "0010",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "1000",
--    "0100",
--    "0000",
--    "0000",
--    "0010",
--    "1111",
--    "1001",
--    "1000",
--    "1011",
--    "1111",
--    "0001",
--    "0001"
    -- Datos simulación de Trellis 3/4
    "1000",
    "0010",
    "0001",
    "0100",
    "1101",
    "0111",
    "0001",
    "0101",
    "1010",
    "1100",
    "0010",
    "0101",
    "0101",
    "0001",
    "0010",
    "1111",
    "1101",
    "0100",
    "0010",
    "0111",
    "0001",
    "0010",
    "0001",
    "0011",
    "0000",
    "0110",
    "0110",
    "1001",
    "0110",
    "0011",
    "0100",
    "1111",
    "0110",
    "1010",
    "0101",
    "1011",
    "0010",
    "0011",
    "0111",
    "0011",
    "0011",
    "0010",
    "0101",
    "1010",
    "1100",
    "0100",
    "0100",
    "1001",
    "0100"
    );
    
    signal clk, rst, ce : std_logic;
    signal per : time := 10ns;
    signal dibits_rx : std_logic_vector(3 downto 0);
    signal est_r : std_logic_vector(2 downto 0);

begin

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : modAC_VA34v4
    port map(
        clk => clk,
        rst => rst,
        ce => ce,
        dibits_rx => dibits_rx,
        est_r => est_r
    );
    
    estimulos : process begin
        rst <= '1';
        ce <= '0';
        dibits_rx <= const_point(0);
        wait for per;
        rst <= '0';
        ce <= '0';
        dibits_rx <= const_point(0);
        wait for per; --
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(1);
        wait; --
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(2);
        wait for per*2; -- corte
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(3);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(4);
        wait for per*2; --corte
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(5);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(6);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(7);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(8);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(9);
        wait for per*2;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(10);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(11);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(12);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(13);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(14);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(15);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(16);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(17);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(18);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(19);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(20);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(21);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(22);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(23);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(24);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(25);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(26);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(27);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(28);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(29);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(30);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(31);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(32);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(33);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(34);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(35);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(36);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(37);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(38);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(39);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(40);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(41);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(42);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(43);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(44);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(45);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(46);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(47);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(48);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        wait;
    end process;

end Behavioral;

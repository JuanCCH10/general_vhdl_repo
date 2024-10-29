----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2022 11:57:17
-- Design Name: 
-- Module Name: modVA_tb - Behavioral
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

entity modVA_tb is
end modVA_tb;

architecture Behavioral of modVA_tb is

    component modVA is
        Port (
            clk, rst, cs, sel : in std_logic;
            dibits : in std_logic_vector(3 downto 0);
            est_r : out std_logic_vector(2 downto 0)
        );
    end component;
    
    type state_values is array (0 to 48) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
    "0000",
    "0011",
    "0110",
    "1011",
    "0111",
    "0110",
    "0111",
    "1010",
    "1001",
    "0000",
    "0000",
    "0000",
    "0011",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "1010",
    "0101",
    "1101",
    "1111",
    "1011",
    "0100",
    "0000",
    "1111",
    "0100",
    "0000",
    "0000",
    "0000",
    "0000",
    "0000",
    "0000",
    "0000",
    "0000",
    "1100",
    "0001",
    "1110",
    "0110",
    "0100",
    "0000",
    "1100",
    "0010",
    "0100"
    );
    signal clk, rst, ce, sel : std_logic;
    signal dibits_rx : std_logic_vector(3 downto 0);
    signal est_r : std_logic_vector(2 downto 0);
    constant per : time := 10ns;

begin
    
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : modVA
    port map(
        clk => clk, 
        cs => ce,
        rst => rst,
        sel => '1',
        dibits => dibits_rx,
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
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(1);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(2);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(3);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(4);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(5);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(6);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(7);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(8);
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        dibits_rx <= const_point(9);
        wait for per;
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

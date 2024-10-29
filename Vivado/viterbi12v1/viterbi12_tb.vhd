----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 12:10:00
-- Design Name: 
-- Module Name: viterbi12_tb - Behavioral
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

entity viterbi12_tb is
end viterbi12_tb;

architecture Behavioral of viterbi12_tb is
    component viterbi12 is
        Port (
            rst, clk, en : in std_logic;
            dibs_in : in std_logic_vector(3 downto 0);
            dib_out : out std_logic_vector(1 downto 0)
        );
    end component;
    signal rst : std_logic;
    signal clk : std_logic;
    signal en : std_logic;
    signal dibs_in : std_logic_vector(3 downto 0);
    signal dib_out : std_logic_vector(1 downto 0);
    signal per : time := 10 ns;

begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex_est : viterbi12
    port map(
        rst => rst,
        clk => clk,
        en => en,
        dibs_in => dibs_in,
        dib_out => dib_out
    );
    
    estimulos : process begin
        rst <= '1';
        en <= '0';
        dibs_in <= "0000";
        wait for per;
        rst <= '0';
        en <= '1';
        --dibs_in <= "0001"; --0y3
        --dibs_in <= "0010"; --0y3
        --dibs_in <= "0100"; --0y2
        --dibs_in <= "1000"; --0y2
        dibs_in <= "0000";
        wait for per;
        en <= '0';
        
        wait for per;
        en <= '1';
--        dibs_in <= "1111";
        dibs_in <= "1110";
        
        wait for per;
        en <= '0';
        
        wait for per;
        en <= '1';
        dibs_in <= "1000";
        
        wait for per;
        en <= '0';
        
        wait for per;
        en <= '1';
        dibs_in <= "0001";
        
        wait for per;
        en <= '0';
        
        wait for per;
        en <= '1';
        dibs_in <= "1110";
        
        wait for per;
        en <= '0';
        
        wait for per;
        en <= '1';
        dibs_in <= "1001";
        
        wait for per;
        en <= '0';
        
        wait;
    end process;

end Behavioral;

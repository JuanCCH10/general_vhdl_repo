----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 10:34:02
-- Design Name: 
-- Module Name: mCmin_VA12_tb - Behavioral
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

entity mCmin_VA12_tb is
end mCmin_VA12_tb;

architecture Behavioral of mCmin_VA12_tb is

    component mCmin_VA12 is
        Port (
            rst, clk, en_pulse : in std_logic;
            p_est0 : in std_logic_vector(7 downto 0);
            p_est1 : in std_logic_vector(7 downto 0);
            p_est2 : in std_logic_vector(7 downto 0);
            p_est3 : in std_logic_vector(7 downto 0);
            est_sel : out std_logic_vector(2 downto 0)
        );
    end component;
    signal p_est0 : std_logic_vector(7 downto 0);
    signal p_est1 : std_logic_vector(7 downto 0);
    signal p_est2 : std_logic_vector(7 downto 0);
    signal p_est3 : std_logic_vector(7 downto 0);
    signal est_sel : std_logic_vector(2 downto 0);
    signal per : time := 10 ns;
    signal clk : std_logic;
    signal rst : std_logic;
    signal en : std_logic;
    
begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : mCmin_VA12 
    port map(
        rst => rst,
        clk => clk,
        en_pulse => en,
        p_est0 => p_est0,
        p_est1 => p_est1,
        p_est2 => p_est2,
        p_est3 => p_est3,
        est_sel => est_sel
    );
    
    estimulos : process begin
        rst <= '0';
        en <= '0';
        p_est0 <= "10000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "00000000";
        p_est1 <= "00000000";
        p_est2 <= "00000000";
        p_est3 <= "00000000";
        wait for per;        
        p_est0 <= "00000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "00000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "10000000";
        p_est2 <= "00000000";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "00000000";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "10000000";
        p_est3 <= "01000000";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "10000000";
        p_est2 <= "00000001";
        p_est3 <= "01000000";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "10000000";
        p_est2 <= "01000000";
        p_est3 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "10000000";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "10000000";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        wait for per;
        p_est0 <= "00000000";
        p_est1 <= "00000000";
        p_est2 <= "00000000";
        p_est3 <= "00000000";
        wait for per;
        wait;
    end process;


end Behavioral;

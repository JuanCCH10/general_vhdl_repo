----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 10:51:38
-- Design Name: 
-- Module Name: mCmin_VA34_tb - Behavioral
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

entity mCmin_VA34_tb is
end mCmin_VA34_tb;

architecture Behavioral of mCmin_VA34_tb is

    component mCmin_VA34 is
        Port (
            p_est0 : in std_logic_vector(7 downto 0);
            p_est1 : in std_logic_vector(7 downto 0);
            p_est2 : in std_logic_vector(7 downto 0);
            p_est3 : in std_logic_vector(7 downto 0);
            p_est4 : in std_logic_vector(7 downto 0);
            p_est5 : in std_logic_vector(7 downto 0);
            p_est6 : in std_logic_vector(7 downto 0);
            p_est7 : in std_logic_vector(7 downto 0);
            est_sel : out std_logic_vector(3 downto 0)
        );
    end component;
    signal p_est0 : std_logic_vector(7 downto 0);
    signal p_est1 : std_logic_vector(7 downto 0);
    signal p_est2 : std_logic_vector(7 downto 0);
    signal p_est3 : std_logic_vector(7 downto 0);
    signal p_est4 : std_logic_vector(7 downto 0);
    signal p_est5 : std_logic_vector(7 downto 0);
    signal p_est6 : std_logic_vector(7 downto 0);
    signal p_est7 : std_logic_vector(7 downto 0);
    signal est_sel : std_logic_vector(3 downto 0);
    signal per : time := 10 ns;
    signal clk : std_logic;
    
begin
    
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : mCmin_VA34
    port map(
        p_est0 => p_est0,
        p_est1 => p_est1,
        p_est2 => p_est2,
        p_est3 => p_est3,
        p_est4 => p_est4,
        p_est5 => p_est5,
        p_est6 => p_est6,
        p_est7 => p_est7,
        est_sel => est_sel
    );
    
    estimulos : process begin
        p_est0 <= "00000000";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000000";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000000";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000000";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000000";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000000";
        p_est6 <= "00000001";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000000";
        p_est7 <= "00000001";
        wait for per;
        p_est0 <= "00000001";
        p_est1 <= "00000001";
        p_est2 <= "00000001";
        p_est3 <= "00000001";
        p_est4 <= "00000001";
        p_est5 <= "00000001";
        p_est6 <= "00000001";
        p_est7 <= "00000000";
        wait for per;
        p_est0 <= "10000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        p_est4 <= "10000000";
        p_est5 <= "10000000";
        p_est6 <= "10000000";
        p_est7 <= "10000000";
        wait for per;
        p_est0 <= "00000000";
        p_est1 <= "10000000";
        p_est2 <= "10000000";
        p_est3 <= "10000000";
        p_est4 <= "10000000";
        p_est5 <= "10000000";
        p_est6 <= "10000000";
        p_est7 <= "10000000";
        wait;
    
    end process;


end Behavioral;

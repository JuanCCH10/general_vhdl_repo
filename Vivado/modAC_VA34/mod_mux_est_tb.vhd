----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2022 11:34:45
-- Design Name: 
-- Module Name: mod_mux_est_tb - Behavioral
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

entity mod_mux_est_tb is
end mod_mux_est_tb;

architecture Behavioral of mod_mux_est_tb is
    component mod_mux_est is
        Port (
            caso : in std_logic;
            sel_mux : in std_logic_vector(2 downto 0);
            out_mux_est0, out_mux_est1, out_mux_est2, out_mux_est3, out_mux_est4, out_mux_est5, out_mux_est6, out_mux_est7 : out std_logic_vector(3 downto 0)
        );
    end component;
    
    signal clk, caso : std_logic;
    signal sel_mux : std_logic_vector(2 downto 0);
    signal out_mux_est0, out_mux_est1, out_mux_est2, out_mux_est3, out_mux_est4, out_mux_est5, out_mux_est6, out_mux_est7 : std_logic_vector(3 downto 0);
    signal per : time := 10ns;

begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : mod_mux_est
    port map(
        caso => caso,
        sel_mux => sel_mux,
        out_mux_est0 => out_mux_est0,
        out_mux_est1 => out_mux_est1,
        out_mux_est2 => out_mux_est2,
        out_mux_est3 => out_mux_est3,
        out_mux_est4 => out_mux_est4,
        out_mux_est5 => out_mux_est5,
        out_mux_est6 => out_mux_est6,
        out_mux_est7 => out_mux_est7
    );
    
    estimulos : process begin
        caso <= '0';
        sel_mux <= "000";
        wait for per;
        caso <= '1';
        sel_mux <= "000";
        wait for per;
        caso <= '1';
        sel_mux <= "001";
        wait for per;
        caso <= '1';
        sel_mux <= "010";
        wait for per;
        caso <= '1';
        sel_mux <= "011";
        wait for per;
        caso <= '1';
        sel_mux <= "100";
        wait for per;
        caso <= '1';
        sel_mux <= "101";
        wait for per;
        caso <= '1';
        sel_mux <= "110";
        wait for per;
        caso <= '1';
        sel_mux <= "111";
        wait;
    end process;

end Behavioral;

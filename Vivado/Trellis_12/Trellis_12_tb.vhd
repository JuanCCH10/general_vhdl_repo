----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 11.03.2022 09:26:32
-- Design Name:
-- Module Name: Trellis_12_tb - Behavioral
-- Project Name:
-- Target Devices: A7 cmod 35t
-- Tool Versions:
-- Description: Archivo de simulaci�n de FSM Trellis 1/2
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
library std;
use ieee.std_logic_textio.all;
use std.textio.all;

entity Trellis_12_tb is
end Trellis_12_tb;

architecture Behavioral of Trellis_12_tb is

component Trellis_12 is
    port(
    en : in std_logic;
    rst : in std_logic;
    clk : in std_logic;
    dib_in : in std_logic_vector(1 downto 0);
    dibs_out : out std_logic_vector(3 downto 0)
    );
end component;

signal en : std_logic;
signal rst : std_logic;
signal clk : std_logic;
signal dib_in : std_logic_vector(1 downto 0);
signal dibs_out : std_logic_vector(3 downto 0);
signal per : time := 10 ns;

file fileWR : text open WRITE_MODE is "out_trell12_local.txt";
file fileRD : text open READ_MODE is "recover_dibsout_demap.txt";

begin
    conex_est : Trellis_12
    port map(
        en => en,
        rst => rst,
        clk => clk,
        dib_in => dib_in,
        dibs_out => dibs_out
    );

    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    reset_gen : process begin
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for 51*per;
    end process;
    
    enable_gen : process begin
        en <= '0';
        wait for 2*per;
        en <= '1';
        wait for 50*per;
        en <= '0';
        wait;
    end process;

    estimulos : process is variable i_line : line; variable i_value : std_logic_vector(1 downto 0);
    begin
        wait for per*2;
        while (not endfile(fileRD)) loop
            readline(fileRD, i_line);
            read(i_line, i_value);
            dib_in <= i_value;
        wait for per;
        end loop;
        wait;
    end process;
    
    --proceso para escritura en un archivo txt
    escritura : process (en, clk) is 
    variable lineActual : line;
    begin
        if en = '1' then
            if falling_edge(clk) then
                write(lineActual, dibs_out);
                writeline(fileWR, lineActual);
            end if;
        end if;    
    end process;

end Behavioral;

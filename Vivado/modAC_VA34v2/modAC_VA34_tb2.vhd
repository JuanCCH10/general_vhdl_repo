----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2022 08:34:55
-- Design Name: 
-- Module Name: modAC_VA34_tb2 - Behavioral
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
library std; --
use ieee.std_logic_textio.all;
use std.textio.all;

entity modAC_VA34_tb2 is
end modAC_VA34_tb2;

architecture Behavioral of modAC_VA34_tb2 is
    component modAC_VA34v4 is
        Port (
            clk, rst, ce : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            est_r : out std_logic_vector(2 downto 0)
        );
    end component;
    
    constant num_pruebas : integer := 2;
    
    signal clk, rst, ce : std_logic;
    signal per : time := 10ns;
    
    type array_in is array (0 to num_pruebas-1) of std_logic_vector(3 downto 0);
    signal dibits_rx : array_in;
    
    type array_out is array (0 to num_pruebas-1) of std_logic_vector(2 downto 0);
    signal est_r : array_out;
    
    file fileWR0 : text open WRITE_MODE is "out_VA34_0_1s_1b_p0.txt";
    file fileWR1 : text open WRITE_MODE is "out_VA34_0_1s_1b_p1.txt";
    
    file fileRD0 : text open READ_MODE is "out_trell34_0_1s_1b_p0.txt";
    file fileRD1 : text open READ_MODE is "out_trell34_0_1s_1b_p1.txt"; 

begin
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
        wait;
    end process;
    
    chip_enable_gen : process variable cond : integer := 0; begin
        if cond = 0 then
            ce <= '0';
            cond := 1;
            wait for per;
        else
            ce <= '0';
            wait for per;
            ce <= '1';
            wait for per;
        end if;
    end process;
    
    inst : for I in 0 to num_pruebas-1 generate
        prueba : modAC_VA34v4
        port map(
            clk => clk,
            rst => rst,
            ce => ce,
            dibits_rx => dibits_rx(I),
            est_r => est_r(I)
        ); 
    end generate;
    
--    estimulos : for j in 0 to num_pruebas-1 generate
--        type apuntadores is array (0 to num_pruebas-1) of line;
--        variable i_line : apuntadores;
        
--        est_f : process is begin
            
--        end process;
--    end generate;
    
    estimulos : process is 
    type apuntadores is array (0 to num_pruebas-1) of line;
    variable i_line : apuntadores;
    
    type var is array (0 to num_pruebas-1) of std_logic_vector(3 downto 0);
    variable i_value : var;
--    variable i_line0 : line;
--    variable i_line1 : line;
--    variable i_value0 : std_logic_vector(3 downto 0);
--    variable i_value1 : std_logic_vector(3 downto 0);
    begin
        rep_rd_0 : for j in 0 to num_pruebas-1 loop
            readline(fileRD0, i_line(j));
            read(i_line(j), i_value(j));
            dibits_rx(j) <= i_value(j);
        end loop;
        wait for per;
        while (not endfile(fileRD0)) loop
            rep_rd_0 : for j in 0 to num_pruebas-1 loop
                readline(fileRD0, i_line(j));
                read(i_line(j), i_value(j));
                dibits_rx(j) <= i_value(j);
            end loop;
        
            readline(fileRD0, i_line0);
            read(i_line0, i_value0);
            dibits_rx(0) <= i_value0;
            
            readline(fileRD1, i_line1);
            read(i_line1, i_value1);
            dibits_rx(1) <= i_value1;
            
            wait for 2*per;
        end loop;
        wait;
    end process;
    
    escritura : process (clk, ce) is variable apuntador0 : line; variable apuntador1 : line;
    begin   
        if rising_edge(ce) then
            if rising_edge(clk) then
                write(apuntador0, est_r(0));
                writeline(fileWR0, apuntador0);
                
                write(apuntador1, est_r(1));
                writeline(fileWR1, apuntador1);
            end if;
        end if;
    end process;


end Behavioral;

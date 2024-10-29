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
library std; --
use ieee.std_logic_textio.all;
use std.textio.all;

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
    
    type array_in is array (0 to 1) of std_logic_vector(3 downto 0);
    signal dibits_rx : array_in;
    
    type array_out is array (0 to 1) of std_logic_vector(2 downto 0);
    signal est_r : array_in;
    
    file fileWR0 : text open WRITE_MODE is "out_VA34_0_1s_1b_p0.txt";
    file fileRD0 : text open READ_MODE is "out_trell34_0_1s_1b_p0.txt";
    
    file fileWR1 : text open WRITE_MODE is "out_VA34_0_1s_1b_p1.txt";
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
    
    conexiones : modAC_VA34v4
    port map(
        clk => clk,
        rst => rst,
        ce => ce,
        dibits_rx => dibits_rx,
        est_r => est_r
    );

--    conex0 : modAC_VA34v4
--    port map(
--        clk => clk,
--        rst => rst,
--        ce => ce,
--        dibits_rx => dibits_rx(0),
--        est_r => est_r(0)
--    );
    
--    conex1 : modAC_VA34v4
--    port map(
--        clk => clk,
--        rst => rst,
--        ce => ce,
--        dibits_rx => dibits_rx(1),
--        est_r => est_r(1)
--    );
    
--    inst : for I in 0 to 1 generate
--        prueba : modAC_VA34v4
--        port map(
--            clk => clk,
--            rst => rst,
--            ce => ce,
--            dibits_rx => dibits_rx(I),
--            est_r => est_r(I)
--        ); 
--    end generate;
    
--    estimulos : process is variable i : integer := 0; 
--    begin
--        dibits_rx <= const_point(i);
--        wait for per;
--        while i < 49 loop
--            dibits_rx <= const_point(i);
--            i := i + 1;
--        wait for per*2;
--        end loop;
--        wait;
--    end process;
    
--    estimulos : process is variable i_line0 : line; variable i_line1 : line; variable i_value0 : std_logic_vector(3 downto 0); variable i_value1 : std_logic_vector(3 downto 0);
--    begin
--        readline(fileRD0, i_line0);
--        read(i_line0, i_value0);
--        dibits_rx(0) <= i_value0;
--        readline(fileRD1, i_line1);
--        read(i_line1, i_value1);
--        dibits_rx(1) <= i_value1;
--        wait for per;
--        while (not endfile(fileRD0)) loop
--            readline(fileRD0, i_line0);
--            read(i_line0, i_value0);
--            dibits_rx(0) <= i_value0;
            
--            readline(fileRD1, i_line1);
--            read(i_line1, i_value1);
--            dibits_rx(1) <= i_value1;
--            wait for 2*per;
--        end loop;
--        wait;
--    end process;
    
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

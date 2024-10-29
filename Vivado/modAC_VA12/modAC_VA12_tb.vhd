----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 13:23:03
-- Design Name: 
-- Module Name: modAC_VA12_tb - Behavioral
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

--    escritura : process (clk, ce) is
--        variable p0 : line;
--        variable p1 : line;
--        variable cont_simb : integer := 0;
--        variable cont_trama : integer := 0;
--    begin   
--        if rising_edge(ce) then
--            if rising_edge(clk) then
--                if cont_trama < 196 then
--                    if est_r /= comp_value(cont_simb) then
--                        -- se guarda el número de trama
--                        write(p0, cont_trama);
--                        writeline(fileWR, p0);
--                        -- se guarda el indice del dato decodificado erroneo
--                        write(p1, cont_simb);
--                        writeline(fileWR, p1);
--                        cont_simb := cont_simb + 1;
--                        if cont_simb > 48 then
--                            cont_simb := 0;
--                            cont_trama := cont_trama + 1;
--                        end if;
--                    else
--                        cont_simb := cont_simb + 1;
--                        if cont_simb > 48 then
--                            cont_simb := 0;
--                            cont_trama := cont_trama + 1;
--                        end if;
--                    end if;
--                end if;
                
--            end if;
--        end if;
--    end process;

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

--    --aqui deben ir los datos originales
--    type comparation_values is array (0 to 48) of std_logic_vector(1 downto 0);
--    signal comp_value : comparation_values :=
--    (
----    "11",
----    "00",
----    "10",
----    "10",
----    "01",
----    "10",
----    "01",
----    "01",
----    "01",
----    "11",
----    "01",
----    "01",
----    "01",
----    "00",
----    "11",
----    "00",
----    "00",
----    "10",
----    "11",
----    "00",
----    "10",
----    "01",
----    "10",
----    "11",
----    "01",
----    "11",
----    "11",
----    "01",
----    "10",
----    "10",
----    "11",
----    "10",
----    "11",
----    "11",
----    "01",
----    "11",
----    "11",
----    "11",
----    "10",
----    "00",
----    "00",
----    "01",
----    "01",
----    "10",
----    "01",
----    "00",
----    "01",
----    "11",
----    "01"
--"10",
--"01",
--"11",
--"11",
--"10",
--"01",
--"10",
--"11",
--"01",
--"00",
--"01",
--"11",
--"10",
--"11",
--"11",
--"10",
--"00",
--"00",
--"01",
--"01",
--"01",
--"01",
--"11",
--"10",
--"10",
--"01",
--"10",
--"00",
--"11",
--"10",
--"11",
--"11",
--"10",
--"01",
--"10",
--"00",
--"10",
--"00",
--"10",
--"10",
--"01",
--"10",
--"10",
--"11",
--"01",
--"11",
--"01",
--"00",
--"01"
--    );
    
--    file fileRD : text open READ_MODE is "out_trell12_1_1s_1b.txt";
--    file fileWR : text open WRITE_MODE is "errors_1.txt";

    --lectura datos de entrada desde archivo de texto
--    estimulos : process is 
--        variable i_line : line;
--        variable i_value : std_logic_vector(3 downto 0); 
--    begin
--        readline(fileRD, i_line);
--        read(i_line, i_value);
--        dibits_rx <= i_value;
--        wait for per;
--        while (not endfile(fileRD)) loop
--            readline(fileRD, i_line);
--            read(i_line, i_value);
--            dibits_rx <= i_value;
--            wait for per;
--            wait for per;
--        end loop;
--        wait;
--    end process;
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity modAC_VA12_tb is
end modAC_VA12_tb;

architecture Behavioral of modAC_VA12_tb is

    component modAC_VA12 is
        Port (
            clk, rst, ce, en_rd : in std_logic;
            dibits_rx   : in std_logic_vector(3 downto 0);
            addr_rd     : in std_logic_vector(5 downto 0);
            est_r       : out std_logic_vector(1 downto 0);
            fin         : out std_logic
        );
    end component;
    
    signal clk, rst, ce, en_rd, fin : std_logic;
    signal mux, est_r : std_logic_vector(1 downto 0);
    signal dibits_rx : std_logic_vector(3 downto 0);
    signal addr_rd : std_logic_vector(5 downto 0);
    signal addr_recover : std_logic_vector(5 downto 0);
    constant per : time := 10ns;
    constant per_clk : time := 5 ns;
    
    type state_values is array (0 to 48) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
    -- Datos de Matlab
--    "0000",
--    "0011",
--    "0110",
--    "1011",
--    "0111",
--    "0110",
--    "0111",
--    "1010",
--    "1001",
--    "0000",
--    "0000",
--    "0000",
--    "0011",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "1010",
--    "0101",
--    "1101",
--    "1111",
--    "1011",
--    "0100",
--    "0000",
--    "1111",
--    "0100",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "0000",
--    "1100",
--    "0001",
--    "1110",
--    "0110",
--    "0100",
--    "0000",
--    "1100",
--    "0010",
--    "0100"

    -- Datos Trellis 1/2
    "0000",
    "1100",
    "1101",
    "1100",
    "1101",
    "1100",
    "1101",
    "1111",
    "0100",
    "1100",
    "1101",
    "0000",
    "0000",
    "1111",
    "1000",
    "0010",
    "0100",
    "1111",
    "1000",
    "1101",
    "0000",
    "1111",
    "1011",
    "0111",
    "1001",
    "1111",
    "1011",
    "1000",
    "1101",
    "1111",
    "1011",
    "1011",
    "0100",
    "1111",
    "1011",
    "0100",
    "0000",
    "1111",
    "0100",
    "0011",
    "1001",
    "1111",
    "0100",
    "1100",
    "1101",
    "1111",
    "0100",
    "1111",
    "0100"
    );
    
begin
    en_rd <= '1';

    conexiones : modAC_VA12
    port map(
        clk => clk,
        rst => rst,
        ce => ce,
        en_rd => en_rd,
        dibits_rx => dibits_rx,
        addr_rd => addr_rd,
        est_r => est_r,
        fin => fin
    ); 
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    ce_gen : process is 
        variable j : integer := 0;
    begin
        ce <= '0';
        wait for per;
        while j < 49 loop
            ce <= '0';
            wait for per;
            ce <= '1';
            wait for per;
            j := j + 1;
        end loop;
        j := 0;
        ce <= '0';
        wait for 148*per;
    end process; 
    
    estimulos : process is 
        variable i : integer := 0; 
    begin
    
        wait for per;
        while i < 49 loop
            dibits_rx <= const_point(i);
            i := i + 1;
        wait for 2*per; --wait for per*2;
        end loop;
        i := 0;
        wait for 148*per;
    end process;
    
    extraccion : process(clk) is
        variable reset : std_logic := '1';
        variable contador : integer := 0;
    begin
        rst <= reset;
        if falling_edge(clk) then
            if reset = '1' then
                reset := '0';
            end if;
        end if;
        if falling_edge(clk) then
            if fin = '1' then
                addr_rd <= CONV_STD_LOGIC_VECTOR(contador,6);
                contador := contador + 1;
                if contador = 49 then
                    contador := 0;
                    reset := '1';
                end if;    
            end if;
        end if;
    end process;
    
end Behavioral;

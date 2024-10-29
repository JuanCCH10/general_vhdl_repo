----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2022 15:23:29
-- Design Name: 
-- Module Name: viterbi34 - Behavioral
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

entity viterbi34 is
    Port (
        rst, clk, en : in std_logic;
        dibs_in : in std_logic_vector(3 downto 0);
        trib_out : out std_logic_vector(2 downto 0)
    );
end viterbi34;

architecture Behavioral of viterbi34 is

    type estados is (st0, st1, st2, st3, st4, st5, st6, st7);
    signal estado : estados;
    signal entrada : std_logic_vector(3 downto 0);
    component modAC_VA34 is
        Port (
            rst, clk, en_pulse : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            val_acc : in std_logic_vector(7 downto 0);
            datos_est : in std_logic_vector(31 downto 0);
            est_r : out std_logic_vector(2 downto 0)
        );
    end component;
    signal estado_info : std_logic_vector(31 downto 0);
    signal est_VA : std_logic_vector(2 downto 0);

begin
    entrada <= dibs_in;
    
    mAC : modAC_VA34
    port map(
        rst => rst,
        clk => clk,
        en_pulse => en,
        dibits_rx => entrada,
        val_acc => "00000000",
        datos_est => estado_info,
        est_r => est_VA
    );
    
    trib_out <= est_VA;
    estado_info <= x"E6A2C480" when (estado = st0) else
                   x"80E6A2C4" when (estado = st1) else
                   x"F7B3D511" when (estado = st1) else
                   x"91F7B3D5" when (estado = st1) else
                   x"D591F7B3" when (estado = st1) else
                   x"B3D591F7" when (estado = st1) else
                   x"C480E6A2" when (estado = st1) else
                   x"A2C480E6";
    process(rst, clk) is begin
        if rst = '1' then
            estado <= st0;
        elsif rising_edge(clk) then
            if en = '1' then
                case estado is
                    when st0 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st1 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st2 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st3 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st4 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st5 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st6 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when st7 =>
                        if est_VA = "000" then
                            estado <= st0;
                        elsif est_VA = "001" then
                            estado <= st1;
                        elsif est_VA = "010" then
                            estado <= st2;
                        elsif est_VA = "011" then
                            estado <= st3;
                        elsif est_VA = "100" then
                            estado <= st4;
                        elsif est_VA = "101" then
                            estado <= st5;
                        elsif est_VA = "110" then
                            estado <= st6;
                        else
                            estado <= st7;
                        end if;
                    when others =>
                        estado <= st0;    
                end case;
            end if;
        end if;
    end process;
end Behavioral;

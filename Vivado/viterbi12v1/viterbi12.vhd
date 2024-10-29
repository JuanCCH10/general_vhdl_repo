----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 11:28:18
-- Design Name: 
-- Module Name: viterbi12 - Behavioral
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
-- Algoritmo Viterbi para decodificación de datos resultantes de Trellis 1/2
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity viterbi12 is
    Port (
        rst, clk, en : in std_logic;
        dibs_in : in std_logic_vector(3 downto 0);
        dib_out : out std_logic_vector(1 downto 0)
    );
end viterbi12;

architecture Behavioral of viterbi12 is

    type estados is (st0, st1, st2, st3);
    signal estado : estados;
    signal entrada : std_logic_vector(3 downto 0);
    component modAC_VA12 is
        Port (
            rst, clk, en_pulse : in std_logic;
            dibits_rx : in std_logic_vector(3 downto 0);
            val_acc : in std_logic_vector(7 downto 0);
            datos_est : in std_logic_vector(15 downto 0);
            est_r : out std_logic_vector(1 downto 0);
            acc_value : out std_logic_vector (7 downto 0)
        );
    end component;
    
    component Shift_Register_n is
    Generic(long_Reg: integer := 1;
            DataBits: integer := 8
    );
    Port (  Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
    );
    end component;
    
    signal estado_info : std_logic_vector(15 downto 0);
    signal est_VA : std_logic_vector(1 downto 0);
    signal conex_acc_out : std_logic_vector(7 downto 0);
    signal conex_acc_in : std_logic_vector(7 downto 0);
    

begin
    entrada <= dibs_in;
    
    
    mAC : modAC_VA12
    port map(
        rst => rst,
        clk => clk,
        en_pulse => en,
        dibits_rx => entrada,
        val_acc => conex_acc_in,
        datos_est => estado_info,
        est_r => est_VA,
        acc_value => conex_acc_out
    );
    
    reg_acc : Shift_Register_n
    port map(
        Reset => rst,
        D => conex_acc_out,
        CE => en,
        CLK => clk,
        Q => conex_acc_in        
    );
    
 dib_out <= est_VA;
 estado_info <= x"3CF0" when (estado = st0) else
                x"78B4" when (estado = st1) else
                x"E12D" when (estado = st2) else
                x"A569";   
    process(rst, clk) is begin
        if rst = '1' then
            estado <= st0;
        elsif rising_edge(clk) then
            if en = '1' then
                case estado is
                    when st0 =>
                        if est_VA = "00" then
                            estado <= st0;
                        elsif est_VA = "01" then
                            estado <= st1;
                        elsif est_VA = "10" then
                            estado <= st2;
                        else
                            estado <= st3;
                        end if;
                    when st1 =>
                        if est_VA = "00" then
                            estado <= st0;
                        elsif est_VA = "01" then
                            estado <= st1;
                        elsif est_VA = "10" then
                            estado <= st2;
                        else
                            estado <= st3;
                        end if;
                    when st2 =>
                        if est_VA = "00" then
                            estado <= st0;
                        elsif est_VA = "01" then
                            estado <= st1;
                        elsif est_VA = "10" then
                            estado <= st2;
                        else
                            estado <= st3;  
                        end if;
                    when st3 =>
                        if est_VA = "00" then
                            estado <= st0;
                        elsif est_VA = "01" then
                            estado <= st1;
                        elsif est_VA = "10" then
                            estado <= st2;
                        else
                            estado <= st3;
                        end if;
                    when others =>
                        estado <= st0;    
                end case;
            end if;
        end if;
    end process;
end Behavioral;

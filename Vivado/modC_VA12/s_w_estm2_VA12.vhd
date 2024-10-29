----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Juan Carlos Chavez Hermoso
-- 
-- Create Date: 31.03.2022 10:58:58
-- Design Name: 
-- Module Name: s_w_estm2_VA12 - Behavioral
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
-- Módulo para almacenar los pesos_ai (accumulado + intantaneo) de cada estado,
-- de hasta t-2 estados anteriores.
-- Para almacenar es suficiente con un pulso corto en ce, una vez que el dato ya
-- se encuentre en el puerto de entrada peso_aiX.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_w_estm2_VA12 is
    Port (
        rst, clk, ce : in std_logic;
        peso_ai0 : in std_logic_vector(7 downto 0);
        peso_ai1 : in std_logic_vector(7 downto 0);
        peso_ai2 : in std_logic_vector(7 downto 0);
        peso_ai3 : in std_logic_vector(7 downto 0);
        pai0_0 : out std_logic_vector(7 downto 0);
        pai0_1 : out std_logic_vector(7 downto 0);
        pai0_2 : out std_logic_vector(7 downto 0);
        pai1_0 : out std_logic_vector(7 downto 0);
        pai1_1 : out std_logic_vector(7 downto 0);
        pai1_2 : out std_logic_vector(7 downto 0);
        pai2_0 : out std_logic_vector(7 downto 0);
        pai2_1 : out std_logic_vector(7 downto 0);
        pai2_2 : out std_logic_vector(7 downto 0);
        pai3_0 : out std_logic_vector(7 downto 0);
        pai3_1 : out std_logic_vector(7 downto 0);
        pai3_2 : out std_logic_vector(7 downto 0)
    );
end s_w_estm2_VA12;

architecture Behavioral of s_w_estm2_VA12 is

    component stat_regre_cond is
        Port (
            rst, clk, ce : in std_logic;
            d : in std_logic_vector(7 downto 0);
            q0 : out std_logic_vector(7 downto 0);
            q1 : out std_logic_vector(7 downto 0);
            q2 : out std_logic_vector(7 downto 0)
        );
    end component;

begin

    est0 : stat_regre_cond
    port map(
        rst => rst,
        clk => clk,
        ce => ce,
        d => peso_ai0,
        q0 => pai0_0,
        q1 => pai0_1,
        q2 => pai0_2
    );
    
    est1 : stat_regre_cond
    port map(
        rst => rst,
        clk => clk,
        ce => ce,
        d => peso_ai1,
        q0 => pai1_0,
        q1 => pai1_1,
        q2 => pai1_2
    );
    
    est2 : stat_regre_cond
    port map(
        rst => rst,
        clk => clk,
        ce => ce,
        d => peso_ai2,
        q0 => pai2_0,
        q1 => pai2_1,
        q2 => pai2_2
    );
    
    est3 : stat_regre_cond
    port map(
        rst => rst,
        clk => clk,
        ce => ce,
        d => peso_ai3,
        q0 => pai3_0,
        q1 => pai3_1,
        q2 => pai3_2
    );


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 15:29:00
-- Design Name: 
-- Module Name: modAC_VA12 - Behavioral
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
-- Conexión de módulos A y modulo C para Viterbi 1/2
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modAC_VA12 is
    Port (
        rst, clk, en_pulse : in std_logic;
        dibits_rx : in std_logic_vector(3 downto 0);
        val_acc : in std_logic_vector(7 downto 0);
        datos_est : in std_logic_vector(15 downto 0);
        est_r : out std_logic_vector(1 downto 0);
        acc_value : out std_logic_vector (7 downto 0)
    );
end modAC_VA12;

architecture Behavioral of modAC_VA12 is

    component modulo_A_VA is
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(7 downto 0);
            peso_ai : out std_logic_vector(7 downto 0)
        );
    end component;
    
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
    
    type val_est_arr is array (0 to 3) of std_logic_vector(7 downto 0);
    signal val_est : val_est_arr;
    signal flag_est : std_logic_vector(2 downto 0);

begin
    -- conexiones est0
    eval_est0 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(3 downto 0),
        peso_acc => val_acc,
        peso_ai => val_est(0)
    );
    
    -- conexiones est1
    eval_est1 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(7 downto 4),
        peso_acc => val_acc,
        peso_ai => val_est(1)
    );
    
    -- conexiones est2
    eval_est2 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(11 downto 8),
        peso_acc => val_acc,
        peso_ai => val_est(2)
    );
    
    -- conexiones est3
    eval_est3 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(15 downto 12),
        peso_acc => val_acc,
        peso_ai => val_est(3)
    );
    
    -- conexiones A-C
    mC : mCmin_VA12
    port map(
        rst => rst,
        clk => clk,
        en_pulse => en_pulse,
        p_est0 => val_est(0),
        p_est1 => val_est(1),
        p_est2 => val_est(2),
        p_est3 => val_est(3),
        est_sel => flag_est
    );
    est_r <= flag_est(1 downto 0);
    
    acc_value <= val_est(0) when (flag_est(1 downto 0) = "00") else
                val_est(1) when (flag_est(1 downto 0) = "01") else
                val_est(2) when (flag_est(1 downto 0) = "10") else
                val_est(3);

end Behavioral;

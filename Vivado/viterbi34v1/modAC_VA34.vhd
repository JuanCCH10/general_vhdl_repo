----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2022 14:56:56
-- Design Name: 
-- Module Name: modAC_VA34 - Behavioral
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
-- Conexiones de módulos A y módulos C para Viterbi 3/4
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modAC_VA34 is
    Port (
        rst, clk, en_pulse : in std_logic;
        dibits_rx : in std_logic_vector(3 downto 0);
        val_acc : in std_logic_vector(7 downto 0);
        datos_est : in std_logic_vector(31 downto 0);
        est_r : out std_logic_vector(2 downto 0)
    );
end modAC_VA34;

architecture Behavioral of modAC_VA34 is
    component modulo_A_VA is
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(7 downto 0);
            peso_ai : out std_logic_vector(7 downto 0)
        );
    end component;
    
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
    type val_est_arr is array (0 to 7) of std_logic_vector(7 downto 0);
    signal val_est : val_est_arr;
    signal flag_est : std_logic_vector(3 downto 0);

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
    
    -- conexiones est4
    eval_est4 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(19 downto 16),
        peso_acc => val_acc,
        peso_ai => val_est(4)
    );
    
    -- conexiones est5
    eval_est5 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(23 downto 20),
        peso_acc => val_acc,
        peso_ai => val_est(5)
    );
    
    -- conexiones est6
    eval_est6 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(27 downto 24),
        peso_acc => val_acc,
        peso_ai => val_est(6)
    );
    
    -- conexiones est7
    eval_est7 : modulo_A_VA
    port map(
        dato_rx => dibits_rx,
        dato_est => datos_est(31 downto 28),
        peso_acc => val_acc,
        peso_ai => val_est(7)
    );
    
    -- conexiones A-C
    mC : mCmin_VA34
    port map(
        p_est0 => val_est(0),
        p_est1 => val_est(1),
        p_est2 => val_est(2),
        p_est3 => val_est(3),
        p_est4 => val_est(4),
        p_est5 => val_est(5),
        p_est6 => val_est(6),
        p_est7 => val_est(7),
        est_sel => flag_est
    );
    est_r <= flag_est(2 downto 0);


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2022 11:33:59
-- Design Name: 
-- Module Name: mCmin_VA12 - Behavioral
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
-- Módulo de comparación entre pesos_ai (acumulado + instantaneo) bajo condiciones
-- de busqueda de mínimo para algoritmo Viterbi (VA) 1/2
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mCmin_VA12 is
    Port (
        rst, clk, en_pulse : in std_logic;
        p_est0 : in std_logic_vector(7 downto 0);
        p_est1 : in std_logic_vector(7 downto 0);
        p_est2 : in std_logic_vector(7 downto 0);
        p_est3 : in std_logic_vector(7 downto 0);
        est_sel : out std_logic_vector(2 downto 0)
    );
end mCmin_VA12;

architecture Behavioral of mCmin_VA12 is

    component modulo_C_VA is
        Port (
            A, B : in std_logic_vector(7 downto 0);
            G,L,E : out std_logic
        );
    end component;
    type permut_array is array (0 to 11) of std_logic;
    signal Larr : std_logic_vector(11 downto 0);
    signal Earr : permut_array;
    signal cond : std_logic_vector(2 downto 0);
    
    component s_w_estm2_VA12 is
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
    end component;

begin

-- comparaciones para est0
ab : modulo_C_VA
port map(
    A => p_est0,
    B => p_est1,
    G => open,
    L => Larr(0),
    E => Earr(0)
);
ac : modulo_C_VA
port map(
    A => p_est0,
    B => p_est2,
    G => open,
    L => Larr(1),
    E => Earr(1)
);
ad : modulo_C_VA
port map(
    A => p_est0,
    B => p_est3,
    G => open,
    L => Larr(2),
    E => Earr(2)
);

--comparaciones para est1
ba : modulo_C_VA
port map(
    A => p_est1,
    B => p_est0,
    G => open,
    L => Larr(3),
    E => Earr(3)
);
bc : modulo_C_VA
port map(
    A => p_est1,
    B => p_est2,
    G => open,
    L => Larr(4),
    E => Earr(4)
);
bd : modulo_C_VA
port map(
    A => p_est1,
    B => p_est3,
    G => open,
    L => Larr(5),
    E => Earr(5)
);

--comparaciones para est2
ca : modulo_C_VA
port map(
    A => p_est2,
    B => p_est0,
    G => open,
    L => Larr(6),
    E => Earr(6)
);
cb : modulo_C_VA
port map(
    A => p_est2,
    B => p_est1,
    G => open,
    L => Larr(7),
    E => Earr(7)
);
cd : modulo_C_VA
port map(
    A => p_est2,
    B => p_est3,
    G => open,
    L => Larr(8),
    E => Earr(8)
);

--comparaciones para est3
da : modulo_C_VA
port map(
    A => p_est3,
    B => p_est0,
    G => open,
    L => Larr(9),
    E => Earr(9)
);
db : modulo_C_VA
port map(
    A => p_est3,
    B => p_est1,
    G => open,
    L => Larr(10),
    E => Earr(10)
);
dc : modulo_C_VA
port map(
    A => p_est3,
    B => p_est2,
    G => open,
    L => Larr(11),
    E => Earr(11)
);

process (Larr, Earr) is begin
    if Larr(2 downto 0) = "111" then
        cond <= "000";
    elsif Larr(5 downto 3) = "111" then
        cond <= "001";
    elsif Larr(8 downto 6) = "111" then
        cond <= "010";
    elsif Larr(11 downto 9) = "111" then
        cond <= "011";
    else
        cond <= "100"; --equal condition flag
    end if;    
end process;

est_sel <= cond;

    --conexiones para est-2, est-1 y est 0
    retro_est : s_w_estm2_VA12
    port map(
        rst => rst,
        clk => clk,
        ce => en_pulse,
        peso_ai0 => p_est0,
        peso_ai1 => p_est1,
        peso_ai2 => p_est2,
        peso_ai3 => p_est3,
        pai0_0 =>open,
        pai0_1 =>open,
        pai0_2 =>open,
        pai1_0 =>open,
        pai1_1 =>open,
        pai1_2 =>open,
        pai2_0 =>open,
        pai2_1 =>open,
        pai2_2 =>open,
        pai3_0 =>open,
        pai3_1 =>open,
        pai3_2 =>open
    );

end Behavioral;

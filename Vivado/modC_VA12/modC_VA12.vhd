----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2022 14:21:16
-- Design Name: 
-- Module Name: modC_VA12 - Behavioral
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

entity modC_VA12 is
    Port (
        p_est0 : in std_logic_vector(7 downto 0);
        p_est1 : in std_logic_vector(7 downto 0);
        p_est2 : in std_logic_vector(7 downto 0);
        p_est3 : in std_logic_vector(7 downto 0);
        est_sel : out std_logic_vector(1 downto 0)
    );
end modC_VA12;

architecture Behavioral of modC_VA12 is

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
--signal b : std_logic_vector(2 downto 0);
--signal c : std_logic_vector(2 downto 0);
--signal d : std_logic_vector(2 downto 0);

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

est_sel <= cond(1 downto 0); 

end Behavioral;

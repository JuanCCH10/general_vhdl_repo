----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Juan Carlos Chavez Hermoso
-- 
-- Create Date: 31.03.2022 11:38:46
-- Design Name: 
-- Module Name: mCmin_VA34 - Behavioral
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

entity mCmin_VA34 is
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
end mCmin_VA34;

architecture Behavioral of mCmin_VA34 is

    component modulo_C_VA is
        Port (
            A, B : in std_logic_vector(7 downto 0);
            G,L,E : out std_logic
        );
    end component;
    type permut_array is array (0 to 55) of std_logic;
    signal Larr : std_logic_vector(55 downto 0);
    signal Earr : permut_array;
    signal cond : std_logic_vector(3 downto 0);

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
ae : modulo_C_VA
port map(
    A => p_est0,
    B => p_est4,
    G => open,
    L => Larr(3),
    E => Earr(3)
);
af : modulo_C_VA
port map(
    A => p_est0,
    B => p_est5,
    G => open,
    L => Larr(4),
    E => Earr(4)
);
ag : modulo_C_VA
port map(
    A => p_est0,
    B => p_est6,
    G => open,
    L => Larr(5),
    E => Earr(5)
);
ah : modulo_C_VA
port map(
    A => p_est0,
    B => p_est7,
    G => open,
    L => Larr(6),
    E => Earr(6)
);

--comparaciones para est1
ba : modulo_C_VA
port map(
    A => p_est1,
    B => p_est0,
    G => open,
    L => Larr(7),
    E => Earr(7)
);
bc : modulo_C_VA
port map(
    A => p_est1,
    B => p_est2,
    G => open,
    L => Larr(8),
    E => Earr(8)
);
bd : modulo_C_VA
port map(
    A => p_est1,
    B => p_est3,
    G => open,
    L => Larr(9),
    E => Earr(9)
);
be : modulo_C_VA
port map(
    A => p_est1,
    B => p_est4,
    G => open,
    L => Larr(10),
    E => Earr(10)
);
bf : modulo_C_VA
port map(
    A => p_est1,
    B => p_est5,
    G => open,
    L => Larr(11),
    E => Earr(11)
);
bg : modulo_C_VA
port map(
    A => p_est1,
    B => p_est6,
    G => open,
    L => Larr(12),
    E => Earr(12)
);
bh : modulo_C_VA
port map(
    A => p_est1,
    B => p_est7,
    G => open,
    L => Larr(13),
    E => Earr(13)
);

--comparaciones para est2
ca : modulo_C_VA
port map(
    A => p_est2,
    B => p_est0,
    G => open,
    L => Larr(14),
    E => Earr(14)
);
cb : modulo_C_VA
port map(
    A => p_est2,
    B => p_est1,
    G => open,
    L => Larr(15),
    E => Earr(15)
);
cd : modulo_C_VA
port map(
    A => p_est2,
    B => p_est3,
    G => open,
    L => Larr(16),
    E => Earr(16)
);
ce : modulo_C_VA
port map(
    A => p_est2,
    B => p_est4,
    G => open,
    L => Larr(17),
    E => Earr(17)
);
cf : modulo_C_VA
port map(
    A => p_est2,
    B => p_est5,
    G => open,
    L => Larr(18),
    E => Earr(18)
);
cg : modulo_C_VA
port map(
    A => p_est2,
    B => p_est6,
    G => open,
    L => Larr(19),
    E => Earr(19)
);
ch : modulo_C_VA
port map(
    A => p_est2,
    B => p_est7,
    G => open,
    L => Larr(20),
    E => Earr(20)
);

--comparaciones para est3
da : modulo_C_VA
port map(
    A => p_est3,
    B => p_est0,
    G => open,
    L => Larr(21),
    E => Earr(21)
);
db : modulo_C_VA
port map(
    A => p_est3,
    B => p_est1,
    G => open,
    L => Larr(22),
    E => Earr(22)
);
dc : modulo_C_VA
port map(
    A => p_est3,
    B => p_est2,
    G => open,
    L => Larr(23),
    E => Earr(23)
);
de : modulo_C_VA
port map(
    A => p_est3,
    B => p_est4,
    G => open,
    L => Larr(24),
    E => Earr(24)
);
df : modulo_C_VA
port map(
    A => p_est3,
    B => p_est5,
    G => open,
    L => Larr(25),
    E => Earr(25)
);
dg : modulo_C_VA
port map(
    A => p_est3,
    B => p_est6,
    G => open,
    L => Larr(26),
    E => Earr(26)
);
dh : modulo_C_VA
port map(
    A => p_est3,
    B => p_est7,
    G => open,
    L => Larr(27),
    E => Earr(27)
);

--comparacion de est4
ea : modulo_C_VA
port map(
    A => p_est4,
    B => p_est0,
    G => open,
    L => Larr(28),
    E => Earr(28)
);
eb : modulo_C_VA
port map(
    A => p_est4,
    B => p_est1,
    G => open,
    L => Larr(29),
    E => Earr(29)
);
ec : modulo_C_VA
port map(
    A => p_est4,
    B => p_est2,
    G => open,
    L => Larr(30),
    E => Earr(30)
);
ed : modulo_C_VA
port map(
    A => p_est4,
    B => p_est3,
    G => open,
    L => Larr(31),
    E => Earr(31)
);
ef : modulo_C_VA
port map(
    A => p_est4,
    B => p_est5,
    G => open,
    L => Larr(32),
    E => Earr(32)
);
eg : modulo_C_VA
port map(
    A => p_est4,
    B => p_est6,
    G => open,
    L => Larr(33),
    E => Earr(33)
);
eh : modulo_C_VA
port map(
    A => p_est4,
    B => p_est7,
    G => open,
    L => Larr(34),
    E => Earr(34)
);

--comparacion de est5
fa : modulo_C_VA
port map(
    A => p_est5,
    B => p_est0,
    G => open,
    L => Larr(35),
    E => Earr(35)
);
fb : modulo_C_VA
port map(
    A => p_est5,
    B => p_est1,
    G => open,
    L => Larr(36),
    E => Earr(36)
);
fc : modulo_C_VA
port map(
    A => p_est5,
    B => p_est2,
    G => open,
    L => Larr(37),
    E => Earr(37)
);
fd : modulo_C_VA
port map(
    A => p_est5,
    B => p_est3,
    G => open,
    L => Larr(38),
    E => Earr(38)
);
fe : modulo_C_VA
port map(
    A => p_est5,
    B => p_est4,
    G => open,
    L => Larr(39),
    E => Earr(39)
);
fg : modulo_C_VA
port map(
    A => p_est5,
    B => p_est6,
    G => open,
    L => Larr(40),
    E => Earr(40)
);
fh : modulo_C_VA
port map(
    A => p_est5,
    B => p_est7,
    G => open,
    L => Larr(41),
    E => Earr(41)
);

-------------------------------------comparacion de est6
ga : modulo_C_VA
port map(
    A => p_est6,
    B => p_est0,
    G => open,
    L => Larr(42),
    E => Earr(42)
);
gb : modulo_C_VA
port map(
    A => p_est6,
    B => p_est1,
    G => open,
    L => Larr(43),
    E => Earr(43)
);
gc : modulo_C_VA
port map(
    A => p_est6,
    B => p_est2,
    G => open,
    L => Larr(44),
    E => Earr(44)
);
gd : modulo_C_VA
port map(
    A => p_est6,
    B => p_est3,
    G => open,
    L => Larr(45),
    E => Earr(45)
);
ge : modulo_C_VA
port map(
    A => p_est6,
    B => p_est4,
    G => open,
    L => Larr(46),
    E => Earr(46)
);
gf : modulo_C_VA
port map(
    A => p_est6,
    B => p_est5,
    G => open,
    L => Larr(47),
    E => Earr(47)
);
gh : modulo_C_VA
port map(
    A => p_est6,
    B => p_est7,
    G => open,
    L => Larr(48),
    E => Earr(48)
);

--comparacion de est7
ha : modulo_C_VA
port map(
    A => p_est7,
    B => p_est0,
    G => open,
    L => Larr(49),
    E => Earr(49)
);
hb : modulo_C_VA
port map(
    A => p_est7,
    B => p_est1,
    G => open,
    L => Larr(50),
    E => Earr(50)
);
hc : modulo_C_VA
port map(
    A => p_est7,
    B => p_est2,
    G => open,
    L => Larr(51),
    E => Earr(51)
);
hd : modulo_C_VA
port map(
    A => p_est7,
    B => p_est3,
    G => open,
    L => Larr(52),
    E => Earr(52)
);
he : modulo_C_VA
port map(
    A => p_est7,
    B => p_est4,
    G => open,
    L => Larr(53),
    E => Earr(53)
);
hf : modulo_C_VA
port map(
    A => p_est7,
    B => p_est5,
    G => open,
    L => Larr(54),
    E => Earr(54)
);
hg : modulo_C_VA
port map(
    A => p_est7,
    B => p_est6,
    G => open,
    L => Larr(55),
    E => Earr(55)
);

process (Larr, Earr) is begin
    if Larr(6 downto 0) = "1111111" then
        cond <= "0000";
    elsif Larr(13 downto 7) = "1111111" then
        cond <= "0001";
    elsif Larr(20 downto 14) = "1111111" then
        cond <= "0010";
    elsif Larr(27 downto 21) = "1111111" then
        cond <= "0011";
    elsif Larr(34 downto 28) = "1111111" then
        cond <= "0100";
    elsif Larr(41 downto 35) = "1111111" then
        cond <= "0101";
    elsif Larr(48 downto 42) = "1111111" then
        cond <= "0110";
    elsif Larr(55 downto 49) = "1111111" then
        cond <= "0111";
    else
        cond <= "1000"; --equal condition flag
    end if;    
end process;

est_sel <= cond;


end Behavioral;

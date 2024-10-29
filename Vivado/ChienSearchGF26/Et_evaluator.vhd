library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Et_evaluator is
    Port(
        c0,c1,c2,c3,c4,c5,c6,c7,c8,c9           : in std_logic_vector(0 downto 0);
        c10,c11,c12,c13,c14,c15,c16,c17,c18,c19 : in std_logic_vector(0 downto 0);
        c20,c21,c22,c23,c24,c25,c26,c27,c28,c29 : in std_logic_vector(0 downto 0);
        c30,c31,c32,c33,c34,c35,c36,c37,c38,c39 : in std_logic_vector(0 downto 0);
        c40,c41,c42,c43,c44,c45,c46,c47,c48,c49 : in std_logic_vector(0 downto 0);
        c50,c51,c52,c53,c54,c55,c56,c57,c58,c59 : in std_logic_vector(0 downto 0);
        c60,c61,c62 : in std_logic_vector(0 downto 0);
        Et : out std_logic_vector(8 downto 0)
    );
end Et_evaluator;

architecture Behavioral of Et_evaluator is

    component sumador_nbits is
    generic(nbits : integer := 10);
    Port (
        A : in std_logic_vector(nbits-1 downto 0);
        B : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits downto 0)
    );
    end component;
    
    type GF26_bit is array (0 to 62) of std_logic_vector(0 downto 0);
    signal cero : GF26_bit;
    
    type long_conex is array (0 to 30) of std_logic_vector(2 downto 0);
    signal conx : long_conex;
    
    type long_conex2 is array (0 to 14) of std_logic_vector(3 downto 0);
    signal conx2 : long_conex2;
    
    type long_conex3 is array (0 to 6) of std_logic_vector(4 downto 0);
    signal conx3 : long_conex3;
    
    type long_conex4 is array (0 to 2) of std_logic_vector(5 downto 0);
    signal conx4 : long_conex4;
    
    signal con31 : std_logic_vector(3 downto 0);
    signal con2_15 : std_logic_vector(4 downto 0);
    signal con3_7 : std_logic_vector(5 downto 0);
    signal con4_3, con5_0 : std_logic_vector(6 downto 0);
    signal con5_1 : std_logic_vector(7 downto 0);

begin
    
    --******************Evaluacion de polinomios***********************
    --##########################################
    comp0 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(0),
        B => "0"&cero(1),
        S => conx(0)
    );
    
    comp1 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(2),
        B => "0"&cero(3),
        S => conx(1)
    );  
    
    comp2 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(4),
        B => "0"&cero(5),
        S => conx(2)
    );  
    
    comp3 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(6),
        B => "0"&cero(7),
        S => conx(3)
    );  
    
    comp4 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(8),
        B => "0"&cero(9),
        S => conx(4)
    );  
    
    comp5 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(10),
        B => "0"&cero(11),
        S => conx(5)
    );  
    
    comp6 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(12),
        B => "0"&cero(13),
        S => conx(6)
    );  
    
    comp7 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(14),
        B => "0"&cero(15),
        S => conx(7)
    );  
    
    comp8 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(16),
        B => "0"&cero(17),
        S => conx(8)
    );  
    
    comp9 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(18),
        B => "0"&cero(19),
        S => conx(9)
    );  
    
    comp10 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(20),
        B => "0"&cero(21),
        S => conx(10)
    );  
    
    comp11 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(22),
        B => "0"&cero(23),
        S => conx(11)
    );  
    
    comp12 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(24),
        B => "0"&cero(25),
        S => conx(12)
    );  
    
    comp13 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(26),
        B => "0"&cero(27),
        S => conx(13)
    );  
    
    comp14 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(28),
        B => "0"&cero(29),
        S => conx(14)
    );
    
    comp15 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(30),
        B => "0"&cero(31),
        S => conx(15)
    );  
    
    comp16 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(32),
        B => "0"&cero(33),
        S => conx(16)
    );  
    
    comp17 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(34),
        B => "0"&cero(35),
        S => conx(17)
    );  
    
    comp18 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(36),
        B => "0"&cero(37),
        S => conx(18)
    );  
    
    comp19 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(38),
        B => "0"&cero(39),
        S => conx(19)
    );  
    
    comp20 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(40),
        B => "0"&cero(41),
        S => conx(20)
    );  
    
    comp21 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(42),
        B => "0"&cero(43),
        S => conx(21)
    );  
    
    comp22 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(44),
        B => "0"&cero(45),
        S => conx(22)
    );  
    
    comp23 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(46),
        B => "0"&cero(47),
        S => conx(23)
    );  
    
    comp24 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(48),
        B => "0"&cero(49),
        S => conx(24)
    );
    
    comp25 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(50),
        B => "0"&cero(51),
        S => conx(25)
    );  
    
    comp26 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(52),
        B => "0"&cero(53),
        S => conx(26)
    );  
    
    comp27 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(54),
        B => "0"&cero(55),
        S => conx(27)
    );  
    
    comp28 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(56),
        B => "0"&cero(57),
        S => conx(28)
    );  
    
    comp29 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(58),
        B => "0"&cero(59),
        S => conx(29)
    );  
    
    comp30 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0"&cero(60),
        B => "0"&cero(61),
        S => conx(30)
    );  
    
    comp31 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(30),
        B => "00"&cero(62),
        S => con31
    );
    --##########################################   
    comp2_0 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(0),
        B => conx(1),
        S => conx2(0)
    );
    
    comp2_1 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(2),
        B => conx(3),
        S => conx2(1)
    );
    
    comp2_2 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(4),
        B => conx(5),
        S => conx2(2)
    );
    
    comp2_3 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(6),
        B => conx(7),
        S => conx2(3)
    );
    
    comp2_4 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(8),
        B => conx(9),
        S => conx2(4)
    );
    
    comp2_5 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(10),
        B => conx(11),
        S => conx2(5)
    );
    
    comp2_6 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(12),
        B => conx(13),
        S => conx2(6)
    );
    
    comp2_7 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(14),
        B => conx(15),
        S => conx2(7)
    );
    
    comp2_8 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(16),
        B => conx(17),
        S => conx2(8)
    );
    
    comp2_9 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(18),
        B => conx(19),
        S => conx2(9)
    );
    
    comp2_10 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(20),
        B => conx(21),
        S => conx2(10)
    );
    
    comp2_11 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(22),
        B => conx(23),
        S => conx2(11)
    );
    
    comp2_12 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(24),
        B => conx(25),
        S => conx2(12)
    );
    
    comp2_13 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(26),
        B => conx(27),
        S => conx2(13)
    );
    
    comp2_14 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => conx(28),
        B => conx(29),
        S => conx2(14)
    );
    
    comp2_15 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(14),
        B => con31,
        S => con2_15
    );
    --########################################
    comp3_0 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(0),
        B => conx2(1),
        S => conx3(0)
    );
    
    comp3_1 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(2),
        B => conx2(3),
        S => conx3(1)
    );
    
    comp3_2 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(4),
        B => conx2(5),
        S => conx3(2)
    );
    
    comp3_3 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(6),
        B => conx2(7),
        S => conx3(3)
    );
    
    comp3_4 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(8),
        B => conx2(9),
        S => conx3(4)
    );
    
    comp3_5 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(10),
        B => conx2(11),
        S => conx3(5)
    );
    
    comp3_6 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => conx2(12),
        B => conx2(13),
        S => conx3(6)
    );
    
    comp3_7 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => con2_15,
        B => conx3(6),
        S => con3_7
    );
    --########################################
    comp4_0 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => conx3(0),
        B => conx3(1),
        S => conx4(0)
    );
    
    comp4_1 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => conx3(2),
        B => conx3(3),
        S => conx4(1)
    );
    
    comp4_2 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => conx3(4),
        B => conx3(5),
        S => conx4(2)
    );
    
    comp4_3 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => "0"&conx3(6),
        B => con3_7,
        S => con4_3
    );
    --########################################
    comp5_0 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => conx4(0),
        B => conx4(1),
        S => con5_0
    );
    
    comp5_1 : sumador_nbits
    generic map( nbits => 7)
    port map(
        A => "0"&conx4(2),
        B => con4_3,
        S => con5_1
    );
    --########################################
    comp6_0 : sumador_nbits
    generic map( nbits => 8 )
    port map(
        A => con5_1,
        B => "0"&con5_0,
        S => Et
    );
    --*****************************************************************


end Behavioral;

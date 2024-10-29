library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Et_evaluatorv2 is
    Port(
        c   : in std_logic_vector(35 downto 0);
        Et  : out std_logic_vector(6 downto 0)
    );
end Et_evaluatorv2;

architecture Behavioral of Et_evaluatorv2 is

    component sumador_nbits is
    generic(nbits : integer := 10);
    Port (
        A : in std_logic_vector(nbits-1 downto 0);
        B : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits downto 0)
    );
    end component;
    
    signal cp0, cp1, cp2 : std_logic_vector(2 downto 0);
    signal cp3, cp4, cp5, cp6 : std_logic_vector(3 downto 0);
    signal cp7, cp8, cp9, cp10, cp11, cp12, cp13, cp14 : std_logic_vector(4 downto 0);
    signal cp15, cp16, cp17, cp18, cp19, cp20, cp21, cp22, cp23, cp24, cp25, cp26, cp27, cp28, cp29, cp30  : std_logic_vector(5 downto 0);
    signal cp31, cp32, cp33 : std_logic_vector(6 downto 0);

begin
    
    comp0 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => "0" & c(0),
        B => "0" & c(1),
        S => cp0 --010,2
    );

    comp1 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => cp0(1 downto 0),
        B => "0" & c(2),
        S => cp1 --011,3
    );

    comp2 : sumador_nbits
    generic map( nbits => 2)
    port map(
        A => cp1(1 downto 0),
        B => "0" & c(3),
        S => cp2 --0100,4
    );

    comp3 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => cp2,
        B => "00" & c(4),
        S => cp3 --0101,5
    );

    comp4 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => cp3(2 downto 0),
        B => "00" & c(5),
        S => cp4 --0110,6
    );

    comp5 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => cp4(2 downto 0),
        B => "00" & c(6),
        S => cp5 --0111,7
    );

    comp6 : sumador_nbits
    generic map( nbits => 3)
    port map(
        A => cp5(2 downto 0),
        B => "00" & c(7),
        S => cp6 --1000,8
    );

    comp7 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp6,
        B => "000" & c(8),
        S => cp7 --01001,9
    );

    comp8 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp7(3 downto 0),
        B => "000" & c(9),
        S => cp8 --01010,10
    );

    comp9 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp8(3 downto 0),
        B => "000" & c(10),
        S => cp9 --01011,11
    );

    comp10 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp9(3 downto 0),
        B => "000" & c(11),
        S => cp10 --01100,12
    );

    comp11 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp10(3 downto 0),
        B => "000" & c(12),
        S => cp11 --01101,13
    );

    comp12 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp11(3 downto 0),
        B => "000" & c(13),
        S => cp12 --01110,14
    );

    comp13 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp12(3 downto 0),
        B => "000" & c(14),
        S => cp13 --01111,15
    );

    comp14 : sumador_nbits
    generic map( nbits => 4)
    port map(
        A => cp13(3 downto 0),
        B => "000" & c(15),
        S => cp14 --10000,16
    );

    comp15 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp14,
        B => "0000" & c(16),
        S => cp15 --010001,17
    );

    comp16 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp15(4 downto 0),
        B => "0000" & c(17),
        S => cp16 --010010,18
    );

    comp17 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp16(4 downto 0),
        B => "0000" & c(18),
        S => cp17 --010011,19
    );

    comp18 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp17(4 downto 0),
        B => "0000" & c(19),
        S => cp18 --010100,20
    );

    comp19 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp18(4 downto 0),
        B => "0000" & c(20),
        S => cp19 --010101,21
    );

    comp20 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp19(4 downto 0),
        B => "0000" & c(21),
        S => cp20 --010110,22
    );

    comp21 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp20(4 downto 0),
        B => "0000" & c(22),
        S => cp21 --010111,23
    );

    comp22 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp21(4 downto 0),
        B => "0000" & c(23),
        S => cp22 --011000,24
    );

    comp23 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp22(4 downto 0),
        B => "0000" & c(24),
        S => cp23 --011001,25
    );

    comp24 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp23(4 downto 0),
        B => "0000" & c(25),
        S => cp24 --011010,26
    );

    comp25 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp24(4 downto 0),
        B => "0000" & c(26),
        S => cp25 --011011,27
    );

    comp26 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp25(4 downto 0),
        B => "0000" & c(27),
        S => cp26 --011100,28
    );

    comp27 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp26(4 downto 0),
        B => "0000" & c(28),
        S => cp27 --011101,29
    );

    comp28 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp27(4 downto 0),
        B => "0000" & c(29),
        S => cp28 --011110,30
    );

    comp29 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp28(4 downto 0),
        B => "0000" & c(30),
        S => cp29 --011111,31
    );

    comp30 : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => cp29(4 downto 0),
        B => "0000" & c(31),
        S => cp30 --100000,32
    );

    comp31 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => cp30,
        B => "00000" & c(32),
        S => cp31 --0100001,33
    );

    comp32 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => cp31(5 downto 0),
        B => "00000" & c(33),
        S => cp32 --0100010,34
    );

    comp33 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => cp32(5 downto 0),
        B => "00000" & c(34),
        S => cp33 --0100011,35
    );

    comp34 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => cp33(5 downto 0),
        B => "00000" & c(35),
        S => Et
    );

end Behavioral;

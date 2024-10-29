library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Arrays_Forney.all;

entity forney_RS is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2      : in std_logic_vector(1 downto 0);
        s1      : in std_logic_vector(5 downto 0);
        s2      : in std_logic_vector(5 downto 0);
        s3      : in std_logic_vector(5 downto 0);
        s4      : in std_logic_vector(5 downto 0);
        s5      : in std_logic_vector(5 downto 0);
        s6      : in std_logic_vector(5 downto 0);
        s7      : in std_logic_vector(5 downto 0);
        s8      : in std_logic_vector(5 downto 0);
        sigma1  : in std_logic_vector(5 downto 0);
        sigma2  : in std_logic_vector(5 downto 0);
        sigma3  : in std_logic_vector(5 downto 0);
        sigma4  : in std_logic_vector(5 downto 0);
        sigma5  : in std_logic_vector(5 downto 0);
        sigma6  : in std_logic_vector(5 downto 0);
        sigma7  : in std_logic_vector(5 downto 0);
        beta0   : in std_logic_vector(5 downto 0);
        beta1   : in std_logic_vector(5 downto 0);
        beta2   : in std_logic_vector(5 downto 0);
        beta3   : in std_logic_vector(5 downto 0);
        beta4   : in std_logic_vector(5 downto 0);
        beta5   : in std_logic_vector(5 downto 0);
        beta6   : in std_logic_vector(5 downto 0);
        beta7   : in std_logic_vector(5 downto 0);
        beta8   : in std_logic_vector(5 downto 0);
        beta9   : in std_logic_vector(5 downto 0);
        beta10  : in std_logic_vector(5 downto 0);
        beta11  : in std_logic_vector(5 downto 0);
        beta12  : in std_logic_vector(5 downto 0);
        beta13  : in std_logic_vector(5 downto 0);
        beta14  : in std_logic_vector(5 downto 0);
        beta15  : in std_logic_vector(5 downto 0);
        beta16  : in std_logic_vector(5 downto 0);
        beta17  : in std_logic_vector(5 downto 0);
        beta18  : in std_logic_vector(5 downto 0);
        beta19  : in std_logic_vector(5 downto 0);
        beta20  : in std_logic_vector(5 downto 0);
        beta21  : in std_logic_vector(5 downto 0);
        beta22  : in std_logic_vector(5 downto 0);
        beta23  : in std_logic_vector(5 downto 0);
        beta24  : in std_logic_vector(5 downto 0);
        beta25  : in std_logic_vector(5 downto 0);
        beta26  : in std_logic_vector(5 downto 0);
        beta27  : in std_logic_vector(5 downto 0);
        beta28  : in std_logic_vector(5 downto 0);
        beta29  : in std_logic_vector(5 downto 0);
        beta30  : in std_logic_vector(5 downto 0);
        beta31  : in std_logic_vector(5 downto 0);
        beta32  : in std_logic_vector(5 downto 0);
        beta33  : in std_logic_vector(5 downto 0);
        beta34  : in std_logic_vector(5 downto 0);
        beta35  : in std_logic_vector(5 downto 0);
        val0    : out std_logic_vector(5 downto 0);
        val1    : out std_logic_vector(5 downto 0);
        val2    : out std_logic_vector(5 downto 0);
        val3    : out std_logic_vector(5 downto 0);
        val4    : out std_logic_vector(5 downto 0);
        val5    : out std_logic_vector(5 downto 0);
        val6    : out std_logic_vector(5 downto 0);
        val7    : out std_logic_vector(5 downto 0);
        val8    : out std_logic_vector(5 downto 0);
        val9    : out std_logic_vector(5 downto 0);
        val10   : out std_logic_vector(5 downto 0);
        val11   : out std_logic_vector(5 downto 0);
        val12   : out std_logic_vector(5 downto 0);
        val13   : out std_logic_vector(5 downto 0);
        val14   : out std_logic_vector(5 downto 0);
        val15   : out std_logic_vector(5 downto 0);
        val16   : out std_logic_vector(5 downto 0);
        val17   : out std_logic_vector(5 downto 0);
        val18   : out std_logic_vector(5 downto 0);
        val19   : out std_logic_vector(5 downto 0);
        val20   : out std_logic_vector(5 downto 0);
        val21   : out std_logic_vector(5 downto 0);
        val22   : out std_logic_vector(5 downto 0);
        val23   : out std_logic_vector(5 downto 0);
        val24   : out std_logic_vector(5 downto 0);
        val25   : out std_logic_vector(5 downto 0);
        val26   : out std_logic_vector(5 downto 0);
        val27   : out std_logic_vector(5 downto 0);
        val28   : out std_logic_vector(5 downto 0);
        val29   : out std_logic_vector(5 downto 0);
        val30   : out std_logic_vector(5 downto 0);
        val31   : out std_logic_vector(5 downto 0);
        val32   : out std_logic_vector(5 downto 0);
        val33   : out std_logic_vector(5 downto 0);
        val34   : out std_logic_vector(5 downto 0);
        val35   : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
end forney_RS;

architecture Behavioral of forney_RS is
    
    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component z0_RSv3 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2      : in std_logic_vector(1 downto 0);
        s1      : in std_logic_vector(5 downto 0);
        s2      : in std_logic_vector(5 downto 0);
        s3      : in std_logic_vector(5 downto 0);
        s4      : in std_logic_vector(5 downto 0);
        s5      : in std_logic_vector(5 downto 0);
        s6      : in std_logic_vector(5 downto 0);
        s7      : in std_logic_vector(5 downto 0);
        s8      : in std_logic_vector(5 downto 0);
        sigma1  : in std_logic_vector(5 downto 0);
        sigma2  : in std_logic_vector(5 downto 0);
        sigma3  : in std_logic_vector(5 downto 0);
        sigma4  : in std_logic_vector(5 downto 0);
        sigma5  : in std_logic_vector(5 downto 0);
        sigma6  : in std_logic_vector(5 downto 0);
        sigma7  : in std_logic_vector(5 downto 0);
        beta0   : in std_logic_vector(5 downto 0);
        beta1   : in std_logic_vector(5 downto 0);
        beta2   : in std_logic_vector(5 downto 0);
        beta3   : in std_logic_vector(5 downto 0);
        beta4   : in std_logic_vector(5 downto 0);
        beta5   : in std_logic_vector(5 downto 0);
        beta6   : in std_logic_vector(5 downto 0);
        beta7   : in std_logic_vector(5 downto 0);
        beta8   : in std_logic_vector(5 downto 0);
        beta9   : in std_logic_vector(5 downto 0);
        beta10  : in std_logic_vector(5 downto 0);
        beta11  : in std_logic_vector(5 downto 0);
        beta12  : in std_logic_vector(5 downto 0);
        beta13  : in std_logic_vector(5 downto 0);
        beta14  : in std_logic_vector(5 downto 0);
        beta15  : in std_logic_vector(5 downto 0);
        beta16  : in std_logic_vector(5 downto 0);
        beta17  : in std_logic_vector(5 downto 0);
        beta18  : in std_logic_vector(5 downto 0);
        beta19  : in std_logic_vector(5 downto 0);
        beta20  : in std_logic_vector(5 downto 0);
        beta21  : in std_logic_vector(5 downto 0);
        beta22  : in std_logic_vector(5 downto 0);
        beta23  : in std_logic_vector(5 downto 0);
        beta24  : in std_logic_vector(5 downto 0);
        beta25  : in std_logic_vector(5 downto 0);
        beta26  : in std_logic_vector(5 downto 0);
        beta27  : in std_logic_vector(5 downto 0);
        beta28  : in std_logic_vector(5 downto 0);
        beta29  : in std_logic_vector(5 downto 0);
        beta30  : in std_logic_vector(5 downto 0);
        beta31  : in std_logic_vector(5 downto 0);
        beta32  : in std_logic_vector(5 downto 0);
        beta33  : in std_logic_vector(5 downto 0);
        beta34  : in std_logic_vector(5 downto 0);
        beta35  : in std_logic_vector(5 downto 0);
        z0      : out std_logic_vector(5 downto 0);
        z1      : out std_logic_vector(5 downto 0);
        z2      : out std_logic_vector(5 downto 0);
        z3      : out std_logic_vector(5 downto 0);
        z4      : out std_logic_vector(5 downto 0);
        z5      : out std_logic_vector(5 downto 0);
        z6      : out std_logic_vector(5 downto 0);
        z7      : out std_logic_vector(5 downto 0);
        z8      : out std_logic_vector(5 downto 0);
        z9      : out std_logic_vector(5 downto 0);
        z10     : out std_logic_vector(5 downto 0);
        z11     : out std_logic_vector(5 downto 0);
        z12     : out std_logic_vector(5 downto 0);
        z13     : out std_logic_vector(5 downto 0);
        z14     : out std_logic_vector(5 downto 0);
        z15     : out std_logic_vector(5 downto 0);
        z16     : out std_logic_vector(5 downto 0);
        z17     : out std_logic_vector(5 downto 0);
        z18     : out std_logic_vector(5 downto 0);
        z19     : out std_logic_vector(5 downto 0);
        z20     : out std_logic_vector(5 downto 0);
        z21     : out std_logic_vector(5 downto 0);
        z22     : out std_logic_vector(5 downto 0);
        z23     : out std_logic_vector(5 downto 0);
        z24     : out std_logic_vector(5 downto 0);
        z25     : out std_logic_vector(5 downto 0);
        z26     : out std_logic_vector(5 downto 0);
        z27     : out std_logic_vector(5 downto 0);
        z28     : out std_logic_vector(5 downto 0);
        z29     : out std_logic_vector(5 downto 0);
        z30     : out std_logic_vector(5 downto 0);
        z31     : out std_logic_vector(5 downto 0);
        z32     : out std_logic_vector(5 downto 0);
        z33     : out std_logic_vector(5 downto 0);
        z34     : out std_logic_vector(5 downto 0);
        z35     : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
    end component;
    
    component SigmaPrimaRS is
    port(
        Reset      : in std_logic;
        Clk        : in std_logic;
        En         : in std_logic;
        d_in       : in Array_d;
        Symbols_Bk : out Array_d;
        Done       : out std_logic
    );
    end component;       
    
    component d_dm_1 is
    Port
    (
        d    : in std_logic_vector(5 downto 0);
        dm   : in std_logic_vector(5 downto 0);
        ddm1 : out std_logic_vector(5 downto 0)
    );
    end component;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, z_0, sigmaP, ERROR : beta_array;
    
begin

    --Interfaz concentrada de betas -> beta_k^-1
    beta(0)  <= "000001" when (beta0  = "000001") else "000000";
    beta(1)  <= "100001" when (beta1  = "000010") else "000000";
    beta(2)  <= "110001" when (beta2  = "000100") else "000000";
    beta(3)  <= "111001" when (beta3  = "001000") else "000000";
    beta(4)  <= "111101" when (beta4  = "010000") else "000000";
    beta(5)  <= "111111" when (beta5  = "100000") else "000000";
    beta(6)  <= "111110" when (beta6  = "000011") else "000000";
    beta(7)  <= "011111" when (beta7  = "000110") else "000000";
    beta(8)  <= "101110" when (beta8  = "001100") else "000000";
    beta(9)  <= "010111" when (beta9  = "011000") else "000000";
    beta(10) <= "101010" when (beta10 = "110000") else "000000";
    beta(11) <= "010101" when (beta11 = "100011") else "000000";
    beta(12) <= "101011" when (beta12 = "000101") else "000000";
    beta(13) <= "110100" when (beta13 = "001010") else "000000";
    beta(14) <= "011010" when (beta14 = "010100") else "000000";
    beta(15) <= "001101" when (beta15 = "101000") else "000000";
    beta(16) <= "100111" when (beta16 = "010011") else "000000";
    beta(17) <= "110010" when (beta17 = "100110") else "000000";
    beta(18) <= "011001" when (beta18 = "001111") else "000000";
    beta(19) <= "101101" when (beta19 = "011110") else "000000";
    beta(20) <= "110111" when (beta20 = "111100") else "000000";
    beta(21) <= "111010" when (beta21 = "111011") else "000000";
    beta(22) <= "011101" when (beta22 = "110101") else "000000";
    beta(23) <= "101111" when (beta23 = "101001") else "000000";
    beta(24) <= "110110" when (beta24 = "010001") else "000000";
    beta(25) <= "011011" when (beta25 = "100010") else "000000";
    beta(26) <= "101100" when (beta26 = "000111") else "000000";
    beta(27) <= "010110" when (beta27 = "001110") else "000000";
    beta(28) <= "001011" when (beta28 = "011100") else "000000";
    beta(29) <= "100100" when (beta29 = "111000") else "000000";
    beta(30) <= "010010" when (beta30 = "110011") else "000000";
    beta(31) <= "001001" when (beta31 = "100101") else "000000";
    beta(32) <= "100101" when (beta32 = "001001") else "000000";
    beta(33) <= "110011" when (beta33 = "010010") else "000000";
    beta(34) <= "111000" when (beta34 = "100100") else "000000";
    beta(35) <= "011100" when (beta35 = "001011") else "000000";
    
    -- z0(beta)
    z0_module : z0_RSv3
    port map(
        clk     => clk,
        rst     => rst,
        hab     => hab,
        t2      => t2,
        s1      => s1,
        s2      => s2,
        s3      => s3,
        s4      => s4,
        s5      => s5,
        s6      => s6,
        s7      => s7,
        s8      => s8,
        sigma1  => sigma1,
        sigma2  => sigma2,
        sigma3  => sigma3,
        sigma4  => sigma4,
        sigma5  => sigma5,
        sigma6  => sigma6,
        sigma7  => sigma7,
        beta0   => beta(0),
        beta1   => beta(1),
        beta2   => beta(2),
        beta3   => beta(3),
        beta4   => beta(4),
        beta5   => beta(5),
        beta6   => beta(6),
        beta7   => beta(7),
        beta8   => beta(8),
        beta9   => beta(9),
        beta10  => beta(10),
        beta11  => beta(11),
        beta12  => beta(12),
        beta13  => beta(13),
        beta14  => beta(14),
        beta15  => beta(15),
        beta16  => beta(16),
        beta17  => beta(17),
        beta18  => beta(18),
        beta19  => beta(19),
        beta20  => beta(20),
        beta21  => beta(21),
        beta22  => beta(22),
        beta23  => beta(23),
        beta24  => beta(24),
        beta25  => beta(25),
        beta26  => beta(26),
        beta27  => beta(27),
        beta28  => beta(28),
        beta29  => beta(29),
        beta30  => beta(30),
        beta31  => beta(31),
        beta32  => beta(32),
        beta33  => beta(33),
        beta34  => beta(34),
        beta35  => beta(35),
        z0      => z_0(0),
        z1      => z_0(1),
        z2      => z_0(2),
        z3      => z_0(3),
        z4      => z_0(4),
        z5      => z_0(5),
        z6      => z_0(6),
        z7      => z_0(7),
        z8      => z_0(8),
        z9      => z_0(9),
        z10     => z_0(10),
        z11     => z_0(11),
        z12     => z_0(12),
        z13     => z_0(13),
        z14     => z_0(14),
        z15     => z_0(15),
        z16     => z_0(16),
        z17     => z_0(17),
        z18     => z_0(18),
        z19     => z_0(19),
        z20     => z_0(20),
        z21     => z_0(21),
        z22     => z_0(22),
        z23     => z_0(23),
        z24     => z_0(24),
        z25     => z_0(25),
        z26     => z_0(26),
        z27     => z_0(27),
        z28     => z_0(28),
        z29     => z_0(29),
        z30     => z_0(30),
        z31     => z_0(31),
        z32     => z_0(32),
        z33     => z_0(33),
        z34     => z_0(34),
        z35     => z_0(35),
        fin     => open
    );
    
    --sigma'
    sigma_prima_module : SigmaPrimaRS
    port map(
        Reset => rst,
        Clk => clk,
        En => hab,
        d_in(0)  => beta0,
        d_in(1)  => beta1,
        d_in(2)  => beta2,
        d_in(3)  => beta3,
        d_in(4)  => beta4,
        d_in(5)  => beta5,
        d_in(6)  => beta6,
        d_in(7)  => beta7,
        d_in(8)  => beta8,
        d_in(9)  => beta9,
        d_in(10) => beta10,
        d_in(11) => beta11,
        d_in(12) => beta12,
        d_in(13) => beta13,
        d_in(14) => beta14,
        d_in(15) => beta15,
        d_in(16) => beta16,
        d_in(17) => beta17,
        d_in(18) => beta18,
        d_in(19) => beta19,
        d_in(20) => beta20,
        d_in(21) => beta21,
        d_in(22) => beta22,
        d_in(23) => beta23,
        d_in(24) => beta24,
        d_in(25) => beta25,
        d_in(26) => beta26,
        d_in(27) => beta27,
        d_in(28) => beta28,
        d_in(29) => beta29,
        d_in(30) => beta30,
        d_in(31) => beta31,
        d_in(32) => beta32,
        d_in(33) => beta33,
        d_in(34) => beta34,
        d_in(35) => beta35,
        Symbols_Bk(0)  => sigmaP(0),
        Symbols_Bk(1)  => sigmaP(1),
        Symbols_Bk(2)  => sigmaP(2),
        Symbols_Bk(3)  => sigmaP(3),
        Symbols_Bk(4)  => sigmaP(4),
        Symbols_Bk(5)  => sigmaP(5),
        Symbols_Bk(6)  => sigmaP(6),
        Symbols_Bk(7)  => sigmaP(7),
        Symbols_Bk(8)  => sigmaP(8),
        Symbols_Bk(9)  => sigmaP(9),
        Symbols_Bk(10) => sigmaP(10),
        Symbols_Bk(11) => sigmaP(11),
        Symbols_Bk(12) => sigmaP(12),
        Symbols_Bk(13) => sigmaP(13),
        Symbols_Bk(14) => sigmaP(14),
        Symbols_Bk(15) => sigmaP(15),
        Symbols_Bk(16) => sigmaP(16),
        Symbols_Bk(17) => sigmaP(17),
        Symbols_Bk(18) => sigmaP(18),
        Symbols_Bk(19) => sigmaP(19),
        Symbols_Bk(20) => sigmaP(20),
        Symbols_Bk(21) => sigmaP(21),
        Symbols_Bk(22) => sigmaP(22),
        Symbols_Bk(23) => sigmaP(23),
        Symbols_Bk(24) => sigmaP(24),
        Symbols_Bk(25) => sigmaP(25),
        Symbols_Bk(26) => sigmaP(26),
        Symbols_Bk(27) => sigmaP(27),
        Symbols_Bk(28) => sigmaP(28),
        Symbols_Bk(29) => sigmaP(29),
        Symbols_Bk(30) => sigmaP(30),
        Symbols_Bk(31) => sigmaP(31),
        Symbols_Bk(32) => sigmaP(32),
        Symbols_Bk(33) => sigmaP(33),
        Symbols_Bk(34) => sigmaP(34),
        Symbols_Bk(35) => sigmaP(35),
        Done => fin
    );
    
    z0_sigmaP : for I in 0 to 35 generate
        division : d_dm_1
        port map(
            d => z_0(I),
            dm => sigmaP(I),
            ddm1 => ERROR(I)
        );
    end generate;
    
    val0  <=ERROR(0);
    val1  <=ERROR(1);
    val2  <=ERROR(2);
    val3  <=ERROR(3);
    val4  <=ERROR(4);
    val5  <=ERROR(5);
    val6  <=ERROR(6);
    val7  <=ERROR(7);
    val8  <=ERROR(8);
    val9  <=ERROR(9);
    val10 <=ERROR(10);
    val11 <=ERROR(11);
    val12 <=ERROR(12);
    val13 <=ERROR(13);
    val14 <=ERROR(14);
    val15 <=ERROR(15);
    val16 <=ERROR(16);
    val17 <=ERROR(17);
    val18 <=ERROR(18);
    val19 <=ERROR(19);
    val20 <=ERROR(20);
    val21 <=ERROR(21);
    val22 <=ERROR(22);
    val23 <=ERROR(23);
    val24 <=ERROR(24) when (t2(1) = '1') else "000000";
    val25 <=ERROR(25) when (t2(1) = '1') else "000000";
    val26 <=ERROR(26) when (t2(1) = '1') else "000000";
    val27 <=ERROR(27) when (t2(1) = '1') else "000000";
    val28 <=ERROR(28) when (t2(1) = '1') else "000000";
    val29 <=ERROR(29) when (t2(1) = '1') else "000000";
    val30 <=ERROR(30) when (t2(1) = '1') else "000000";
    val31 <=ERROR(31) when (t2(1) = '1') else "000000";
    val32 <=ERROR(32) when (t2(1) = '1') else "000000";
    val33 <=ERROR(33) when (t2(1) = '1') else "000000";
    val34 <=ERROR(34) when (t2(1) = '1') else "000000";
    val35 <=ERROR(35) when (t2(1) = '1') else "000000";
    
end Behavioral;

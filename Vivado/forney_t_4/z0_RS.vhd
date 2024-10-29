-- INFO
-- The expression base for Z_0 evualtion is:
-- Z0(x) = s1 + (s2 + a1s1)x + (s3 + a1s2 + a2s1)x^2 + (s4 + a1s3 + a2s2 + a3s1)x^3 + (s5 + a1s4 + a2s3 + a3s2 + a4s1)x^4 + (s6 + a1s5 + a2s4 + a3s3 + a4s2 + a5s1)x^5 + (s7 + a1s6 + a2s5 + a3s4 + a4s3 + a5s2 + a6s1)x^6 + (s8 + a1s7 + a2s6 + a3s5 + a4s4 + a5s3 + a6s2 + a7s1)x^7
-- where "a" means alpha, and the numbers on the right side represent the subindex
-- The values of syndrom and alpha are fix, so we can identify 8 coeficients equivalent to that values
-- coef1 = s1
-- coef2 = (s2 + a1s1)
-- coef3 = (s3 + a1s2 + a2s1)
-- coef4 = (s4 + a1s3 + a2s2 + a3s1)
-- coef5 = (s5 + a1s4 + a2s3 + a3s2 + a4s1)
-- coef6 = (s6 + a1s5 + a2s4 + a3s3 + a4s2 + a5s1)
-- coef7 = (s7 + a1s6 + a2s5 + a3s4 + a4s3 + a5s2 + a6s1)
-- coef8 = (s8 + a1s7 + a2s6 + a3s5 + a4s4 + a5s3 + a6s2 + a7s1)
-- To evaluate RS different longs the limit on values are the next: from syndrom1 to syndrom 8, from sigma alpha1 to alpha 7.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity z0_RS is
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
end z0_RS;

architecture Behavioral of z0_RS is
    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component symb_shift_reg_4_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3 : in std_logic_vector(5 downto 0);
        q_out : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    component symb_shift_reg_6_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3,d4,d5 : in std_logic_vector(5 downto 0);
        q_out : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    component symb_shift_reg_8_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3,d4,d5,d6,d7 : in std_logic_vector(5 downto 0);
        q_out : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;

    component FF_en is
    generic (Nbits : integer := 6); 
    Port (
        rst, clk, en : in std_logic;
        D : in std_logic_vector(Nbits-1 downto 0);
        Q : out std_logic_vector(Nbits-1 downto 0)
    );
    end component;
    
    type x_coef is array (0 to 7) of std_logic_vector(5 downto 0);
    signal x : x_coef;
    
    type aux_long is array (0 to 27) of std_logic_vector(5 downto 0);
    signal aux : aux_long;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, prod, sum, regist : beta_array;
    
    signal habilitador, fin_reg_ps, fin_reg4, fin_reg6, fin_reg8, hab_d, hab_cont : std_logic;
    signal load4, load6, load8 : std_logic;
    signal conteo : std_logic_vector(1 downto 0);
    signal q_out4, q_out6, q_out8, q_out : std_logic_vector(5 downto 0);
    signal d_fin4, d_fin6, d_fin8 : std_logic;
    
    
begin

    beta(0)  <= beta0;
    beta(1)  <= beta1;
    beta(2)  <= beta2;
    beta(3)  <= beta3;
    beta(4)  <= beta4;
    beta(5)  <= beta5;
    beta(6)  <= beta6;
    beta(7)  <= beta7;
    beta(8)  <= beta8;
    beta(9)  <= beta9;
    beta(10)  <= beta10;
    beta(11)  <= beta11;
    beta(12)  <= beta12;
    beta(13)  <= beta13;
    beta(14)  <= beta14;
    beta(15)  <= beta15;
    beta(16)  <= beta16;
    beta(17)  <= beta17;
    beta(18)  <= beta18;
    beta(19)  <= beta19;
    beta(20)  <= beta20;
    beta(21)  <= beta21;
    beta(22)  <= beta22;
    beta(23)  <= beta23;
    beta(24)  <= beta24;
    beta(25)  <= beta25;
    beta(26)  <= beta26;
    beta(27)  <= beta27;
    beta(28)  <= beta28;
    beta(29)  <= beta29;
    beta(30)  <= beta30;
    beta(31)  <= beta31;
    beta(32)  <= beta32;
    beta(33)  <= beta33;
    beta(34)  <= beta34;
    beta(35)  <= beta35;

    --habilitador interno
    habilitador_General : process(clk,rst) is begin
        if rst = '1'  then
            habilitador <= '0';
        elsif rising_edge(clk) then
            if hab = '1' then
                habilitador <= '1';
            end if;
        end if;
    end process;

    -- Coeficientes para Z0(x)
    x(0) <= s1;
    --######################################################################################
    x1_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s1,
        alphaR => aux(0)
    );
    x(1) <= s2 xor aux(0);
    --######################################################################################
    x2_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s2,
        alphaR => aux(1)
    );
    x2_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s1,
        alphaR => aux(2)
    );
    x(2) <= s3 xor aux(1) xor aux(2);
    --######################################################################################
    x3_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s3,
        alphaR => aux(3)
    );
    x3_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s2,
        alphaR => aux(4)
    );
    x3_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s1,
        alphaR => aux(5)
    );
    x(3) <= s4 xor aux(3) xor aux(4) xor aux(5);
    --######################################################################################
    x4_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s4,
        alphaR => aux(6)
    );
    x4_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s3,
        alphaR => aux(7)
    );
    x4_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s2,
        alphaR => aux(8)
    );
    x4_4 : prod_alpha
    port map(
        alphaA => sigma4,
        alphaB => s1,
        alphaR => aux(9)
    );
    x(4) <= s5 xor aux(6) xor aux(7) xor aux(8) xor aux(9);
    --######################################################################################
    x5_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s5,
        alphaR => aux(10)
    );
    x5_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s4,
        alphaR => aux(11)
    );
    x5_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s3,
        alphaR => aux(12)
    );
    x5_4 : prod_alpha
    port map(
        alphaA => sigma4,
        alphaB => s2,
        alphaR => aux(13)
    );
    x5_5 : prod_alpha
    port map(
        alphaA => sigma5,
        alphaB => s1,
        alphaR => aux(14)
    );
    x(5) <= s6 xor aux(10) xor aux(11) xor aux(12) xor aux(13) xor aux(14);
    --######################################################################################
    x6_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s6,
        alphaR => aux(15)
    );
    x6_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s5,
        alphaR => aux(16)
    );
    x6_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s4,
        alphaR => aux(17)
    );
    x6_4 : prod_alpha
    port map(
        alphaA => sigma4,
        alphaB => s3,
        alphaR => aux(18)
    );
    x6_5 : prod_alpha
    port map(
        alphaA => sigma5,
        alphaB => s2,
        alphaR => aux(19)
    );
    x6_6 : prod_alpha
    port map(
        alphaA => sigma6,
        alphaB => s1,
        alphaR => aux(20)
    );
    x(6) <= s7 xor aux(15) xor aux(16) xor aux(17) xor aux(18) xor aux(19) xor aux(20);
    --######################################################################################
    x7_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s7,
        alphaR => aux(21)
    );
    x7_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s6,
        alphaR => aux(22)
    );
    x7_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s5,
        alphaR => aux(23)
    );
    x7_4 : prod_alpha
    port map(
        alphaA => sigma4,
        alphaB => s4,
        alphaR => aux(24)
    );
    x7_5 : prod_alpha
    port map(
        alphaA => sigma5,
        alphaB => s3,
        alphaR => aux(25)
    );
    x7_6 : prod_alpha
    port map(
        alphaA => sigma6,
        alphaB => s2,
        alphaR => aux(26)
    );
    x7_7 : prod_alpha
    port map(
        alphaA => sigma7,
        alphaB => s1,
        alphaR => aux(27)
    );
    x(7) <= s8 xor aux(21) xor aux(22) xor aux(23) xor aux(24) xor aux(25) xor aux(26) xor aux(27);
    --######################################################################################
    
    -- Habilitador de conteo
    hab_cont <= hab_d and ( (not fin_reg4) or (not fin_reg6) or (not fin_reg8) );
    -- Selector t2
    q_out <= q_out4 when (t2 = "00") else q_out6 when (t2 = "01") else q_out8;
    
    delay_habilitador : process (clk,rst) is begin
        if rst = '1' then
            hab_d <= '0';
        elsif rising_edge(clk) then
            hab_d <= habilitador;
        end if;
    end process;
    
    conteo_libre : Contador
    generic map( nbits => 2 )
    port map(
        Reset => rst,
        Clk => clk,
        En => hab_cont,
        Dout => conteo
    );

    load4 <= hab and (not t2(1)) and (not t2(0));
    
    reg_paral_serie_4 : symb_shift_reg_4_en
    port map(
        clk => clk,
        rst => rst,
        load => load4,
        shift => conteo(0),
        d0 => x(0),
        d1 => x(1),
        d2 => x(2),
        d3 => x(3),
        q_out => q_out4,
        fin => fin_reg4
    );

    load6 <= hab and (not t2(1)) and t2(0);
    
    reg_paral_serie_6 : symb_shift_reg_6_en
    port map(
        clk => clk,
        rst => rst,
        load => load6,
        shift => conteo(0),
        d0 => x(0),
        d1 => x(1),
        d2 => x(2),
        d3 => x(3),
        d4 => x(4),
        d5 => x(5),
        q_out => q_out6,
        fin => fin_reg6
    );

    load8 <= hab and t2(1);
    
    reg_paral_serie_8 : symb_shift_reg_8_en
    port map(
        clk => clk,
        rst => rst,
        load => load8,
        shift => conteo(0),
        d0 => x(0),
        d1 => x(1),
        d2 => x(2),
        d3 => x(3),
        d4 => x(4),
        d5 => x(5),
        d6 => x(6),
        d7 => x(7),              
        q_out => q_out8,
        fin => fin_reg8
    );
    
    z0_module : for I in 0 to 35 generate
    -- el resultado z0 se encuentra en el registro
        registro : FF_en
        port map(
            clk => clk,
            en => conteo(0),-- and (not fin_reg_ps),
            rst => rst,
            D => sum(I),
            Q => regist(I)
        ); 
        
        producto : prod_alpha
        port map(
            alphaA => regist(I),
            alphaB => beta(I),
            alphaR => prod(I)
        );
        
        -- condicion para cero
        sum(I) <= "000000" when beta(I) = "000000" else ( q_out xor prod(I) );
    end generate;
    
    z0  <= regist(0);
    z1  <= regist(1);
    z2  <= regist(2);
    z3  <= regist(3);
    z4  <= regist(4);
    z5  <= regist(5);
    z6  <= regist(6);
    z7  <= regist(7);
    z8  <= regist(8);
    z9  <= regist(9);
    z10 <= regist(10);
    z11 <= regist(11);
    z12 <= regist(12);
    z13 <= regist(13);
    z14 <= regist(14);
    z15 <= regist(15);
    z16 <= regist(16);
    z17 <= regist(17);
    z18 <= regist(18);
    z19 <= regist(19);
    z20 <= regist(20);
    z21 <= regist(21);
    z22 <= regist(22);
    z23 <= regist(23);
    z24 <= regist(24);
    z25 <= regist(25);
    z26 <= regist(26);
    z27 <= regist(27);
    z28 <= regist(28);
    z29 <= regist(29);
    z30 <= regist(30);
    z31 <= regist(31);
    z32 <= regist(32);
    z33 <= regist(33);
    z34 <= regist(34);
    z35 <= regist(35);
    
    fin <= fin_reg4 or fin_reg6 or fin_reg8;
    
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z0 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
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
        sigma8  : in std_logic_vector(5 downto 0);
        sigma9  : in std_logic_vector(5 downto 0);
        sigma10 : in std_logic_vector(5 downto 0);
        sigma11 : in std_logic_vector(5 downto 0);
        sigma12 : in std_logic_vector(5 downto 0);
        sigma13 : in std_logic_vector(5 downto 0);
        sigma14 : in std_logic_vector(5 downto 0);
        sigma15 : in std_logic_vector(5 downto 0);
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
        z35     : out std_logic_vector(5 downto 0)
    );
end z0;

architecture Behavioral of z0 is
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

    component FF_en is
    generic (Nbits : integer := 6); 
    Port (
        rst, clk, en : in std_logic;
        D : in std_logic_vector(Nbits-1 downto 0);
        Q : out std_logic_vector(Nbits-1 downto 0)
    );
    end component;
    
    component Contador is
        Generic(Nbits: integer:=26);
        Port (
            Reset    : in STD_LOGIC;
            Clk      : in STD_LOGIC;
            En       : in STD_LOGIC;
            Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
        );
    end component;
    
    type x_coef is array (0 to 3) of std_logic_vector(5 downto 0);
    signal x : x_coef;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, prod, sum, regist : beta_array;
    
    signal c1, c21, c22, c31, c32, c33, q_out, conteo : std_logic_vector(5 downto 0);
    signal habilitador, fin_reg_ps, hab_d, hab_cont : std_logic;

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
    
    x1_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s1,
        alphaR => c1
    );
    x(1) <= s2 xor c1;
    
    x2_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s2,
        alphaR => c21
    );
    x2_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s1,
        alphaR => c22
    );
    x(2) <= s3 xor c21 xor c22;
    
    x3_1 : prod_alpha
    port map(
        alphaA => sigma1,
        alphaB => s3,
        alphaR => c31
    );
    x3_2 : prod_alpha
    port map(
        alphaA => sigma2,
        alphaB => s2,
        alphaR => c32
    );
    x3_3 : prod_alpha
    port map(
        alphaA => sigma3,
        alphaB => s1,
        alphaR => c33
    );
    x(3) <= s4 xor c31 xor c32 xor c33;
    --######################################################################################
    
    delay_habilitador : process (clk,rst) is begin
        if rst = '1' then
            hab_d <= '0';
        elsif rising_edge(clk) then
            hab_d <= habilitador;
        end if;
    end process;
    
    hab_cont <= (hab_d and (not fin_reg_ps));
    
    conteo_libre : Contador
    generic map( nbits => 6 )
    port map(
        Reset => rst,
        Clk => clk,
        En => hab_cont,
        Dout => conteo
    );
    
    reg_paral_serie : symb_shift_reg_4_en
    port map(
        clk => clk,
        rst => rst,
        load => hab,
        shift => conteo(0),
        d0 => x(0),
        d1 => x(1),
        d2 => x(2),
        d3 => x(3),
        q_out => q_out,
        fin => fin_reg_ps
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
        
        --sum(I) <= q_out xor prod(I);
        -- condicion para cero
        sum(I) <= "000000" when beta(I) = "000000" else q_out xor prod(I);
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
    
end Behavioral;

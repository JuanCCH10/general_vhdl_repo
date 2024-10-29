----------------------------------------------------------------------------------
-- Modulo evaluador de z0 para el algoritmo de Forney.
-- Se toma como base el archivo <<z0_RS.vhd>> del proyecto <<forney_t_4>>
-- Se simplifica la etata de evaluacion de polinomios, con base en las conexiones 
-- realizadas en el proyecto <<poly_evaluator>>
-- Se aisla en un modulo el cálculo de los coeficientes con los que se habría de 
-- alimentar la evaluación de polinomios mediante el archivo <<z0_coef.vhd>> del
-- proyecto <<z0_evaluator>>
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity z0_RSv2 is
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
end z0_RSv2;

architecture Behavioral of z0_RSv2 is
    
    component z0_coef is
    Port (
        s1  : in std_logic_vector(5 downto 0);
        s2  : in std_logic_vector(5 downto 0);
        s3  : in std_logic_vector(5 downto 0);
        s4  : in std_logic_vector(5 downto 0);
        s5  : in std_logic_vector(5 downto 0);
        s6  : in std_logic_vector(5 downto 0);
        s7  : in std_logic_vector(5 downto 0);
        s8  : in std_logic_vector(5 downto 0);
        ax1  : in std_logic_vector(5 downto 0);
        ax2  : in std_logic_vector(5 downto 0);
        ax3  : in std_logic_vector(5 downto 0);
        ax4  : in std_logic_vector(5 downto 0);
        ax5  : in std_logic_vector(5 downto 0);
        ax6  : in std_logic_vector(5 downto 0);
        ax7  : in std_logic_vector(5 downto 0);
        coef1  : out std_logic_vector(5 downto 0);
        coef2  : out std_logic_vector(5 downto 0);
        coef3  : out std_logic_vector(5 downto 0);
        coef4  : out std_logic_vector(5 downto 0);
        coef5  : out std_logic_vector(5 downto 0);
        coef6  : out std_logic_vector(5 downto 0);
        coef7  : out std_logic_vector(5 downto 0);
        coef8  : out std_logic_vector(5 downto 0)
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
    
    component mono_sindrome is
        Port (
            clk, rst : in std_logic;
            simbolo : in std_logic_vector(5 downto 0);
            alpha : in std_logic_vector(5 downto 0);
            sindrome : out std_logic_vector(5 downto 0)
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
    
    type coef_array is array (1 to 8) of std_logic_vector(5 downto 0);
    signal coef : coef_array;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, sind_orig, intrf_out : beta_array;
    
    signal q4, q6, q8 : std_logic_vector(5 downto 0);
    signal hab_sos, count_end, count_end4, count_end6, count_end8, dy_count_end, error_flag, en, d_shft2, d_shft3, shft, load : std_logic;
    signal elements, simbolos : std_logic_vector(5 downto 0);

begin
    
    z0_coef_evaluation : z0_coef
    port map(
            s1     => s1,
            s2     => s2,
            s3     => s3,
            s4     => s4,
            s5     => s5,
            s6     => s6,
            s7     => s7,
            s8     => s8,
            ax1    => sigma1,
            ax2    => sigma2,
            ax3    => sigma3,
            ax4    => sigma4,
            ax5    => sigma5,
            ax6    => sigma6,
            ax7    => sigma7,
            coef1  => coef(1),
            coef2  => coef(2),
            coef3  => coef(3),
            coef4  => coef(4),
            coef5  => coef(5),
            coef6  => coef(6),
            coef7  => coef(7),
            coef8  => coef(8)
    );
    
    beta(0 ) <= beta0 ;
    beta(1 ) <= beta1 ;
    beta(2 ) <= beta2 ;
    beta(3 ) <= beta3 ;
    beta(4 ) <= beta4 ;
    beta(5 ) <= beta5 ;
    beta(6 ) <= beta6 ;
    beta(7 ) <= beta7 ;
    beta(8 ) <= beta8 ;
    beta(9 ) <= beta9 ;
    beta(10) <= beta10;
    beta(11) <= beta11;
    beta(12) <= beta12;
    beta(13) <= beta13;
    beta(14) <= beta14;
    beta(15) <= beta15;
    beta(16) <= beta16;
    beta(17) <= beta17;
    beta(18) <= beta18;
    beta(19) <= beta19;
    beta(20) <= beta20;
    beta(21) <= beta21;
    beta(22) <= beta22;
    beta(23) <= beta23;
    beta(24) <= beta24;
    beta(25) <= beta25;
    beta(26) <= beta26;
    beta(27) <= beta27;
    beta(28) <= beta28;
    beta(29) <= beta29;
    beta(30) <= beta30;
    beta(31) <= beta31;
    beta(32) <= beta32;
    beta(33) <= beta33;
    beta(34) <= beta34;
    beta(35) <= beta35;
    
    habilitador_sostenido : process(clk,rst) is begin
        if rst = '1' then
            hab_sos <= '0';
        elsif rising_edge(clk) then
            if hab = '1' then
                hab_sos <= '1';
            end if;
        end if;
    end process;
    
    dy_en_as_shift : process(clk,rst) is begin
        if rst = '1' then
            shft <= '0';
        elsif rising_edge(clk) then
            shft <= hab_sos;
            d_shft2 <= shft;
            d_shft3 <= d_shft2;
        end if;
    end process;
    
    en <= d_shft3;
    
    load_pulse : DetectFlancosSincro
    Port map (
        clk     => clk,
	    Entrada => hab_sos,
        PulsoB  => open,
		PulsoS  => load
    );
    
    regPS_4 : symb_shift_reg_4_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => shft,
        d0      => coef(1),
        d1      => coef(2),
        d2      => coef(3),
        d3      => coef(4),
        q_out   => q4,
        fin     => open
    );
    
    regPS_6 : symb_shift_reg_6_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => '0',
        d0      => coef(1),
        d1      => coef(2),
        d2      => coef(3),
        d3      => coef(4),
        d4      => coef(5),
        d5      => coef(6),
        q_out   => q6,
        fin     => open
    );
    
    regPS_8 : symb_shift_reg_8_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => '0',
        d0      => coef(1),
        d1      => coef(2),
        d2      => coef(3),
        d3      => coef(4),
        d4      => coef(5),
        d5      => coef(6),
        d6      => coef(7),
        d7      => coef(8),
        q_out   => q8,
        fin     => open
    );
    
    simbolos <= q4 when t2 = "00" else
                q6 when t2 = "01" else
                q8;
    elements <= simbolos when en = '1' else "000000";
    
    sindrome : for I in 0 to 35 generate
        s_alpha : mono_sindrome
        port map(
            clk => clk,
            rst => rst,
            simbolo => elements,
            alpha => beta(I),
            sindrome => sind_orig(I)
        );
        
        reg : FF_en
        port map(
            clk => clk,
            rst => rst,
            en => en and (not dy_count_end),
            D => sind_orig(I),
            Q => intrf_out(I)
        );
        
    end generate;
    
    z0  <= intrf_out(0 );
    z1  <= intrf_out(1 );
    z2  <= intrf_out(2 );
    z3  <= intrf_out(3 );
    z4  <= intrf_out(4 );
    z5  <= intrf_out(5 );
    z6  <= intrf_out(6 );
    z7  <= intrf_out(7 );
    z8  <= intrf_out(8 );
    z9  <= intrf_out(9 );
    z10 <= intrf_out(10);
    z11 <= intrf_out(11);
    z12 <= intrf_out(12);
    z13 <= intrf_out(13);
    z14 <= intrf_out(14);
    z15 <= intrf_out(15);
    z16 <= intrf_out(16);
    z17 <= intrf_out(17);
    z18 <= intrf_out(18);
    z19 <= intrf_out(19);
    z20 <= intrf_out(20);
    z21 <= intrf_out(21);
    z22 <= intrf_out(22);
    z23 <= intrf_out(23);
    z24 <= intrf_out(24);
    z25 <= intrf_out(25);
    z26 <= intrf_out(26);
    z27 <= intrf_out(27);
    z28 <= intrf_out(28);
    z29 <= intrf_out(29);
    z30 <= intrf_out(30);
    z31 <= intrf_out(31);
    z32 <= intrf_out(32);
    z33 <= intrf_out(33);
    z34 <= intrf_out(34);
    z35 <= intrf_out(35);
    
    contador4 : Contador_Lim_En_C
    generic map(Nbits => 4, Limite => 3) -- determinar bits necesarios
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => en and (not dy_count_end),
        Dout    => open,
        En_Out  => count_end4
    );
    
    contador6 : Contador_Lim_En_C
    generic map(Nbits => 4, Limite => 6) -- determinar bits necesarios
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => en and (not dy_count_end),
        Dout    => open,
        En_Out  => count_end6
    );
    
    contador8 : Contador_Lim_En_C
    generic map(Nbits => 4, Limite => 8) -- determinar bits necesarios
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => en and (not dy_count_end),
        Dout    => open,
        En_Out  => count_end8
    );
    
    count_end <= count_end4 when t2 = "00" else
                count_end6 when t2 = "01" else
                count_end8;
    
    delay_out_count : process (clk,rst) is begin
        if rst = '1' then
            dy_count_end <= '0';
        elsif rising_edge(clk) then
            dy_count_end <= count_end;
        end if;
    end process;
    
    fin <= dy_count_end;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS24169 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        simbolos : in std_logic_vector(5 downto 0);
        no_corregible : out std_logic;
        sin_errores : out std_logic;
        d0, d1, d2, d3, d4 : out std_logic_vector(5 downto 0);
        d5, d6, d7, d8, d9 : out std_logic_vector(5 downto 0);
        d10, d11, d12, d13, d14 : out std_logic_vector(5 downto 0);
        d15, d16, d17, d18, d19 : out std_logic_vector(5 downto 0);
        d20, d21, d22, d23 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end RS24169;

architecture Behavioral of RS24169 is
    
    component sindromes_2t_8 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        simbolos : in std_logic_vector(5 downto 0);
        s1 : out std_logic_vector(5 downto 0);
        s2 : out std_logic_vector(5 downto 0);
        s3 : out std_logic_vector(5 downto 0);
        s4 : out std_logic_vector(5 downto 0);
        s5 : out std_logic_vector(5 downto 0);
        s6 : out std_logic_vector(5 downto 0);
        s7 : out std_logic_vector(5 downto 0);
        s8 : out std_logic_vector(5 downto 0);
        sin_e : out std_logic;
        fin : out std_logic
    );
    end component;
    
    component DetectFlancosSincro is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
			  PulsoS : out  STD_LOGIC);
    end component;
    
    component berlekamp_masseyGF26 is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        hab : in std_logic;
        t2 : in std_logic_vector(1 downto 0);
        s1 : in std_logic_vector(5 downto 0);
        s2 : in std_logic_vector(5 downto 0);
        s3 : in std_logic_vector(5 downto 0);
        s4 : in std_logic_vector(5 downto 0);
        s5 : in std_logic_vector(5 downto 0);
        s6 : in std_logic_vector(5 downto 0);
        s7 : in std_logic_vector(5 downto 0);
        s8 : in std_logic_vector(5 downto 0);
        s9 : in std_logic_vector(5 downto 0);
        s10 : in std_logic_vector(5 downto 0);
        s11 : in std_logic_vector(5 downto 0);
        s12 : in std_logic_vector(5 downto 0);
        s13 : in std_logic_vector(5 downto 0);
        s14 : in std_logic_vector(5 downto 0);
        s15 : in std_logic_vector(5 downto 0);
        s16 : in std_logic_vector(5 downto 0);
        Ax0 : out std_logic_vector(5 downto 0);
        Ax1 : out std_logic_vector(5 downto 0);
        Ax2 : out std_logic_vector(5 downto 0);
        Ax3 : out std_logic_vector(5 downto 0);
        Ax4 : out std_logic_vector(5 downto 0);
        Ax5 : out std_logic_vector(5 downto 0);
        Ax6 : out std_logic_vector(5 downto 0);
        Ax7 : out std_logic_vector(5 downto 0);
        Ax8 : out std_logic_vector(5 downto 0);
        Ax9 : out std_logic_vector(5 downto 0);
        Ax10 : out std_logic_vector(5 downto 0);
        Ax11 : out std_logic_vector(5 downto 0);
        Ax12 : out std_logic_vector(5 downto 0);
        Ax13 : out std_logic_vector(5 downto 0);
        Ax14 : out std_logic_vector(5 downto 0);
        Ax15 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    component chien_searchGF26 is
    Port(
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        Ax0     : in std_logic_vector(5 downto 0);
        Ax1     : in std_logic_vector(5 downto 0);
        Ax2     : in std_logic_vector(5 downto 0);
        Ax3     : in std_logic_vector(5 downto 0);
        Ax4     : in std_logic_vector(5 downto 0);
        Ax5     : in std_logic_vector(5 downto 0);
        Ax6     : in std_logic_vector(5 downto 0);
        Ax7     : in std_logic_vector(5 downto 0);
        Ax8     : in std_logic_vector(5 downto 0);
        Ax9     : in std_logic_vector(5 downto 0);
        Ax10    : in std_logic_vector(5 downto 0);
        Ax11    : in std_logic_vector(5 downto 0);
        Ax12    : in std_logic_vector(5 downto 0);
        Ax13    : in std_logic_vector(5 downto 0);
        Ax14    : in std_logic_vector(5 downto 0);
        Ax15    : in std_logic_vector(5 downto 0);
        beta0   : out std_logic_vector(5 downto 0);
        beta1   : out std_logic_vector(5 downto 0);
        beta2   : out std_logic_vector(5 downto 0);
        beta3   : out std_logic_vector(5 downto 0);
        beta4   : out std_logic_vector(5 downto 0);
        beta5   : out std_logic_vector(5 downto 0);
        beta6   : out std_logic_vector(5 downto 0);
        beta7   : out std_logic_vector(5 downto 0);
        beta8   : out std_logic_vector(5 downto 0);
        beta9   : out std_logic_vector(5 downto 0);
        beta10  : out std_logic_vector(5 downto 0);
        beta11  : out std_logic_vector(5 downto 0);
        beta12  : out std_logic_vector(5 downto 0);
        beta13  : out std_logic_vector(5 downto 0);
        beta14  : out std_logic_vector(5 downto 0);
        beta15  : out std_logic_vector(5 downto 0);
        beta16  : out std_logic_vector(5 downto 0);
        beta17  : out std_logic_vector(5 downto 0);
        beta18  : out std_logic_vector(5 downto 0);
        beta19  : out std_logic_vector(5 downto 0);
        beta20  : out std_logic_vector(5 downto 0);
        beta21  : out std_logic_vector(5 downto 0);
        beta22  : out std_logic_vector(5 downto 0);
        beta23  : out std_logic_vector(5 downto 0);
        beta24  : out std_logic_vector(5 downto 0);
        beta25  : out std_logic_vector(5 downto 0);
        beta26  : out std_logic_vector(5 downto 0);
        beta27  : out std_logic_vector(5 downto 0);
        beta28  : out std_logic_vector(5 downto 0);
        beta29  : out std_logic_vector(5 downto 0);
        beta30  : out std_logic_vector(5 downto 0);
        beta31  : out std_logic_vector(5 downto 0);
        beta32  : out std_logic_vector(5 downto 0);
        beta33  : out std_logic_vector(5 downto 0);
        beta34  : out std_logic_vector(5 downto 0);
        beta35  : out std_logic_vector(5 downto 0);
        Et_OL   : out std_logic;
        fin     : out std_logic
    );
    end component;
    
    component forney_t_4 is
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
        fin     : out std_logic
    );
    end component;
    
    component Reg_Simbolos is
    Port (
        clk         : in std_logic;
        reset       : in std_logic;
        En          : in std_logic;
        t2          : in std_logic;
        Sim_in      : in std_logic_vector (5 downto 0);
        Sim0_out    : out std_logic_vector(5 downto 0);
        Sim1_out    : out std_logic_vector(5 downto 0);
        Sim2_out    : out std_logic_vector(5 downto 0);
        Sim3_out    : out std_logic_vector(5 downto 0);
        Sim4_out    : out std_logic_vector(5 downto 0);
        Sim5_out    : out std_logic_vector(5 downto 0);
        Sim6_out    : out std_logic_vector(5 downto 0);
        Sim7_out    : out std_logic_vector(5 downto 0);
        Sim8_out    : out std_logic_vector(5 downto 0);
        Sim9_out    : out std_logic_vector(5 downto 0);
        Sim10_out   : out std_logic_vector(5 downto 0);
        Sim11_out   : out std_logic_vector(5 downto 0);
        Sim12_out   : out std_logic_vector(5 downto 0);
        Sim13_out   : out std_logic_vector(5 downto 0);
        Sim14_out   : out std_logic_vector(5 downto 0);
        Sim15_out   : out std_logic_vector(5 downto 0);
        Sim16_out   : out std_logic_vector(5 downto 0);
        Sim17_out   : out std_logic_vector(5 downto 0);
        Sim18_out   : out std_logic_vector(5 downto 0);
        Sim19_out   : out std_logic_vector(5 downto 0);
        Sim20_out   : out std_logic_vector(5 downto 0);
        Sim21_out   : out std_logic_vector(5 downto 0);
        Sim22_out   : out std_logic_vector(5 downto 0); 
        Sim23_out   : out std_logic_vector(5 downto 0);
        Sim24_out   : out std_logic_vector(5 downto 0);
        Sim25_out   : out std_logic_vector(5 downto 0);
        Sim26_out   : out std_logic_vector(5 downto 0);
        Sim27_out   : out std_logic_vector(5 downto 0);
        Sim28_out   : out std_logic_vector(5 downto 0);
        Sim29_out   : out std_logic_vector(5 downto 0);
        Sim30_out   : out std_logic_vector(5 downto 0);
        Sim31_out   : out std_logic_vector(5 downto 0);
        Sim32_out   : out std_logic_vector(5 downto 0);
        Sim33_out   : out std_logic_vector(5 downto 0);
        Sim34_out   : out std_logic_vector(5 downto 0);
        Sim35_out   : out std_logic_vector(5 downto 0);
        En_out      : out std_logic  
    );
    end component;
    
    type t2_8_array is array (0 to 7) of std_logic_vector(5 downto 0);
    signal sindrom : t2_8_array;
    
    type ax_array is array (0 to 15) of std_logic_vector(5 downto 0);
    signal ax : ax_array;
    
    type beta_array is array (0 to 23) of std_logic_vector(5 downto 0);
    signal beta, sa, cx, shft : beta_array;
    
    signal en_BMA, hab_BMA, sin_e_sind, fin_sind, fin_BMA : std_logic;
    signal hab_CHIEN, fin_CHIEN, hab_FORNEY, et_OL : std_logic;
    signal shft_en : std_logic;

begin

    SINDROMS : sindromes_2t_8
    port map(
        clk => clk,
        rst => rst,
        en => en,
        simbolos => simbolos,
        s1 => sindrom(0),
        s2 => sindrom(1),
        s3 => sindrom(2),
        s4 => sindrom(3),
        s5 => sindrom(4),
        s6 => sindrom(5),
        s7 => sindrom(6),
        s8 => sindrom(7),
        sin_e => sin_e_sind,
        fin => fin_sind
    );
    
    -- Utilizar fin y sin_e para condicionar el habilitador siguiente
    en_BMA <= fin_sind and (not sin_e_sind);
    sin_errores <= not en_BMA;
    
    habilitador_BMA : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => en_BMA,
        PulsoB => open,
        PulsoS => hab_BMA
    );
    
    BMA : berlekamp_masseyGF26
    port map(
        rst => rst,
        clk => clk,
        hab => hab_BMA,
        t2 => "00",
        s1  => sindrom(0),
        s2  => sindrom(1),
        s3  => sindrom(2),
        s4  => sindrom(3),
        s5  => sindrom(4),
        s6  => sindrom(5),
        s7  => sindrom(6),
        s8  => sindrom(7),
        s9  => "000000",
        s10 => "000000",
        s11 => "000000",
        s12 => "000000",
        s13 => "000000",
        s14 => "000000",
        s15 => "000000",
        s16 => "000000",
        Ax0  => ax(0),
        Ax1  => ax(1),
        Ax2  => ax(2),
        Ax3  => ax(3),
        Ax4  => ax(4),
        Ax5  => ax(5),
        Ax6  => ax(6),
        Ax7  => ax(7),
        Ax8  => ax(8),
        Ax9  => ax(9),
        Ax10 => ax(10),
        Ax11 => ax(11),
        Ax12 => ax(12),
        Ax13 => ax(13),
        Ax14 => ax(14),
        Ax15 => ax(15),
        fin  => fin_BMA
    );
    
    habilitador_CHIEN : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => fin_BMA,
        PulsoB => open,
        PulsoS => hab_CHIEN
    );
    
    CHIEN : chien_searchGF26
    port map(
        clk => clk,
        rst => rst,
        hab => hab_CHIEN,
        Ax0  => ax(0), 
        Ax1  => ax(1), 
        Ax2  => ax(2), 
        Ax3  => ax(3), 
        Ax4  => ax(4), 
        Ax5  => ax(5), 
        Ax6  => ax(6), 
        Ax7  => ax(7), 
        Ax8  => ax(8), 
        Ax9  => ax(9), 
        Ax10 => ax(10),
        Ax11 => ax(11),
        Ax12 => ax(12),
        Ax13 => ax(13),
        Ax14 => ax(14),
        Ax15 => ax(15),
        beta0  => beta(0),
        beta1  => beta(1),
        beta2  => beta(2),
        beta3  => beta(3),
        beta4  => beta(4),
        beta5  => beta(5),
        beta6  => beta(6),
        beta7  => beta(7),
        beta8  => beta(8),
        beta9  => beta(9),
        beta10 => beta(10),
        beta11 => beta(11),
        beta12 => beta(12),
        beta13 => beta(13),
        beta14 => beta(14),
        beta15 => beta(15),
        beta16 => beta(16),
        beta17 => beta(17),
        beta18 => beta(18),
        beta19 => beta(19),
        beta20 => beta(20),
        beta21 => beta(21),
        beta22 => beta(22),
        beta23 => beta(23),
        beta24 => open,
        beta25 => open,
        beta26 => open,
        beta27 => open,
        beta28 => open,
        beta29 => open,
        beta30 => open,
        beta31 => open,
        beta32 => open,
        beta33 => open,
        beta34 => open,
        beta35 => open,
        Et_OL => et_OL,
        fin => fin_CHIEN
    );
    
    no_corregible <= et_OL;
    
    habilitador_FORNEY : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => fin_CHIEN,
        PulsoB => open,
        PulsoS => hab_FORNEY
    );
    
    FORNEY : forney_t_4
    port map(
        clk => clk,
        rst => rst,
        hab => hab_FORNEY and (not et_OL),
        s1      => sindrom(0),
        s2      => sindrom(1),
        s3      => sindrom(2),
        s4      => sindrom(3),
        s5      => sindrom(4),
        s6      => sindrom(5),
        s7      => sindrom(6),
        s8      => sindrom(7),
        sigma1  => ax(1),
        sigma2  => ax(2),
        sigma3  => ax(3),
        sigma4  => ax(4),
        sigma5  => ax(5),
        sigma6  => ax(6),
        sigma7  => ax(7),
        sigma8  => ax(8),
        sigma9  => ax(9),
        sigma10 => ax(10),
        sigma11 => ax(11),
        sigma12 => ax(12),
        sigma13 => ax(13),
        sigma14 => ax(14),
        sigma15 => ax(15),
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
        beta24  => "000000",
        beta25  => "000000",
        beta26  => "000000",
        beta27  => "000000",
        beta28  => "000000",
        beta29  => "000000",
        beta30  => "000000",
        beta31  => "000000",
        beta32  => "000000",
        beta33  => "000000",
        beta34  => "000000",
        beta35  => "000000",
        val0    => sa(0 ),
        val1    => sa(1 ),
        val2    => sa(2 ),
        val3    => sa(3 ),
        val4    => sa(4 ),
        val5    => sa(5 ),
        val6    => sa(6 ),
        val7    => sa(7 ),
        val8    => sa(8 ),
        val9    => sa(9 ),
        val10   => sa(10),
        val11   => sa(11),
        val12   => sa(12),
        val13   => sa(13),
        val14   => sa(14),
        val15   => sa(15),
        val16   => sa(16),
        val17   => sa(17),
        val18   => sa(18),
        val19   => sa(19),
        val20   => sa(20),
        val21   => sa(21),
        val22   => sa(22),
        val23   => sa(23),
        fin     => fin
    );
    
    reg_data_in : Reg_Simbolos
    port map(
        clk => clk,
        reset => rst,
        En => en,
        t2 => '0',
        Sim_in => simbolos,
        Sim0_out  => shft(0),
        Sim1_out  => shft(1),
        Sim2_out  => shft(2),
        Sim3_out  => shft(3),
        Sim4_out  => shft(4),
        Sim5_out  => shft(5),
        Sim6_out  => shft(6),
        Sim7_out  => shft(7),
        Sim8_out  => shft(8),
        Sim9_out  => shft(9),
        Sim10_out => shft(10),
        Sim11_out => shft(11),
        Sim12_out => shft(12),
        Sim13_out => shft(13),
        Sim14_out => shft(14),
        Sim15_out => shft(15),
        Sim16_out => shft(16),
        Sim17_out => shft(17),
        Sim18_out => shft(18),
        Sim19_out => shft(19),
        Sim20_out => shft(20),
        Sim21_out => shft(21),
        Sim22_out => shft(22),
        Sim23_out => shft(23),
        En_out => shft_en
    );
    
    reg_data_shift : for I in 0 to 23 generate
        reg_shift : process (clk, rst) is begin
            if rst = '1' then
                cx(I) <= (others => '0');
            elsif rising_edge(clk) then
                if shft_en = '1' then
                    cx(I) <= shft(I);
                end if;
            end if;
        end process;
        
    end generate;
    
    d0  <= cx(23) xor sa(0);
    d1  <= cx(22) xor sa(1);
    d2  <= cx(21) xor sa(2);
    d3  <= cx(20) xor sa(3);
    d4  <= cx(19) xor sa(4);
    d5  <= cx(18) xor sa(5);
    d6  <= cx(17) xor sa(6);
    d7  <= cx(16) xor sa(7);
    d8  <= cx(15) xor sa(8);
    d9  <= cx(14) xor sa(9);
    d10 <= cx(13) xor sa(10);
    d11 <= cx(12) xor sa(11);
    d12 <= cx(11) xor sa(12);
    d13 <= cx(10) xor sa(13);
    d14 <= cx(9)  xor sa(14);
    d15 <= cx(8)  xor sa(15);
    d16 <= cx(7)  xor sa(16);
    d17 <= cx(6)  xor sa(17);
    d18 <= cx(5)  xor sa(18);
    d19 <= cx(4)  xor sa(19);
    d20 <= cx(3)  xor sa(20);
    d21 <= cx(2)  xor sa(21);
    d22 <= cx(1)  xor sa(22);
    d23 <= cx(0)  xor sa(23);
              
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity RSdecoder is
    Port(
        clk             : in std_logic;
        rst             : in std_logic;
        en              : in std_logic;
        t2              : in std_logic_vector(1 downto 0);
        simbolos        : in std_logic_vector(5 downto 0);
        no_corregible   : out std_logic;
        mx0             : out std_logic_vector(5 downto 0);
        mx1             : out std_logic_vector(5 downto 0);
        mx2             : out std_logic_vector(5 downto 0);
        mx3             : out std_logic_vector(5 downto 0);
        mx4             : out std_logic_vector(5 downto 0);
        mx5             : out std_logic_vector(5 downto 0);
        mx6             : out std_logic_vector(5 downto 0);
        mx7             : out std_logic_vector(5 downto 0);
        mx8             : out std_logic_vector(5 downto 0);
        mx9             : out std_logic_vector(5 downto 0);
        mx10            : out std_logic_vector(5 downto 0);
        mx11            : out std_logic_vector(5 downto 0);
        mx12            : out std_logic_vector(5 downto 0);
        mx13            : out std_logic_vector(5 downto 0);
        mx14            : out std_logic_vector(5 downto 0);
        mx15            : out std_logic_vector(5 downto 0);
        mx16            : out std_logic_vector(5 downto 0);
        mx17            : out std_logic_vector(5 downto 0);
        mx18            : out std_logic_vector(5 downto 0);
        mx19            : out std_logic_vector(5 downto 0);
        mx20            : out std_logic_vector(5 downto 0);
        mx21            : out std_logic_vector(5 downto 0);
        mx22            : out std_logic_vector(5 downto 0);
        mx23            : out std_logic_vector(5 downto 0);
        mx24            : out std_logic_vector(5 downto 0);
        mx25            : out std_logic_vector(5 downto 0);
        mx26            : out std_logic_vector(5 downto 0);
        mx27            : out std_logic_vector(5 downto 0);
        mx28            : out std_logic_vector(5 downto 0);
        mx29            : out std_logic_vector(5 downto 0);
        mx30            : out std_logic_vector(5 downto 0);
        mx31            : out std_logic_vector(5 downto 0);
        mx32            : out std_logic_vector(5 downto 0);
        mx33            : out std_logic_vector(5 downto 0);
        mx34            : out std_logic_vector(5 downto 0);
        mx35            : out std_logic_vector(5 downto 0);
        fin             : out std_logic
    );
end RSdecoder;

architecture Behavioral of RSdecoder is

    component sindroms_2t is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        t2 : in std_logic_vector(1 downto 0);
        simbolos : in std_logic_vector(5 downto 0);
        s1  : out std_logic_vector(5 downto 0);
        s2  : out std_logic_vector(5 downto 0);
        s3  : out std_logic_vector(5 downto 0);
        s4  : out std_logic_vector(5 downto 0);
        s5  : out std_logic_vector(5 downto 0);
        s6  : out std_logic_vector(5 downto 0);
        s7  : out std_logic_vector(5 downto 0);
        s8  : out std_logic_vector(5 downto 0);
        s9  : out std_logic_vector(5 downto 0);
        s10 : out std_logic_vector(5 downto 0);
        s11 : out std_logic_vector(5 downto 0);
        s12 : out std_logic_vector(5 downto 0);
        s13 : out std_logic_vector(5 downto 0);
        s14 : out std_logic_vector(5 downto 0);
        s15 : out std_logic_vector(5 downto 0);
        s16 : out std_logic_vector(5 downto 0);
        sin_e : out std_logic;
        fin : out std_logic
    );
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
    
    component forney_RS is
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
    
    component symb_shift_reg_24_en is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        load    : in std_logic;
        shift   : in std_logic;
        d0      : in std_logic_vector(5 downto 0);
        d1      : in std_logic_vector(5 downto 0);
        d2      : in std_logic_vector(5 downto 0);
        d3      : in std_logic_vector(5 downto 0);
        d4      : in std_logic_vector(5 downto 0);
        d5      : in std_logic_vector(5 downto 0);
        d6      : in std_logic_vector(5 downto 0);
        d7      : in std_logic_vector(5 downto 0);
        d8      : in std_logic_vector(5 downto 0);
        d9      : in std_logic_vector(5 downto 0);
        d10     : in std_logic_vector(5 downto 0);
        d11     : in std_logic_vector(5 downto 0);
        d12     : in std_logic_vector(5 downto 0);
        d13     : in std_logic_vector(5 downto 0);
        d14     : in std_logic_vector(5 downto 0);
        d15     : in std_logic_vector(5 downto 0);
        d16     : in std_logic_vector(5 downto 0);
        d17     : in std_logic_vector(5 downto 0);
        d18     : in std_logic_vector(5 downto 0);
        d19     : in std_logic_vector(5 downto 0);
        d20     : in std_logic_vector(5 downto 0);
        d21     : in std_logic_vector(5 downto 0);
        d22     : in std_logic_vector(5 downto 0);
        d23     : in std_logic_vector(5 downto 0);
        q_out   : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
    end component;
    
    type sind_long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal s, ax : sind_long;
    
    type symb_long is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, shft, rx, sa, mout : symb_long;
    
    signal en_BMA, hab_BMA, sin_e_sind, fin_sind, fin_BMA : std_logic;
    signal hab_CHIEN, fin_CHIEN, hab_FORNEY, fin_FORNEY, et_OL : std_logic;
    signal load, reg_shft, reg_shft2, reg_shft3 : std_logic;
    
    signal out_reg24 : std_logic_vector(5 downto 0);
    
begin

    rx_shift_reg : Reg_Simbolos
    port map(
        clk         => clk,
        reset       => rst,
        En          => en,
        t2          => t2(1),
        Sim_in      => simbolos,
        Sim0_out    => rx(0),
        Sim1_out    => rx(1),
        Sim2_out    => rx(2),
        Sim3_out    => rx(3),
        Sim4_out    => rx(4),
        Sim5_out    => rx(5),
        Sim6_out    => rx(6),
        Sim7_out    => rx(7),
        Sim8_out    => rx(8),
        Sim9_out    => rx(9),
        Sim10_out   => rx(10),
        Sim11_out   => rx(11),
        Sim12_out   => rx(12),
        Sim13_out   => rx(13),
        Sim14_out   => rx(14),
        Sim15_out   => rx(15),
        Sim16_out   => rx(16),
        Sim17_out   => rx(17),
        Sim18_out   => rx(18),
        Sim19_out   => rx(19),
        Sim20_out   => rx(20),
        Sim21_out   => rx(21),
        Sim22_out   => rx(22),
        Sim23_out   => rx(23),
        Sim24_out   => rx(24),
        Sim25_out   => rx(25),
        Sim26_out   => rx(26),
        Sim27_out   => rx(27),
        Sim28_out   => rx(28),
        Sim29_out   => rx(29),
        Sim30_out   => rx(30),
        Sim31_out   => rx(31),
        Sim32_out   => rx(32),
        Sim33_out   => rx(33),
        Sim34_out   => rx(34),
        Sim35_out   => rx(35),
        En_out      => open
    );
    
    
------------------------------------------------------------------------------------    
    load_pulse : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => en,
        PulsoB => open,
        PulsoS => load
    );
    
    delay_shft : process(clk) is begin
        if rising_edge(clk) then
            reg_shft  <= en;
            reg_shft2 <= reg_shft;
            reg_shft3 <= reg_shft2;
        end if;
    end process;
    
    reg_PS24 : symb_shift_reg_24_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => reg_shft,
        d0      => "000111", --ex^0
        d1      => "110001", --x^1
        d2      => "000101", --x^2
        d3      => "011000", --x^3
        d4      => "011011", --x^4
        d5      => "001000", --x^5
        d6      => "001111", --ex^6
        d7      => "000111", --x^7
        d8      => "000010", --x^8
        d9      => "000100", --x^9
        d10     => "001000", --x^10
        d11     => "010000", --x^11
        d12     => "100000", --x^12
        d13     => "000011", --x^13
        d14     => "000110", --x^14
        d15     => "001100", --x^15
        d16     => "111000", --ex^16
        d17     => "110000", --x^17
        d18     => "100011", --x^18
        d19     => "000101", --x^19
        d20     => "001010", --x^20
        d21     => "010100", --x^21
        d22     => "101000", --x^22
        d23     => "110011", --ex^23
        q_out   => out_reg24,
        fin     => open
    );
------------------------------------------------------------------------------------

    SINDROMS : sindroms_2t
    port map(
        clk => clk,
        rst => rst,
        en => reg_shft3, --en, --entrada en serie
        t2 => t2,
        simbolos => out_reg24, --simbolos, --entrada en serie
        s1  => s(0),
        s2  => s(1),
        s3  => s(2),
        s4  => s(3),
        s5  => s(4),
        s6  => s(5),
        s7  => s(6),
        s8  => s(7),
        s9  => s(8),
        s10 => s(9),
        s11 => s(10),
        s12 => s(11),
        s13 => s(12),
        s14 => s(13),
        s15 => s(14),
        s16 => s(15),
        sin_e => sin_e_sind,
        fin => fin_sind
    );
    
    -- Utilizar fin y sin_e para condicionar el habilitador siguiente
    en_BMA <= fin_sind and (not sin_e_sind);
    
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
        t2  => t2,
        s1  => s(0), 
        s2  => s(1), 
        s3  => s(2), 
        s4  => s(3), 
        s5  => s(4), 
        s6  => s(5), 
        s7  => s(6), 
        s8  => s(7), 
        s9  => s(8), 
        s10 => s(9), 
        s11 => s(10),
        s12 => s(11),
        s13 => s(12),
        s14 => s(13),
        s15 => s(14),
        s16 => s(15),
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
        fin => fin_BMA
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
        beta24 => beta(24),
        beta25 => beta(25),
        beta26 => beta(26),
        beta27 => beta(27),
        beta28 => beta(28),
        beta29 => beta(29),
        beta30 => beta(30),
        beta31 => beta(31),
        beta32 => beta(32),
        beta33 => beta(33),
        beta34 => beta(34),
        beta35 => beta(35),
        Et_OL => et_OL,
        fin => fin_CHIEN
    );
    
    no_corregible <= et_OL;
    
    habilitador_FORNEY : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => fin_CHIEN and (not et_OL),
        PulsoB => open,
        PulsoS => hab_FORNEY
    );
    
    FORNEY : forney_RS
    port map(
        clk     => clk,
        rst     => rst,
        hab     => hab_FORNEY,
        t2      => t2,
        s1      => s(0),
        s2      => s(1),
        s3      => s(2),
        s4      => s(3),
        s5      => s(4),
        s6      => s(5),
        s7      => s(6),
        s8      => s(7),
        sigma1  => ax(1),
        sigma2  => ax(2),
        sigma3  => ax(3),
        sigma4  => ax(4),
        sigma5  => ax(5),
        sigma6  => ax(6),
        sigma7  => ax(7),
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
        val0    => sa(0),
        val1    => sa(1),
        val2    => sa(2),
        val3    => sa(3),
        val4    => sa(4),
        val5    => sa(5),
        val6    => sa(6),
        val7    => sa(7),
        val8    => sa(8),
        val9    => sa(9),
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
        val24   => sa(24),
        val25   => sa(25),
        val26   => sa(26),
        val27   => sa(27),
        val28   => sa(28),
        val29   => sa(29),
        val30   => sa(30),
        val31   => sa(31),
        val32   => sa(32),
        val33   => sa(33),
        val34   => sa(34),
        val35   => sa(35),
        fin     => fin_FORNEY
    );
    
    mx0  <= rx(0) xor sa(0);
    mx1  <= rx(1) xor sa(1);
    mx2  <= rx(2) xor sa(2);
    mx3  <= rx(3) xor sa(3);
    mx4  <= rx(4) xor sa(4);
    mx5  <= rx(5) xor sa(5);
    mx6  <= rx(6) xor sa(6);
    mx7  <= rx(7) xor sa(7);
    mx8  <= rx(8) xor sa(8);
    mx9  <= rx(9) xor sa(9);
    mx10 <= rx(10) xor sa(10);
    mx11 <= rx(11) xor sa(11);
    mx12 <= rx(12) xor sa(12);
    mx13 <= rx(13) xor sa(13);
    mx14 <= rx(14) xor sa(14);
    mx15 <= rx(15) xor sa(15);
    mx16 <= rx(16) xor sa(16);
    mx17 <= rx(17) xor sa(17);
    mx18 <= rx(18) xor sa(18);
    mx19 <= rx(19) xor sa(19);
    mx20 <= rx(20) xor sa(20);
    mx21 <= rx(21) xor sa(21);
    mx22 <= rx(22) xor sa(22);
    mx23 <= rx(23) xor sa(23);
    mx24 <= rx(24) xor sa(24);
    mx25 <= rx(25) xor sa(25);
    mx26 <= rx(26) xor sa(26);
    mx27 <= rx(27) xor sa(27);
    mx28 <= rx(28) xor sa(28);
    mx29 <= rx(29) xor sa(29);
    mx30 <= rx(30) xor sa(30);
    mx31 <= rx(31) xor sa(31);
    mx32 <= rx(32) xor sa(32);
    mx33 <= rx(33) xor sa(33);
    mx34 <= rx(34) xor sa(34);
    mx35 <= rx(35) xor sa(35);
    
    fin <= sin_e_sind or (fin_sind and fin_BMA and fin_CHIEN and fin_FORNEY) or et_OL;
    
-- Para sintesis y estimacion de recursos ocupados    
--    mout(0)  <= rx(0) xor sa(0);
--    mout(1)  <= rx(1) xor sa(1);
--    mout(2)  <= rx(2) xor sa(2);
--    mout(3)  <= rx(3) xor sa(3);
--    mout(4)  <= rx(4) xor sa(4);
--    mout(5)  <= rx(5) xor sa(5);
--    mout(6)  <= rx(6) xor sa(6);
--    mout(7)  <= rx(7) xor sa(7);
--    mout(8)  <= rx(8) xor sa(8);
--    mout(9)  <= rx(9) xor sa(9);
--    mout(10) <= rx(10) xor sa(10);
--    mout(11) <= rx(11) xor sa(11);
--    mout(12) <= rx(12) xor sa(12);
--    mout(13) <= rx(13) xor sa(13);
--    mout(14) <= rx(14) xor sa(14);
--    mout(15) <= rx(15) xor sa(15);
--    mout(16) <= rx(16) xor sa(16);
--    mout(17) <= rx(17) xor sa(17);
--    mout(18) <= rx(18) xor sa(18);
--    mout(19) <= rx(19) xor sa(19);
--    mout(20) <= rx(20) xor sa(20);
--    mout(21) <= rx(21) xor sa(21);
--    mout(22) <= rx(22) xor sa(22);
--    mout(23) <= rx(23) xor sa(23);
--    mout(24) <= rx(24) xor sa(24);
--    mout(25) <= rx(25) xor sa(25);
--    mout(26) <= rx(26) xor sa(26);
--    mout(27) <= rx(27) xor sa(27);
--    mout(28) <= rx(28) xor sa(28);
--    mout(29) <= rx(29) xor sa(29);
--    mout(30) <= rx(30) xor sa(30);
--    mout(31) <= rx(31) xor sa(31);
--    mout(32) <= rx(32) xor sa(32);
--    mout(33) <= rx(33) xor sa(33);
--    mout(34) <= rx(34) xor sa(34);
--    mout(35) <= rx(35) xor sa(35);
--    mx0 <= mout(0) xor mout(1) xor mout(2) xor mout(3) xor mout(4) xor mout(5) xor mout(6) xor mout(7) xor mout(8) xor mout(9) xor mout(10) xor mout(11) xor mout(12) xor mout(13) xor mout(14) xor mout(15) xor mout(16) xor mout(17) xor mout(18) xor mout(19) xor mout(20) xor mout(21) xor mout(22) xor mout(23) xor mout(24) xor mout(25) xor mout(26) xor mout(27) xor mout(28) xor mout(29) xor mout(30) xor mout(31) xor mout(32) xor mout(33) xor mout(34) xor mout(35);
    
    
end Behavioral;

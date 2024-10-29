library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z0_evaluator is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2s     : in std_logic_vector(1 downto 0);
        s1      : in std_logic_vector(5 downto 0);
        s2      : in std_logic_vector(5 downto 0);
        s3      : in std_logic_vector(5 downto 0);
        s4      : in std_logic_vector(5 downto 0);
        s5      : in std_logic_vector(5 downto 0);
        s6      : in std_logic_vector(5 downto 0);
        s7      : in std_logic_vector(5 downto 0);
        s8      : in std_logic_vector(5 downto 0);
        s9      : in std_logic_vector(5 downto 0);
        s10     : in std_logic_vector(5 downto 0);
        s11     : in std_logic_vector(5 downto 0);
        s12     : in std_logic_vector(5 downto 0);
        s13     : in std_logic_vector(5 downto 0);
        s14     : in std_logic_vector(5 downto 0);
        s15     : in std_logic_vector(5 downto 0);
        s16     : in std_logic_vector(5 downto 0);
        ax1     : in std_logic_vector(5 downto 0);
        ax2     : in std_logic_vector(5 downto 0);
        ax3     : in std_logic_vector(5 downto 0);
        ax4     : in std_logic_vector(5 downto 0);
        ax5     : in std_logic_vector(5 downto 0);
        ax6     : in std_logic_vector(5 downto 0);
        ax7     : in std_logic_vector(5 downto 0);
        ax8     : in std_logic_vector(5 downto 0);
        ax9     : in std_logic_vector(5 downto 0);
        ax10    : in std_logic_vector(5 downto 0);
        ax11    : in std_logic_vector(5 downto 0);
        ax12    : in std_logic_vector(5 downto 0);
        ax13    : in std_logic_vector(5 downto 0);
        ax14    : in std_logic_vector(5 downto 0);
        ax15    : in std_logic_vector(5 downto 0);
        ax16    : in std_logic_vector(5 downto 0); 
        beta1   : in std_logic_vector(5 downto 0);
        beta2   : in std_logic_vector(5 downto 0);
        beta3   : in std_logic_vector(5 downto 0);
        beta4   : in std_logic_vector(5 downto 0);
        beta5   : in std_logic_vector(5 downto 0);
        beta6   : in std_logic_vector(5 downto 0);
        beta7   : in std_logic_vector(5 downto 0);
        beta8   : in std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end z0_evaluator;

architecture Behavioral of z0_evaluator is

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
            s9  : in std_logic_vector(5 downto 0);
            s10 : in std_logic_vector(5 downto 0);
            s11 : in std_logic_vector(5 downto 0);
            s12 : in std_logic_vector(5 downto 0);
            s13 : in std_logic_vector(5 downto 0);
            s14 : in std_logic_vector(5 downto 0);
            s15 : in std_logic_vector(5 downto 0);
            s16 : in std_logic_vector(5 downto 0);
            ax1  : in std_logic_vector(5 downto 0);
            ax2  : in std_logic_vector(5 downto 0);
            ax3  : in std_logic_vector(5 downto 0);
            ax4  : in std_logic_vector(5 downto 0);
            ax5  : in std_logic_vector(5 downto 0);
            ax6  : in std_logic_vector(5 downto 0);
            ax7  : in std_logic_vector(5 downto 0);
            ax8  : in std_logic_vector(5 downto 0);
            ax9  : in std_logic_vector(5 downto 0);
            ax10 : in std_logic_vector(5 downto 0);
            ax11 : in std_logic_vector(5 downto 0);
            ax12 : in std_logic_vector(5 downto 0);
            ax13 : in std_logic_vector(5 downto 0);
            ax14 : in std_logic_vector(5 downto 0);
            ax15 : in std_logic_vector(5 downto 0);
            ax16 : in std_logic_vector(5 downto 0);
            coef1  : out std_logic_vector(5 downto 0);
            coef2  : out std_logic_vector(5 downto 0);
            coef3  : out std_logic_vector(5 downto 0);
            coef4  : out std_logic_vector(5 downto 0);
            coef5  : out std_logic_vector(5 downto 0);
            coef6  : out std_logic_vector(5 downto 0);
            coef7  : out std_logic_vector(5 downto 0);
            coef8  : out std_logic_vector(5 downto 0);
            coef9  : out std_logic_vector(5 downto 0);
            coef10 : out std_logic_vector(5 downto 0)
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

    component Contador is
        Generic(Nbits: integer:=26);
        Port (
            Reset    : in STD_LOGIC;
            Clk      : in STD_LOGIC;
            En       : in STD_LOGIC;
            Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
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

    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;

    type array_coef is array (0 to 7) of std_logic_vector(5 downto 0);
    signal cf : array_coef;

    type array_8 is array (0 to 3) of std_logic_vector(5 downto 0);
    signal z0_8, sum8, prod8, reg_beta8, beta8 : array_8;

    signal habilitador, d_hab, fin_reg : std_logic;

    signal conteo_s : std_logic_vector(4 downto 0);
    signal dato : std_logic_vector(5 downto 0);

begin

    habilitador_General : process(clk,rst) is begin
        if rst = '1'  then
            habilitador <= '0';
        elsif rising_edge(clk) then
            if hab = '1' then
                habilitador <= '1';
            end if;
        end if;
    end process;

    delay_habilitador : process (clk,rst) is begin
        if rst = '1' then
            d_hab <= '0';
        elsif rising_edge(clk) then
            d_hab <= habilitador;
        end if;
    end process;

    conteo_libre : Contador
    generic map( nbits => 4 )
    port map(
        Reset => rst,
        Clk => clk,
        En => d_hab,
        Dout => conteo_s
    );

    Z0_coeficients : z0_coef
    port map(
        s1      => s1  ,
        s2      => s2  ,
        s3      => s3  ,
        s4      => s4  ,
        s5      => s5  ,
        s6      => s6  ,
        s7      => s7  ,
        s8      => s8  ,
        s9      => s9  ,
        s10     => s10 ,
        s11     => s11 ,
        s12     => s12 ,
        s13     => s13 ,
        s14     => s14 ,
        s15     => s15 ,
        s16     => s16 ,
        ax1     => ax1 ,
        ax2     => ax2 ,
        ax3     => ax3 ,
        ax4     => ax4 ,
        ax5     => ax5 ,
        ax6     => ax6 ,
        ax7     => ax7 ,
        ax8     => ax8 ,
        ax9     => ax9 ,
        ax10    => ax10,
        ax11    => ax11,
        ax12    => ax12,
        ax13    => ax13,
        ax14    => ax14,
        ax15    => ax15,
        ax16    => ax16,
        coef1   => cf(0),
        coef2   => cf(1),
        coef3   => cf(2),
        coef4   => cf(3),
        coef5   => cf(4),
        coef6   => cf(5),
        coef7   => cf(6),
        coef8   => cf(7)
    );

    --#######################################_RS(24,16,9)_#############################################
    beta8(0) <= beta1;
    beta8(1) <= beta2;
    beta8(2) <= beta3;
    beta8(3) <= beta4;

    coef_shift_reg_8 : symb_shift_reg_8_en
    port map(
        clk => clk,
        rst => rst,
        load => '0',
        shift => conteo_s(0),
        d0  => cf(0),
        d1  => cf(1),
        d2  => cf(2),
        d3  => cf(3),
        d4  => cf(4),
        d5  => cf(5),
        d6  => cf(6),
        d7  => cf(7),
        q_out => dato,
        fin => fin_reg
    );

    eval_Z0_24169 : for I in 0 to 3 generate
            
        reg_8_array : FF_en
        port map(
            clk => clk,
            en => conteo_s(0) and (not fin_reg),
            rst => rst,
            d => sum_8(I),
            q => reg_beta8(I)
        );

        prod_8_array : prod_alpha
        port map(
            alphaA => reg_beta8(I),
            alphaB => beta8(I),
            alphaR => prod8(I)
        );

        sum8(I) <= dato xor prod8(I);
        z0_8(I) <= reg_beta8(I);

    end generate;

    --##################################################################################################

end Behavioral;

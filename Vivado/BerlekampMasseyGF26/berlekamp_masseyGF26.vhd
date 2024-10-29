library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity berlekamp_masseyGF26 is
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
end berlekamp_masseyGF26;

architecture Behavioral of berlekamp_masseyGF26 is
       
    component d_function_GF26 is
    Port (
        rst, clk, hab : in std_logic;
        K : in std_logic_vector(4 downto 0);
        L : in std_logic_vector(4 downto 0);
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
        ax0  : in std_logic_vector(5 downto 0);
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
        fin : out std_logic;
        d : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component Ax_evaluator_RS is
        Port (
            rst, clk, hab : in std_logic;
            j : in std_logic_vector(5 downto 0);
            d : in std_logic_vector(5 downto 0);
            dm : in std_logic_vector(5 downto 0);
            Ax0  : in std_logic_vector(5 downto 0);
            Ax1  : in std_logic_vector(5 downto 0);
            Ax2  : in std_logic_vector(5 downto 0);
            Ax3  : in std_logic_vector(5 downto 0);
            Ax4  : in std_logic_vector(5 downto 0);
            Ax5  : in std_logic_vector(5 downto 0);
            Ax6  : in std_logic_vector(5 downto 0);
            Ax7  : in std_logic_vector(5 downto 0);
            Ax8  : in std_logic_vector(5 downto 0);
            Ax9  : in std_logic_vector(5 downto 0);
            Ax10 : in std_logic_vector(5 downto 0);
            Ax11 : in std_logic_vector(5 downto 0);
            Ax12 : in std_logic_vector(5 downto 0);
            Ax13 : in std_logic_vector(5 downto 0);
            Ax14 : in std_logic_vector(5 downto 0);
            Ax15 : in std_logic_vector(5 downto 0);
            Bx0  : in std_logic_vector(5 downto 0);
            Bx1  : in std_logic_vector(5 downto 0);
            Bx2  : in std_logic_vector(5 downto 0);
            Bx3  : in std_logic_vector(5 downto 0);
            Bx4  : in std_logic_vector(5 downto 0);
            Bx5  : in std_logic_vector(5 downto 0);
            Bx6  : in std_logic_vector(5 downto 0);
            Bx7  : in std_logic_vector(5 downto 0);
            Bx8  : in std_logic_vector(5 downto 0);
            Bx9  : in std_logic_vector(5 downto 0);
            Bx10 : in std_logic_vector(5 downto 0);
            Bx11 : in std_logic_vector(5 downto 0);
            Bx12 : in std_logic_vector(5 downto 0);
            Bx13 : in std_logic_vector(5 downto 0);
            Bx14 : in std_logic_vector(5 downto 0);
            Bx15 : in std_logic_vector(5 downto 0);
            A0 : out std_logic_vector(5 downto 0);
            A1 : out std_logic_vector(5 downto 0);
            A2 : out std_logic_vector(5 downto 0);
            A3 : out std_logic_vector(5 downto 0);
            A4 : out std_logic_vector(5 downto 0);
            A5 : out std_logic_vector(5 downto 0);
            A6 : out std_logic_vector(5 downto 0);
            A7 : out std_logic_vector(5 downto 0);
            A8 : out std_logic_vector(5 downto 0);
            A9 : out std_logic_vector(5 downto 0);
            A10 : out std_logic_vector(5 downto 0);
            A11 : out std_logic_vector(5 downto 0);
            A12 : out std_logic_vector(5 downto 0);
            A13 : out std_logic_vector(5 downto 0);
            A14 : out std_logic_vector(5 downto 0);
            A15 : out std_logic_vector(5 downto 0);
            fin : out std_logic
        );
    end component;
    
    component sumador_nbits is
        generic(nbits : integer := 10);
        Port (
            A : in std_logic_vector(nbits-1 downto 0);
            B : in std_logic_vector(nbits-1 downto 0);
            S : out std_logic_vector(nbits downto 0)
        );
    end component;
    
    type ax_array is array (0 to 15) of std_logic_vector(5 downto 0);
    signal a_A2d, reg_ax, reg_bx, reg_tx : ax_array;
    
    signal l2k, d0, wK, fin_d  : std_logic;
    signal habilitador, hab_dm, hab_ax_f_e2, hab_ax_f_e3, hab_k, hab_l, hab_j, hab_ax, hab_bx, hab_tx, hab_d_func, hab_d, hab_ax_func : std_logic;
    signal etapa1, etapa2, etapa3, fin_ax,  dy_fin_ax, rst_j, hab_cont, dy_hab, dy_e1_cont, dy_e1 : std_logic;
    signal rst_d_func, rst_h, rst_d, rst_e1, rst_e2, rst_e3, rst_ax_func : std_logic;
    signal wk_pulse, en_e1, en_e2, en_e3, e1_cont : std_logic;
    signal l, l_neg, k, reg_k, reg_l, t2_val, sel_24 : std_logic_vector(4 downto 0);
    signal j, reg_j, k_pp, reg_dm, dm_val, l_menos, d_val : std_logic_vector(5 downto 0);
    signal j_pp, kml : std_logic_vector(6 downto 0);

begin
    --***********************delay rst, hab******************************
    rst_d <= rst;
    
--    delay_hab_in : process (clk,rst) is begin
--        if rst = '1' then
--            hab_d <= '0';
--        elsif rising_edge(clk) then
            hab_d <= hab;
--        end if;      
--    end process;
--    hab_d <= hab;
    --*******************************************************************

    --*********************Habilitación inicial**************************
    rst_habilitador : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => wK,
        PulsoS => open,
        PulsoB => wk_pulse
    );
    rst_h <= rst_d or wk_pulse;
    
    habilitador_General : process(clk,rst_h) is begin
        if rst_h = '1'  then
            habilitador <= '0';
        elsif rising_edge(clk) then
            if hab_d = '1' then
                habilitador <= '1';
            end if;
        end if;
    end process;
    --*******************************************************************
    
    -- **************************Incrementos*****************************
    K_plusplus : sumador_nbits
    generic map(nbits => 5)
    port map(
        A => k,
        B => "00001",
        S => k_pp
    );
    
    j_plusplus : sumador_nbits
    generic map(nbits => 6)
    port map(
        A => j,
        B => "000001",
        S => j_pp
    );
    --*******************************************************************
    
    --**********************Registros de estado**************************
    -- K
    -- incrementa k, guardar el valor de k++ en su registro
    K_state : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_k <= "00001"; 
        elsif rising_edge(clk) then
            if hab_k = '1' then
                reg_k <= k_pp(4 downto 0);
                end if;
        end if;
    end process;
    k <= reg_k;
    -- L
    L_state : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_l <= "00000"; 
        elsif rising_edge(clk) then
            if hab_l = '1' then
                reg_l <= kml(4 downto 0);
                end if;
        end if;
    end process;
    l <= reg_l;
    -- j
    j_state : process (clk,rst_j) is begin
        if rst_j = '1' then
            reg_j <= "000001"; 
        elsif rising_edge(clk) then
            if hab_j = '1' then
                reg_j <= j_pp(5 downto 0);
                end if;
        end if;
    end process;
    j <= reg_j;
    -- dm
    dm_register : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_dm <= "000001"; 
        elsif rising_edge(clk) then
            if hab_dm = '1' then
                reg_dm <= d_val;
                end if;
        end if;
    end process;
    dm_val <= reg_dm;
    --*******************************************************************
    
    --*************************calcular K-L******************************
    l_neg <= not l;
    not_l_plus_uno : sumador_nbits
    generic map( nbits => 5)
    port map(
        A => l_neg,
        B => "00001",
        S => l_menos
    );
    K_menos_L : sumador_nbits
    generic map( nbits => 6)
    port map(
        A =>'0'&k,
        B =>l_menos,
        S => kml
    );
    --*******************************************************************
    
    --******************************Etapa 1******************************
    -- d == 0
    d0 <= '1' when (d_val = "000000") else '0';
    -- '1' cuando no se ocntinua a etapas 2 y 3
    etapa1 <= habilitador and d0 and fin_d and (not etapa2) and (not etapa3);
    
    continuacion : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => etapa1,
        PulsoS => e1_cont,
        PulsoB => open
    );
    
    delay_continuacion_e1 : process (clk,rst_d) is begin
        if rst_d = '1' then
            dy_e1_cont <= '0';
        elsif rising_edge(clk) then
            dy_e1_cont <= e1_cont;    
        end if;
    end process;
    --********************************************************************
    
    -- *****************************Etapa 2*******************************
    -- 2L >= K
    l2k <= '1' when ( l&'0' >= '0'&k ) else '0';
    
    etapa2 <= l2k and (not d0) and fin_d and habilitador and (not etapa1) and (not etapa3); --'1'

    -- detector de flancos del delay de etapa 2 '1'
    enable_pulse_ax : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => etapa2,
        PulsoS => hab_ax_f_e2,
        PulsoB => open
    );
    --********************************************************************
    
    --******************************Etapa 3*******************************
    etapa3 <= habilitador and fin_d and (not etapa2) and (not etapa1) and (not d0) and (not l2k);
    -- guardar Ax en tx
    enable_pulse_tx_reg : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => etapa3,
        PulsoS => hab_tx,
        PulsoB => open
    );
    
    en_Ax_e3 : DetectFlancosSincro
    port map(
        clk => clk,
        Entrada => hab_tx,
        PulsoS => open,
        PulsoB => hab_ax_f_e3
    );
    -- Despues de que Ax termine, se almacena en array ax. Aplica para etapa2 y etapa3
    save_ax_function : DetectFlancosSincro
    port map(
        clk     => clk,
        Entrada => fin_ax,
        PulsoS  => hab_ax,
        PulsoB  => open
    );
    
    delay_fin_ax : process (clk,rst_d) is begin
        if rst_d = '1' then
            dy_hab <= '0';
            dy_fin_ax <= '0';
        elsif rising_edge(clk) then
            dy_fin_ax <= hab_ax;
            dy_hab <= dy_fin_ax;
        end if;
    end process;
    
    delay_rst_en_continue : process (clk, rst_d) is begin
        if rst_d = '1' then
            rst_e1  <= '0';
            rst_e2  <= '0';
            rst_e3  <= '0';
            dy_e1   <= '0';
            en_e1   <= '0';
            en_e2   <= '0';
            en_e3   <= '0';
        elsif rising_edge(clk) then
            rst_e1 <= etapa1;
            rst_e2 <= dy_fin_ax and etapa2;
            rst_e3 <= dy_fin_ax and etapa3;
            dy_e1 <= etapa1;
            en_e1 <= dy_e1;
            en_e2 <= dy_fin_ax and etapa2;
            en_e3 <= dy_fin_ax and etapa3;
        end if; 
    end process;
    --********************************************************************
    
    --*************************salida de etapa****************************
    -- k++
    hab_k <= en_e1 or en_e2 or en_e3;
    -- j++
    hab_j <= en_e1 or en_e2;
    -- guardar tx en Bx
    hab_bx <= en_e3;
    -- guardar K-L en L
    hab_l <= en_e3;
    -- guardar d en dm
    hab_dm <= hab_ax and etapa3;
    -- reset de j
    rst_j <= rst_d or rst_e3;
    --********************************************************************
    
    --***************************2t selector******************************
    sel_24 <= "01000" when (t2(0) = '0') else "01100";
    t2_val <= "10000" when (t2(1) = '1') else sel_24;
    --********************************************************************
    
    --****************************WHILE***********************************
    -- K <= 2t, Condición de paro
    wK <= '1' when (k <= t2_val) else '0';
--    hab_cont <= (e1_cont or dy_hab) and wK;
    delay_hab_continue : process (clk,rst_d) is begin
        if rst_d = '1' then
            hab_cont <= '0';
        elsif rising_edge(clk) then
            hab_cont <= (dy_e1_cont or dy_hab) and wK;        
        end if;
    end process;
    --********************************************************************
    
    --****************************Funciones*******************************
    
--    delay_hab_rst_d : process (clk,rst) is begin
--        if rst = '1' then
--            rst_d_func <= '0';
--            hab_d_func <= '0';
--        elsif rising_edge(clk) then
            rst_d_func <= rst_d or rst_e1 or rst_e2 or rst_e3;
            hab_d_func <= hab_d or hab_cont;
--        end if;
--    end process;
    
    d_function : d_function_GF26
    port map(
        rst => rst_d_func,
        clk => clk, 
        hab => hab_d_func,
        K   => k,
        L   => l,
        s1  => s1,
        s2  => s2,
        s3  => s3,
        s4  => s4,
        s5  => s5,
        s6  => s6,
        s7  => s7,
        s8  => s8,
        s9  => s9,
        s10 => s10,
        s11 => s11,
        s12 => s12,
        s13 => s13,
        s14 => s14,
        s15 => s15,
        s16 => s16,
        ax0  => reg_ax(0),
        ax1  => reg_ax(1),
        ax2  => reg_ax(2),
        ax3  => reg_ax(3),
        ax4  => reg_ax(4),
        ax5  => reg_ax(5),
        ax6  => reg_ax(6),
        ax7  => reg_ax(7),
        ax8  => reg_ax(8),
        ax9  => reg_ax(8),
        ax10 => reg_ax(9),
        ax11 => reg_ax(10),
        ax12 => reg_ax(11),
        ax13 => reg_ax(12),
        ax14 => reg_ax(13),
        ax15 => reg_ax(14),
        fin => fin_d,
        d   => d_val
    );
    
--    delay_hab_rst_ax : process (clk,rst) is begin
--        if rst = '1' then
--            rst_ax_func <= '0';
--            hab_ax_func <= '0';
--        elsif rising_edge(clk) then
            rst_ax_func <= rst_d or rst_e1 or rst_e2 or rst_e3;
            hab_ax_func <= hab_ax_f_e2 or hab_ax_f_e3;
--        end if;
--    end process;
    
    Ax_function : Ax_evaluator_RS
    port map(
        rst     => rst_ax_func, 
        clk     => clk, 
        hab     => hab_ax_func,
        j       => j,
        d       => d_val,
        dm      => dm_val,
        Ax0     => reg_ax(0),
        Ax1     => reg_ax(1),
        Ax2     => reg_ax(2),
        Ax3     => reg_ax(3),
        Ax4     => reg_ax(4),
        Ax5     => reg_ax(5),
        Ax6     => reg_ax(6),
        Ax7     => reg_ax(7),
        Ax8     => reg_ax(8),
        Ax9     => reg_ax(9),
        Ax10    => reg_ax(10),
        Ax11    => reg_ax(11),
        Ax12    => reg_ax(12),
        Ax13    => reg_ax(13),
        Ax14    => reg_ax(14),
        Ax15    => reg_ax(15),
        Bx0     => reg_bx(0),
        Bx1     => reg_bx(1),
        Bx2     => reg_bx(2),
        Bx3     => reg_bx(3),
        Bx4     => reg_bx(4),
        Bx5     => reg_bx(5),
        Bx6     => reg_bx(6),
        Bx7     => reg_bx(7),
        Bx8     => reg_bx(8),
        Bx9     => reg_bx(9),
        Bx10    => reg_bx(10),
        Bx11    => reg_bx(11),
        Bx12    => reg_bx(12),
        Bx13    => reg_bx(13),
        Bx14    => reg_bx(14),
        Bx15    => reg_bx(15),
        A0      => a_A2d(0),
        A1      => a_A2d(1),
        A2      => a_A2d(2),
        A3      => a_A2d(3),
        A4      => a_A2d(4),
        A5      => a_A2d(5),
        A6      => a_A2d(6),
        A7      => a_A2d(7),
        A8      => a_A2d(8),
        A9      => a_A2d(9),
        A10     => a_A2d(10),
        A11     => a_A2d(11),
        A12     => a_A2d(12),
        A13     => a_A2d(13),
        A14     => a_A2d(14),
        A15     => a_A2d(15),
        fin     => fin_ax
    );
    --******************************************************************
   
    --****************************Arreglos******************************
    -- Ax
    array_Ax : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_ax(0)  <= "000001";
            reg_ax(1)  <= "000000";
            reg_ax(2)  <= "000000";
            reg_ax(3)  <= "000000";
            reg_ax(4)  <= "000000";
            reg_ax(5)  <= "000000";
            reg_ax(6)  <= "000000";
            reg_ax(7)  <= "000000";
            reg_ax(8)  <= "000000";
            reg_ax(9)  <= "000000";
            reg_ax(10) <= "000000";
            reg_ax(11) <= "000000";
            reg_ax(12) <= "000000";
            reg_ax(13) <= "000000";
            reg_ax(14) <= "000000";
            reg_ax(15) <= "000000";
        elsif rising_edge(clk) then
            if hab_ax = '1' then
                reg_ax(0)  <= a_A2d(0);
                reg_ax(1)  <= a_A2d(1);
                reg_ax(2)  <= a_A2d(2);
                reg_ax(3)  <= a_A2d(3);
                reg_ax(4)  <= a_A2d(4);
                reg_ax(5)  <= a_A2d(5);
                reg_ax(6)  <= a_A2d(6);
                reg_ax(7)  <= a_A2d(7);
                reg_ax(8)  <= a_A2d(8);
                reg_ax(9)  <= a_A2d(9);
                reg_ax(10) <= a_A2d(10);
                reg_ax(11) <= a_A2d(11);
                reg_ax(12) <= a_A2d(12);
                reg_ax(13) <= a_A2d(13);
                reg_ax(14) <= a_A2d(14);
                reg_ax(15) <= a_A2d(15);
            end if;
        end if;
    end process;
    -- Bx
    array_Bx : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_bx(0)  <= "000001";
            reg_bx(1)  <= "000000";
            reg_bx(2)  <= "000000";
            reg_bx(3)  <= "000000";
            reg_bx(4)  <= "000000";
            reg_bx(5)  <= "000000";
            reg_bx(6)  <= "000000";
            reg_bx(7)  <= "000000";
            reg_bx(8)  <= "000000";
            reg_bx(9)  <= "000000";
            reg_bx(10) <= "000000";
            reg_bx(11) <= "000000";
            reg_bx(12) <= "000000";
            reg_bx(13) <= "000000";
            reg_bx(14) <= "000000";
            reg_bx(15) <= "000000";
        elsif rising_edge(clk) then
            if hab_bx = '1' then
                reg_bx(0)  <= reg_tx(0);
                reg_bx(1)  <= reg_tx(1);
                reg_bx(2)  <= reg_tx(2);
                reg_bx(3)  <= reg_tx(3);
                reg_bx(4)  <= reg_tx(4);
                reg_bx(5)  <= reg_tx(5);
                reg_bx(6)  <= reg_tx(6);
                reg_bx(7)  <= reg_tx(7);
                reg_bx(8)  <= reg_tx(8);
                reg_bx(9)  <= reg_tx(9);
                reg_bx(10) <= reg_tx(10);
                reg_bx(11) <= reg_tx(11);
                reg_bx(12) <= reg_tx(12);
                reg_bx(13) <= reg_tx(13);
                reg_bx(14) <= reg_tx(14);
                reg_bx(15) <= reg_tx(15);
            end if;
        end if;
    end process;
    -- tx
    array_tx : process (clk,rst_d) is begin
        if rst_d = '1' then
            reg_tx(0)  <= "000000";
            reg_tx(1)  <= "000000";
            reg_tx(2)  <= "000000";
            reg_tx(3)  <= "000000";
            reg_tx(4)  <= "000000";
            reg_tx(5)  <= "000000";
            reg_tx(6)  <= "000000";
            reg_tx(7)  <= "000000";
            reg_tx(8)  <= "000000";
            reg_tx(9)  <= "000000";
            reg_tx(10) <= "000000";
            reg_tx(11) <= "000000";
            reg_tx(12) <= "000000";
            reg_tx(13) <= "000000";
            reg_tx(14) <= "000000";
            reg_tx(15) <= "000000";
        elsif rising_edge(clk) then
            if hab_tx = '1' then
                reg_tx(0)  <= reg_ax(0) ;
                reg_tx(1)  <= reg_ax(1) ;
                reg_tx(2)  <= reg_ax(2) ;
                reg_tx(3)  <= reg_ax(3) ;
                reg_tx(4)  <= reg_ax(4) ;
                reg_tx(5)  <= reg_ax(5) ;
                reg_tx(6)  <= reg_ax(6) ;
                reg_tx(7)  <= reg_ax(7) ;
                reg_tx(8)  <= reg_ax(8) ;
                reg_tx(9)  <= reg_ax(9) ;
                reg_tx(10) <= reg_ax(10);
                reg_tx(11) <= reg_ax(11);
                reg_tx(12) <= reg_ax(12);
                reg_tx(13) <= reg_ax(13);
                reg_tx(14) <= reg_ax(14);
                reg_tx(15) <= reg_ax(15);
            end if;
        end if;
    end process;
    --******************************************************************
    
    fin <= not wK;
    
    Ax0  <= "000000" when (wK = '1') else reg_ax(0);
    Ax1  <= "000000" when (wK = '1') else reg_ax(1);
    Ax2  <= "000000" when (wK = '1') else reg_ax(2);
    Ax3  <= "000000" when (wK = '1') else reg_ax(3);
    Ax4  <= "000000" when (wK = '1') else reg_ax(4);
    Ax5  <= "000000" when (wK = '1') else reg_ax(5);
    Ax6  <= "000000" when (wK = '1') else reg_ax(6);
    Ax7  <= "000000" when (wK = '1') else reg_ax(7);
    Ax8  <= "000000" when (wK = '1') else reg_ax(8);
    Ax9  <= "000000" when (wK = '1') else reg_ax(9);
    Ax10 <= "000000" when (wK = '1') else reg_ax(10);
    Ax11 <= "000000" when (wK = '1') else reg_ax(11);
    Ax12 <= "000000" when (wK = '1') else reg_ax(12);
    Ax13 <= "000000" when (wK = '1') else reg_ax(13);
    Ax14 <= "000000" when (wK = '1') else reg_ax(14);
    Ax15 <= "000000" when (wK = '1') else reg_ax(15);

end Behavioral;
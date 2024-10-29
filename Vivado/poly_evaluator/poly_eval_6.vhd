----------------------------------------------------------------------------------
-- Evaluador de polinomio grado 5 en GF(2^6)
-- En x igual a: beta_0 - beta_23
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity poly_eval_6 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        x0      : in std_logic_vector(5 downto 0);
        x1      : in std_logic_vector(5 downto 0);
        x2      : in std_logic_vector(5 downto 0);
        x3      : in std_logic_vector(5 downto 0);
        x4      : in std_logic_vector(5 downto 0);
        x5      : in std_logic_vector(5 downto 0);
        x6      : in std_logic_vector(5 downto 0);
        x7      : in std_logic_vector(5 downto 0);
        x8      : in std_logic_vector(5 downto 0);
        x9      : in std_logic_vector(5 downto 0);
        x10     : in std_logic_vector(5 downto 0);
        x11     : in std_logic_vector(5 downto 0);
        x12     : in std_logic_vector(5 downto 0);
        x13     : in std_logic_vector(5 downto 0);
        x14     : in std_logic_vector(5 downto 0);
        x15     : in std_logic_vector(5 downto 0);
        x16     : in std_logic_vector(5 downto 0);
        x17     : in std_logic_vector(5 downto 0);
        x18     : in std_logic_vector(5 downto 0);
        x19     : in std_logic_vector(5 downto 0);
        x20     : in std_logic_vector(5 downto 0);
        x21     : in std_logic_vector(5 downto 0);
        x22     : in std_logic_vector(5 downto 0);
        x23     : in std_logic_vector(5 downto 0);
        coef0   : in std_logic_vector(5 downto 0);
        coef1   : in std_logic_vector(5 downto 0);
        coef2   : in std_logic_vector(5 downto 0);
        coef3   : in std_logic_vector(5 downto 0);
        coef4   : in std_logic_vector(5 downto 0);
        coef5   : in std_logic_vector(5 downto 0);
        s0      : out std_logic_vector(5 downto 0);     
        s1      : out std_logic_vector(5 downto 0);
        s2      : out std_logic_vector(5 downto 0);
        s3      : out std_logic_vector(5 downto 0);
        s4      : out std_logic_vector(5 downto 0);
        s5      : out std_logic_vector(5 downto 0);
        s6      : out std_logic_vector(5 downto 0);
        s7      : out std_logic_vector(5 downto 0);
        s8      : out std_logic_vector(5 downto 0);
        s9      : out std_logic_vector(5 downto 0);
        s10     : out std_logic_vector(5 downto 0);
        s11     : out std_logic_vector(5 downto 0);
        s12     : out std_logic_vector(5 downto 0);
        s13     : out std_logic_vector(5 downto 0);
        s14     : out std_logic_vector(5 downto 0);
        s15     : out std_logic_vector(5 downto 0);
        s16     : out std_logic_vector(5 downto 0);
        s17     : out std_logic_vector(5 downto 0);
        s18     : out std_logic_vector(5 downto 0);
        s19     : out std_logic_vector(5 downto 0);
        s20     : out std_logic_vector(5 downto 0);
        s21     : out std_logic_vector(5 downto 0);
        s22     : out std_logic_vector(5 downto 0);
        s23     : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
end poly_eval_6;

architecture Behavioral of poly_eval_6 is
    
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
    
    component symb_shift_reg_6_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3,d4,d5 : in std_logic_vector(5 downto 0);
        q_out : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    constant xs     : integer := 24;
    constant coef   : integer := 6;
    
    type t2_long is array (0 to xs-1) of std_logic_vector(5 downto 0);
    signal sind_orig, intrf_out, x_in : t2_long;
    
    signal count_end, dy_count_end, error_flag, en, d_shft1, d_shft2, shft, load : std_logic;
    signal elements, simbolos : std_logic_vector(5 downto 0);

begin
    
    x_in(0) <= x0;
    x_in(1) <= x1;
    x_in(2) <= x2;
    x_in(3) <= x3;
    x_in(4) <= x4;
    x_in(5) <= x5;
    x_in(6) <= x6;
    x_in(7) <= x7;
    x_in(8) <= x8;
    x_in(9) <= x9;
    x_in(10) <= x10;
    x_in(11) <= x11;
    x_in(12) <= x12;
    x_in(13) <= x13;
    x_in(14) <= x14;
    x_in(15) <= x15;
    x_in(16) <= x16;
    x_in(17) <= x17;
    x_in(18) <= x18;
    x_in(19) <= x19;
    x_in(20) <= x20;
    x_in(21) <= x21;
    x_in(22) <= x22;
    x_in(23) <= x23;
    
    dy_en_as_shift : process(clk,rst) is begin
        if rst = '1' then
            shft <= '0';
        elsif rising_edge(clk) then
            shft <= hab;
            d_shft1 <= shft;
            d_shft2 <= d_shft1;
        end if;
    end process;
    
    en <= d_shft2;
    
    load_pulse : DetectFlancosSincro
    Port map (
        clk     => clk,
	    Entrada => hab,
        PulsoB  => open,
		PulsoS  => load
    );
    
    PSregister : symb_shift_reg_6_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => d_shft1,
        d0      => coef0,
        d1      => coef1,
        d2      => coef2,
        d3      => coef3,
        d4      => coef4,
        d5      => coef5,
        q_out   => simbolos,
        fin     => open
    );
    
    elements <= simbolos when en = '1' else "000000";

    sindrome : for I in 0 to xs-1 generate
        s_alpha : mono_sindrome
        port map(
            clk => clk,
            rst => rst,
            simbolo => elements,
            alpha => x_in(I),
            sindrome => sind_orig(I)
        );
        
        reg : FF_en
        port map(
            clk => clk,
            rst => rst,
            en => en and (not count_end),
            D => sind_orig(I),
            Q => intrf_out(I)
        );
        
    end generate;
    
    s0 <= intrf_out(0);
    s1 <= intrf_out(1);
    s2 <= intrf_out(2);
    s3 <= intrf_out(3);
    s4 <= intrf_out(4);
    s5 <= intrf_out(5);
    s6 <= intrf_out(6);
    s7 <= intrf_out(7);
    s8 <= intrf_out(8);
    s9 <= intrf_out(9);
    s10 <= intrf_out(10);
    s11 <= intrf_out(11);
    s12 <= intrf_out(12);
    s13 <= intrf_out(13);
    s14 <= intrf_out(14);
    s15 <= intrf_out(15);
    s16 <= intrf_out(16);
    s17 <= intrf_out(17);
    s18 <= intrf_out(18);
    s19 <= intrf_out(19);
    s20 <= intrf_out(20);
    s21 <= intrf_out(21);
    s22 <= intrf_out(22);
    s23 <= intrf_out(23);
    
    contador : Contador_Lim_En_C
    generic map(Nbits => 3, Limite => coef) -- determinar bits necesarios
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => en and (not count_end),
        Dout    => open,
        En_Out  => count_end
    );
    
        -- This delay is use when the evaluation result is not the correct one.
--    delay_out_count : process (clk,rst) is begin
--        if rst = '1' then
--            dy_count_end <= '0';
--        elsif rising_edge(clk) then
--            dy_count_end <= count_end;
--        end if;
--    end process;
    
    fin <= count_end;

end Behavioral;

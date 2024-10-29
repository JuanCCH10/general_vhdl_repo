----------------------------------------------------------------------------------
-- Evaluador de polinomio grado 23 en GF(2^6)
-- En x igual a: alpha^0 - alpha^16
-- Con bandera cuando la evaluación es igual a cero en todas las evaluaciones
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity poly_eval_24_ef is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
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
        sin_e   : out std_logic;
        fin     : out std_logic
    );
end poly_eval_24_ef;

architecture Behavioral of poly_eval_24_ef is
    
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
    
    constant xs     : integer := 16;
    constant coef   : integer := 24;
    
    type GF26 is array (0 to xs) of std_logic_vector(5 downto 0);
    signal alpha : GF26 := (
    "000001", --alpha^0
    "000010", --alpha^1
    "000100", --alpha^2
    "001000", --alpha^3
    "010000", --alpha^4
    "100000", --alpha^5
    "000011", --alpha^6
    "000110", --alpha^7
    "001100", --alpha^8
    "011000", --alpha^9
    "110000", --alpha^10
    "100011", --alpha^11
    "000101", --alpha^12
    "001010", --alpha^13
    "010100", --alpha^14
    "101000", --alpha^15
    "010011"  --alpha^16
    );
    
    type t2_long is array (0 to xs-1) of std_logic_vector(5 downto 0);
    signal sind_orig, intrf_out : t2_long;
    
    type flags_bit is array (0 to xs-1) of std_logic;
    signal fse : flags_bit;
    
    signal count_end, dy_count_end, error_flag, en, d_shft1, d_shft2, shft, load : std_logic;
    signal elements, simbolos : std_logic_vector(5 downto 0);

begin

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
    
    PSregister : symb_shift_reg_24_en
    port map(
        clk     => clk,
        rst     => rst,
        load    => load,
        shift   => d_shft1,
        d0      => d0,
        d1      => d1,
        d2      => d2,
        d3      => d3,
        d4      => d4,
        d5      => d5,
        d6      => d6,
        d7      => d7,
        d8      => d8,
        d9      => d9,
        d10     => d10,
        d11     => d11,
        d12     => d12,
        d13     => d13,
        d14     => d14,
        d15     => d15,
        d16     => d16,
        d17     => d17,
        d18     => d18,
        d19     => d19,
        d20     => d20,
        d21     => d21,
        d22     => d22,
        d23     => d23,
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
            alpha => alpha(I+1),
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
        
        fse(I) <= '0' when (intrf_out(I) = "000000") else '1';
    end generate;
    
    s1   <= intrf_out(0);
    s2   <= intrf_out(1);
    s3   <= intrf_out(2);
    s4   <= intrf_out(3);
    s5   <= intrf_out(4);
    s6   <= intrf_out(5);
    s7   <= intrf_out(6);
    s8   <= intrf_out(7);
    s9   <= intrf_out(8);
    s10  <= intrf_out(9);
    s11  <= intrf_out(10);
    s12  <= intrf_out(11);
    s13  <= intrf_out(12);
    s14  <= intrf_out(13);
    s15  <= intrf_out(14);
    s16  <= intrf_out(15);
    
    contador_24 : Contador_Lim_En_C
    generic map(Nbits => 5, Limite => coef) -- determinar bits necesarios
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
    
    error_flag <= fse(0) or fse(1) or fse(2) or fse(3) or fse(4) or fse(5) or fse(6) or fse(7);
    
    sin_e <= not error_flag;
    fin <= count_end;

end Behavioral;

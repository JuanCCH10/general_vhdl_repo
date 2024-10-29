library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity sindroms_2t is
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
end sindroms_2t;

architecture Behav of sindroms_2t is

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
    
    component DetectFlancosSincro is
    Port ( 
        clk     : in STD_LOGIC;
	    Entrada : in STD_LOGIC;
        PulsoB  : out STD_LOGIC;
		PulsoS  : out STD_LOGIC);
    end component;
    
    type GF26 is array (0 to 16) of std_logic_vector(5 downto 0);
    signal alpha : GF26 :=
    (
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
    
    type t2_long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal sind_orig, intrf_out : t2_long;
    
    type flags_bit is array (0 to 15) of std_logic;
    signal fse : flags_bit;
    
    signal out_24, out_36, dy_out_24, dy_out_36, se_24169, se_241213, se_362017, fin_signal: std_logic;
    signal sel_24, sel_2436 : std_logic;

begin

    sindrome : for I in 0 to 15 generate
        
        s_alpha : mono_sindrome
        port map(
            clk => clk,
            rst => rst,
            simbolo => simbolos,
            alpha => alpha(I+1),
            sindrome => sind_orig(I)
        );
        
        reg : FF_en
        port map(
            clk => clk,
            rst => rst,
            en => en and (not fin_signal),
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
    s9   <= intrf_out(8) when (t2(0) = '1') else "000000";
    s10  <= intrf_out(9) when (t2(0) = '1') else "000000";
    s11  <= intrf_out(10) when (t2(0) = '1') else "000000";
    s12  <= intrf_out(11) when (t2(0) = '1') else "000000";
    s13  <= intrf_out(12) when (t2(1) = '1') else "000000";
    s14  <= intrf_out(13) when (t2(1) = '1') else "000000";
    s15  <= intrf_out(14) when (t2(1) = '1') else "000000";
    s16  <= intrf_out(15) when (t2(1) = '1') else "000000";
    
    contador_24 : Contador_Lim_En_C
    generic map(Nbits => 6, Limite => 23) --23
    port map(
        Reset => rst,
        Clk => clk,
        En => en and (not fin_signal),
        Dout => open,
        En_Out => out_24
    );
    
    contador_36 : Contador_Lim_En_C
    generic map(Nbits => 6, Limite => 35)
    port map(
        Reset => rst,
        Clk => clk,
        En => en and (not fin_signal),
        Dout => open,
        En_Out => out_36
    );
    
    delay_out_count : process (clk,rst) is begin
        if rst = '1' then
            dy_out_24 <= '0';
            dy_out_36 <= '0';
        elsif rising_edge(clk) then
            dy_out_24 <= out_24;
            dy_out_36 <= out_36;
        end if;
    end process;
    
    se_24169  <= fse(0) or fse(1) or fse(2) or fse(3) or fse(4) or fse(5) or fse(6) or fse(7);
    se_241213 <= fse(0) or fse(1) or fse(2) or fse(3) or fse(4) or fse(5) or fse(6) or fse(7) or fse(8) or fse(9) or fse(10) or fse(11);
    se_362017 <= fse(0) or fse(1) or fse(2) or fse(3) or fse(4) or fse(5) or fse(6) or fse(7) or fse(8) or fse(9) or fse(10) or fse(11) or fse(12) or fse(13) or fse(14) or fse(15);
    
    sel_24 <= se_24169 when (t2(0) = '0') else se_241213;
    sel_2436 <= sel_24 when (t2(1) = '0') else se_362017;
    
    sin_e <= (not sel_2436) and fin_signal;
    
    fin_signal <= dy_out_24 when (t2(1) = '0') else dy_out_36 ;
    fin <= fin_signal;

end Behav;

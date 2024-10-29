library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sindrome_RS2416 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        t2s : in std_logic_vector(1 downto 0);
        simbolos : in std_logic_vector(5 downto 0);
        s1 : out std_logic_vector(5 downto 0);
        s2 : out std_logic_vector(5 downto 0);
        s3 : out std_logic_vector(5 downto 0);
        s4 : out std_logic_vector(5 downto 0);
        s5 : out std_logic_vector(5 downto 0);
        s6 : out std_logic_vector(5 downto 0);
        s7 : out std_logic_vector(5 downto 0);
        s8 : out std_logic_vector(5 downto 0);
        s9 : out std_logic_vector(5 downto 0);
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
end sindrome_RS2416;

architecture Behavioral of sindrome_RS2416 is

    component mono_sindrome is
        Port (
            clk, rst : in std_logic;
            simbolo : in std_logic_vector(5 downto 0);
            alpha : in std_logic_vector(5 downto 0);
            sindrome : out std_logic_vector(5 downto 0)
        );
    end component;
    
    component Contador_Lim_En_C is
        Generic(Nbits: integer := 26;
    		Limite: integer := 49999999);
        Port (
            Reset    : in STD_LOGIC;
            Clk      : in STD_LOGIC;
            En       : in STD_LOGIC;
            Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
            En_Out   : out STD_LOGIC
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
    "000001",
    "000010",
    "000100",
    "001000",
    "010000",
    "100000",
    "000011",
    "000110",
    "001100",
    "011000",
    "110000",
    "100011",
    "000101",
    "001010",
    "010100",
    "101000",
    "010011"
    );
    
    signal sind_orig, intrf_out : GF26;
    
    type flags_bit is array (0 to 15) of std_logic;
    signal fse : flags_bit;
    
    signal out_24, out_36, dy_out_24, dy_out_36, En_ff, se_362016, se_241212, se_24168, fin_signal: std_logic;
    signal intrf_vb, intrf_fin : std_logic_vector(0 downto 0); 

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
        fse(I) <= '1' when (intrf_out(I) = "000000") else '0';
    end generate;
    
    s1  <= intrf_out(0);
    s2  <= intrf_out(1);
    s3  <= intrf_out(2);
    s4  <= intrf_out(3);
    s5  <= intrf_out(4);
    s6  <= intrf_out(5);
    s7  <= intrf_out(6);
    s8  <= intrf_out(7);
    s9  <= intrf_out(8);
    s10 <= intrf_out(9);
    s11 <= intrf_out(10);
    s12 <= intrf_out(11);
    s13 <= intrf_out(12);
    s14 <= intrf_out(13);
    s15 <= intrf_out(14);
    s16 <= intrf_out(15);
    
    contador_24 : Contador_Lim_En_C
    generic map(Nbits => 6, Limite => 23)
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
    
    se_362016 <= fse(0) and fse(1) and fse(2) and fse(3) and fse(4) and fse(5) and fse(6) and fse(7) and fse(8) and fse(9) and fse(10) and fse(11) and fse(12) and fse(13) and fse(14) and fse(15);
    se_241212 <= fse(0) and fse(1) and fse(2) and fse(3) and fse(4) and fse(5) and fse(6) and fse(7) and fse(8) and fse(9) and fse(10) and fse(11);
    se_24168 <= fse(0) and fse(1) and fse(2) and fse(3) and fse(4) and fse(5) and fse(6) and fse(7);
    
    sin_e <= se_24168 when (t2s = "00") else
            se_241212 when (t2s = "01") else
            se_362016;
    
    fin_signal <= dy_out_24 when t2s(1) = '0' else dy_out_36;
    fin <= fin_signal;
    
end Behavioral;

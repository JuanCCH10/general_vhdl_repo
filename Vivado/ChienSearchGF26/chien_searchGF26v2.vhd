library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;
-- Se redujo el número de elementos de alpha en los arreglos

entity chien_searchGF26v2 is
    Port(
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2      : in std_logic_vector(1 downto 0);
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
end chien_searchGF26v2;

architecture Behavioral of chien_searchGF26v2 is 
    
    component symbol_shift_reg_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15 : in std_logic_vector(5 downto 0);
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
    
    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
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

    component mux_bits2alpha is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 63
            value : out std_logic_vector(5 downto 0)
        );
    end component;

    component mux_alpha2bits is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 62
            value : out std_logic_vector(5 downto 0)
        );
    end component;
    
    type GF26_cut is array (0 to 35) of std_logic_vector(5 downto 0);
    signal alpha_cut : GF26_cut := (          
    "011100",  --27 -----------
    "111000",  --28            
    "110011",  --29            
    "100101",  --30            
    "001001",  --31            
    "010010",  --32            
    "100100",  --33            
    "001011",  --34            
    "010110",  --35            
    "101100",  --36            
    "011011",  --37            
    "110110",  --38            
    "101111",  --39            
    "011101",  --40            
    "111010",  --41            
    "110111",  --42            
    "101101",  --43            
    "011001",  --44            
    "110010",  --45            
    "100111",  --46            
    "001101",  --47            
    "011010",  --48            
    "110100",  --49            
    "101011",  --50            
    "010101",  --51            
    "101010",  --52            
    "010111",  --53            
    "101110",  --54            
    "011111",  --55            
    "111110",  --56            
    "111111",  --57            
    "111101",  --58            
    "111001",  --59            
    "110001",  --60            
    "100001",  --61            
    "000001"   --62            
    );
    
    signal alpha_result_cut : GF26_cut := (
    "001011", --13 --27 ------------
    "100100", --44 --28
    "010010", --22 --29
    "001001", --11 --30
    "100101", --45 --31
    "110011", --63 --32
    "111000", --70 --33
    "011100", --34 --34
    "001110", --16 --35
    "000111", --07 --36
    "100010", --42 --37
    "010001", --21 --38
    "101001", --51 --39
    "110101", --65 --40
    "111011", --73 --41
    "111100", --74 --42
    "011110", --36 --43
    "001111", --17 --44
    "100110", --46 --45
    "010011", --23 --46
    "101000", --50 --47
    "010100", --24 --48
    "001010", --12 --49
    "000101", --05 --50
    "100011", --43 --51
    "110000", --60 --52
    "011000", --30 --53
    "001100", --14 --54
    "000110", --06 --55
    "000011", --03 --56
    "100000", --40 --57
    "010000", --20 --58
    "001000", --10 --59
    "000100", --04 --60
    "000010", --02 --61
    "000001"  --01 --62
    );
    
    type compare_array is array (0 to 35) of std_logic_vector(0 downto 0);
    signal cero : compare_array;
    
    component Et_evaluatorv2 is
    Port(
        c   : in std_logic_vector(35 downto 0);
        Et  : out std_logic_vector(6 downto 0)
    );
    end component;
    
    signal out_poly_eval, sum_a, reg_x_a, prod_a, beta_long : GF26_cut;
    signal habilitador, d_hab, fin_reg, d_fin_reg, etol_flag : std_logic;
    signal conteo_s : std_logic_vector(3 downto 0);
    signal dato : std_logic_vector(5 downto 0);
    signal Et_val, compare_value : std_logic_vector(6 downto 0);
    signal cero_intrf : std_logic_vector(35 downto 0);

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
    
    delay_fin_reg : process (clk,rst) is begin
        if rst = '1' then
            d_fin_reg <= '0';
        elsif rising_edge(clk) then
            d_fin_reg <= fin_reg;
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

    reg_desp_simbolos : symbol_shift_reg_en
    port map(
        clk => clk,
        rst => rst,
        load => hab,
        shift => conteo_s(0),
        d0  => Ax0 ,
        d1  => Ax1 ,
        d2  => Ax2 ,
        d3  => Ax3 ,
        d4  => Ax4 ,
        d5  => Ax5 ,
        d6  => Ax6 ,
        d7  => Ax7 ,
        d8  => Ax8 ,
        d9  => Ax9 ,
        d10 => Ax10,
        d11 => Ax11,
        d12 => Ax12,
        d13 => Ax13,
        d14 => Ax14,
        d15 => Ax15,
        q_out => dato, 
        fin => fin_reg
    );
    
    --product_m_array : for I in 27 to 62 generate
    product_m_array : for I in 0 to 35 generate
        --
        --                  sum_a       reg_x_a
        --     dato --->(+)------->|REG|------>
        --               ^                  |
        --               |prod_a            |
        --               |                  |
        --     alpha --->(*)<---------------|   
        --     
        register_array : FF_en
        port map(
            clk => clk,
            en => conteo_s(0) and (not fin_reg),
            rst => rst,
            d => sum_a(I),
            q => reg_x_a(I)
        );
        
        prod_array : prod_alpha
        port map(
            alphaA => reg_x_a(I),
            alphaB => alpha_cut(I),
            alphaR => prod_a(I)
        );
        
        sum_a(I) <= dato xor prod_a(I);
        out_poly_eval(I) <= reg_x_a(I);
        cero(I) <= "1" when (out_poly_eval(I)  = "000000") else "0";
        -- Valor de salida de Chien 0 or beta
        beta_long(I) <= alpha_result_cut(I) when out_poly_eval(I) = "000000" else "000000";
    end generate;
    
    cero_intrf <= cero(0) & cero(1) & cero(2) & cero(3) & cero(4) & cero(5) & cero(6) & cero(7) & cero(8) & cero(9) & cero(10) & cero(11) & cero(12) & cero(13) & cero(14) & cero(15) & cero(16) & cero(17) & cero(18) & cero(19) & cero(20) & cero(21) & cero(22) & cero(23) & cero(24) & cero(25) & cero(26) & cero(27) & cero(28) & cero(29) & cero(30) & cero(31) & cero(32) & cero(33) & cero(34) & cero(35);
    
    --******************Evaluacion de polinomios***********************
    Et_valv2 : Et_evaluatorv2
    port map(
        c   => cero_intrf,
        Et  => Et_val
    );
    
    compare_value <= "0000100" when t2 = "00" else -- 2t = 4 RS(24,16,9)
                     "0000110" when t2 = "01" else -- 2t = 6 RS(24,12,13)
                     "0001000" when t2 = "10" else -- 2t = 8 RS(36,20,17)
                     "0001000";
    
    etol_flag <= '1' when (Et_val > compare_value) else '0';
    Et_OL <= etol_flag when (d_fin_reg = '1') else '0';
    
    -- Interfaz de salida
    beta35 <= beta_long(0) when fin_reg = '1' else (others =>'0');
    beta34 <= beta_long(1) when fin_reg = '1' else (others =>'0');
    beta33 <= beta_long(2) when fin_reg = '1' else (others =>'0');
    beta32 <= beta_long(3) when fin_reg = '1' else (others =>'0');
    beta31 <= beta_long(4) when fin_reg = '1' else (others =>'0');
    beta30 <= beta_long(5) when fin_reg = '1' else (others =>'0');
    beta29 <= beta_long(6) when fin_reg = '1' else (others =>'0');
    beta28 <= beta_long(7) when fin_reg = '1' else (others =>'0');
    beta27 <= beta_long(8) when fin_reg = '1' else (others =>'0');
    beta26 <= beta_long(9) when fin_reg = '1' else (others =>'0');
    beta25 <= beta_long(10) when fin_reg = '1' else (others =>'0');
    beta24 <= beta_long(11) when fin_reg = '1' else (others =>'0');
    beta23 <= beta_long(12) when fin_reg = '1' else (others =>'0');
    beta22 <= beta_long(13) when fin_reg = '1' else (others =>'0');
    beta21 <= beta_long(14) when fin_reg = '1' else (others =>'0');
    beta20 <= beta_long(15) when fin_reg = '1' else (others =>'0');
    beta19 <= beta_long(16) when fin_reg = '1' else (others =>'0');
    beta18 <= beta_long(17) when fin_reg = '1' else (others =>'0');
    beta17 <= beta_long(18) when fin_reg = '1' else (others =>'0');
    beta16 <= beta_long(19) when fin_reg = '1' else (others =>'0');
    beta15 <= beta_long(20) when fin_reg = '1' else (others =>'0');
    beta14 <= beta_long(21) when fin_reg = '1' else (others =>'0');
    beta13 <= beta_long(22) when fin_reg = '1' else (others =>'0');
    beta12 <= beta_long(23) when fin_reg = '1' else (others =>'0');
    beta11 <= beta_long(24) when fin_reg = '1' else (others =>'0');
    beta10 <= beta_long(25) when fin_reg = '1' else (others =>'0');
    beta9  <= beta_long(26) when fin_reg = '1' else (others =>'0');
    beta8  <= beta_long(27) when fin_reg = '1' else (others =>'0');
    beta7  <= beta_long(28) when fin_reg = '1' else (others =>'0');
    beta6  <= beta_long(29) when fin_reg = '1' else (others =>'0');
    beta5  <= beta_long(30) when fin_reg = '1' else (others =>'0');
    beta4  <= beta_long(31) when fin_reg = '1' else (others =>'0');
    beta3  <= beta_long(32) when fin_reg = '1' else (others =>'0');
    beta2  <= beta_long(33) when fin_reg = '1' else (others =>'0');
    beta1  <= beta_long(34) when fin_reg = '1' else (others =>'0');
    beta0  <= beta_long(35) when fin_reg = '1' else (others =>'0');
    
    fin <= d_fin_reg;

end Behavioral;

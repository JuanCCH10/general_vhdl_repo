library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poly_evaluation is
    Port (
        clk  : in std_logic;
        rst  : in std_logic;
        hab  : in std_logic;
        t2   : in std_logic_vector(4 downto 0);
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
        fin : out std_logic
    );
end poly_evaluation;

architecture Behavioral of poly_evaluation is

    component symbol_shift_reg_en is
    Port (
        clk, rst, load, shift : in std_logic;
        d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15 : in std_logic_vector(5 downto 0);
        q_out : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    component reg_symbol is
    Port (
        clk : in STD_LOGIC;
        en : in STD_LOGIC;
        rst : in STD_LOGIC; 
        d : in STD_LOGIC_VECTOR (5 downto 0);
        q : out STD_LOGIC_VECTOR (5 downto 0)   
    );
    end component;
    
    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component Contador is
    Generic(Nbits: integer:=26);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
           );
    end component;
    
    type GF26 is array (0 to 62) of std_logic_vector(5 downto 0);
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
    "010011",
    "100110",
    "001111",
    "011110",
    "111100",
    "111011",
    "110101",
    "101001",
    "010001",
    "100010",
    "000111",
    "001110",
    "011100",
    "111000",
    "110011",
    "100101",
    "001001",
    "010010",
    "100100",
    "001011",
    "010110",
    "101100",
    "011011",
    "110110",
    "101111",
    "011101",
    "111010",
    "110111",
    "101101",
    "011001",
    "110010",
    "100111",
    "001101",
    "011010",
    "110100",
    "101011",
    "010101",
    "101010",
    "010111",
    "101110",
    "011111",
    "111110",
    "111111",
    "111101",
    "111001",
    "110001",
    "100001"
    );
    
    signal  sum_a, reg_x_a, prod_a: GF26;
    
    signal fin_reg, habilitador, d_hab : std_logic;
    signal conteo_s : std_logic_vector(3 downto 0);
    signal reg_x, dato, sum, prod : std_logic_vector(5 downto 0);

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
    
    product_m_array : for I in 0 to 62 generate
        register_array : reg_symbol
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
            alphaB => alpha(I),
            alphaR => prod_a(I)
        );
        
        sum_a(I) <= dato xor prod_a(I);
    end generate;
    
    fin <= fin_reg;
    
--    register_m : reg_symbol
--    port map(
--        clk => clk,
--        en => conteo_s(0) and (not fin_reg),
--        rst => rst,
--        d => sum,
--        q => reg_x
--    );
    
--    product_m : prod_alpha
--    port map(
--        alphaA => reg_x,
--        alphaB => "000010",
--        alphaR => prod
--    ); 
    
--    sum <= dato xor prod;

end Behavioral;
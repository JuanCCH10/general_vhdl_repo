library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity d_function_GF26 is
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
end d_function_GF26;
--2t = 8, gES(x)

architecture Behavioral of d_function_GF26 is

    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component FF_en is
        generic (Nbits : integer := 6); 
        Port (
            rst, clk, en    : in std_logic;
            D               : in std_logic_vector(Nbits-1 downto 0);
            Q               : out std_logic_vector(Nbits-1 downto 0)
        );
    end component;
    
    component Contador_Lim_in is
        Generic(Nbits: integer := 3);
        Port ( 
            Reset    : in std_logic;
            Clk      : in std_logic;
            En       : in std_logic;
            Limite   : in std_logic_vector(Nbits-1 downto 0);
            Dout     : out std_logic_vector(Nbits-1 downto 0);
            En_Out   : out std_logic
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

    signal fin_flag, fin_s, habilitador, hab_loop2, en_out_loop, pS, d_ff1, d_ff2 : std_logic;
    signal neg_i_aux, sel_S, uno_neg : std_logic_vector(3 downto 0);
    signal i_aux, free_clock_out, compl2_uno, i_auxC2, intrf_selS : std_logic_vector(4 downto 0);
    signal aux_mult, aux_sum, pre_load, reg_out, intrf_selA, S, A, d_s, km1 : std_logic_vector(5 downto 0);

begin---------------------------------------------------------------------------------------------------------------
    
    habilitador_General : process(clk,rst) is begin
        if rst = '1'  then
            habilitador <= '0';
        elsif rising_edge(clk) then
            if hab = '1' then
                habilitador <= '1';
            end if;
        end if;
    end process;
    
    contador_libre : Contador
    generic map(Nbits => 5)
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => habilitador,
        Dout    => free_clock_out
    );
    
    hab_increm_loop : DetectFlancosSincro
    port map(
        clk     => clk,
        Entrada => free_clock_out(0),
        PulsoB  => open,
        PulsoS  => pS
    );
    
    L_loop : Contador_Lim_in
    generic map(Nbits => 5)
    port map(
        Reset   => rst,
        Clk     => clk,
        En      => hab_loop2,
        Limite  => L,
        Dout    => i_aux,
        En_Out  => en_out_loop
    );
    
    hab_loop2 <= '0' when en_out_loop = '1' else pS;
      
    -- pre cargar s(K)
    -- K-1
    uno_neg <= not "0001";
    comp2_uno_K : sumador_nbits
    generic map(Nbits => 4)
    port map(
        A       => uno_neg,
        B       => "0001",
        S       => compl2_uno
    );
    K_menos_uno : sumador_nbits
    generic map(Nbits => 5)
    port map(
        A       => K, 
        B       => compl2_uno,
        S       => km1
    );
    
    pre_load    <= S when (free_clock_out = "00001") else aux_sum;
    sel_S       <= km1(3 downto 0) when free_clock_out = "00001" else intrf_selS(3 downto 0);

    producto : prod_alpha
    port map(
        alphaA  => A,
        alphaB  => S,
        alphaR  => aux_mult
    );
    aux_sum <= reg_out xor aux_mult; 
    
    reg_loop : FF_en
    port map(
        rst     => rst,
        clk     => clk,
        en      => hab_loop2,
        D       => pre_load,--aux_sum,
        Q       => reg_out
    );
    
    -- Selección de Sindrome por cada iteración de loop
    -- complemento a 2 del valor del conteo en loop
    neg_i_aux <= not i_aux(3 downto 0);
    suma_complemento : sumador_nbits
    generic map(Nbits => 4)
    port map(
        A       => neg_i_aux,
        B       => "0001",
        S       => i_auxC2
    );
    dir_S : sumador_nbits
    generic map(Nbits => 4)
    port map(
        A       => km1(3 downto 0),
        B       => i_auxC2(3 downto 0),
        S       => intrf_selS
    );
    
    dir_A : sumador_nbits
    generic map(Nbits => 5)
    port map(
        A       => i_aux,
        B       => "00001",
        S       => intrf_selA
    );
    
    -- Excepción L = 0, d = S(K), sel_S = K
    d_s     <= S when L = "00000" else reg_out;
    
        --organizador de sindromes
    S <= s1  when (sel_S = "0000") else
         s2  when (sel_S = "0001") else
         s3  when (sel_S = "0010") else
         s4  when (sel_S = "0011") else
         s5  when (sel_S = "0100") else
         s6  when (sel_S = "0101") else
         s7  when (sel_S = "0110") else
         s8  when (sel_S = "0111") else
         s9  when (sel_S = "1000") else
         s10 when (sel_S = "1001") else
         s11 when (sel_S = "1010") else
         s12 when (sel_S = "1011") else
         s13 when (sel_S = "1100") else
         s14 when (sel_S = "1101") else
         s15 when (sel_S = "1110") else
         s16;
    
    A <= ax0  when (i_aux (3 downto 0) = "0000") else
         ax1  when (i_aux (3 downto 0) = "0001") else
         ax2  when (i_aux (3 downto 0) = "0010") else
         ax3  when (i_aux (3 downto 0) = "0011") else
         ax4  when (i_aux (3 downto 0) = "0100") else
         ax5  when (i_aux (3 downto 0) = "0101") else
         ax6  when (i_aux (3 downto 0) = "0110") else
         ax7  when (i_aux (3 downto 0) = "0111") else
         ax8  when (i_aux (3 downto 0) = "1000") else
         ax9  when (i_aux (3 downto 0) = "1001") else
         ax10 when (i_aux (3 downto 0) = "1010") else
         ax11 when (i_aux (3 downto 0) = "1011") else
         ax12 when (i_aux (3 downto 0) = "1100") else
         ax13 when (i_aux (3 downto 0) = "1101") else
         ax14 when (i_aux (3 downto 0) = "1110") else
         ax15;
    
    -- Bandera fin calculo d
    bandera_fin_excepcion : process(clk,rst) is begin
        if rst = '1' then
            fin_flag <= '0';
        elsif rising_edge(clk) then
            if hab = '1' and L = "00000" then
                fin_flag <= '1';
            end if;
        end if;
    end process;
    
    delay_fin_flag_excep : process(clk,rst) is begin
        if rst='1' then
            d_ff1 <= '0';
            d_ff2 <= '0';
        elsif rising_edge(clk) then
            d_ff1 <= fin_flag;
            d_ff2 <= d_ff1;
        end if;
    end process;
    
    fin_s <= d_ff2 when L = "00000" else en_out_loop;
    fin <= fin_s;
    d   <= d_s when fin_s = '1' else "000000";
end Behavioral;
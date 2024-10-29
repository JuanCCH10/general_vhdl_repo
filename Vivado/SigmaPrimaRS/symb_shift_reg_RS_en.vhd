
library IEEE;
use work.Arrays_Forney.all;
use work.Modulos_Genericos_Pkg.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity symb_shift_reg_RS_en is
Port
(
    rst     : in std_logic;
    clk     : in std_logic;
    load    : in std_logic;
    shift   : in std_logic;
    d_in    : in Array_d;
    q_out   : out std_logic_vector(5 downto 0);
    q_valid : out std_logic;
    fin     : out std_logic
);
end symb_shift_reg_RS_en;

architecture Behavioral of symb_shift_reg_RS_en is
component FF_en is
generic (Nbits : integer := 6); 
Port (
    rst, clk, en : in std_logic;
    D : in std_logic_vector(Nbits-1 downto 0);
    Q : out std_logic_vector(Nbits-1 downto 0)
);
end component;
    
component Contador is
Generic(Nbits: integer := 26);
Port (
    Reset    : in STD_LOGIC;
    Clk      : in STD_LOGIC;
    En       : in STD_LOGIC;
    Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
);
end component;
    
signal hab, d_hab, enab, fin_flag, d_fin_flag : std_logic;
signal cont_val : std_logic_vector(5 downto 0);
type simbol_array is array (0 to 36) of std_logic_vector(5 downto 0);
signal q2d, d, q, reg : simbol_array;
signal ShiftFF1 : std_logic;
signal ShiftFF2 : std_logic;

begin
--habilitador interno
    habilitador_sostenido : process(clk,rst) is begin
        if rst = '1'  then
            hab      <= '0';
            ShiftFF1 <= '0';
            ShiftFF2 <= '0';
        elsif rising_edge(clk) then
            if load = '1' then
                hab      <= '1';
            end if;
            ShiftFF1 <= Shift;
            ShiftFF2 <= ShiftFF1;
        end if;
    end process;
    --delay habilitador interno
    delay_habilitador : process(clk,rst) is begin
        if rst = '1' then
            d_hab <= '1';
        elsif rising_edge(clk) then
            d_hab <= hab;
        end if;
    end process;
    
    -- enable de desplazamientos
    enab <= '1' when (load = '1') else (shift and (not fin_flag));
    
    conteo : Contador
    generic map( Nbits => 6 )
    port map(
        Reset => rst,
        Clk => clk,
        En => shift and (not d_fin_flag),
        Dout => cont_val
    );
    
    --Mux inicio
    d(0) <= d_in(0) when d_hab = '0' else (others=>'0');
    Mux_For : for i in 0 to 34 generate
        d(i+1) <= d_in(i+1) when d_hab = '0' else q2d(i);
    end generate;
    d(36) <= (others=>'0') when d_hab = '0' else q2d(35);
    register_shift : for I in 0 to 36 generate
        
        register2shift : FF_en
        port map(
            clk => clk,
            en  => enab,
            rst => rst,
            d   => d(I),
            q   => q2d(I)
        );     
    end generate;
    
    q_out <= q2d(36);
    fin_flag <= '0' when (cont_val < "100101") else '1';
    
    delay_fin_flag : process (clk,rst) is begin
        if rst = '1' then
            d_fin_flag <= '0';
        elsif rising_edge(clk) then
            d_fin_flag <= fin_flag;
        end if;
    end process;
    
    fin     <= fin_flag;
    q_valid <= ShiftFF2;
end Behavioral;

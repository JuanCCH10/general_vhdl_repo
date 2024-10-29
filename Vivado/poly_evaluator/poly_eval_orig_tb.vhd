library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poly_eval_orig_tb is
end poly_eval_orig_tb;

architecture Behavioral of poly_eval_orig_tb is

    component poly_eval_orig is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        en      : in std_logic;
        simbolos: in std_logic_vector(5 downto 0);
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
    end component;
    constant per : time := 10ns;
    
    signal clk, rst, en, sin_e, fin : std_logic;
    signal simbolos : std_logic_vector(5 downto 0);
    type salida is array (0 to 15) of std_logic_vector(5 downto 0);
    signal s : salida;

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conex : poly_eval_orig
    port map(
        clk     => clk,
        rst     => rst,
        en      => en,
        simbolos => simbolos,
        s1      => s(0),
        s2      => s(1),
        s3      => s(2),
        s4      => s(3),
        s5      => s(4),
        s6      => s(5),
        s7      => s(6),
        s8      => s(7),
        s9      => s(8),
        s10     => s(9),
        s11     => s(10),
        s12     => s(11),
        s13     => s(12),
        s14     => s(13),
        s15     => s(14),
        s16     => s(15),
        sin_e   => sin_e,
        fin     => fin
    );
    
    estimulus : process is begin
        rst  <= '0';
        en   <= '0';
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for per;
        en <= '1';
        simbolos <= "010011"; --x23
        wait for per;        
        simbolos <= "101000"; --x22
        wait for per;        
        simbolos <= "010100"; --x21
        wait for per;        
        simbolos <= "001010"; --x20
        wait for per;        
        simbolos <= "000101"; --x19
        wait for per;        
        simbolos <= "100011"; --x18
        wait for per;        
        simbolos <= "110000"; --x17
        wait for per;        
        simbolos <= "011000"; --x16
        wait for per;        
        simbolos <= "001100"; --x15
        wait for per;        
        simbolos <= "000110"; --x14
        wait for per;        
        simbolos <= "000011"; --x13
        wait for per;        
        simbolos <= "100000"; --x12
        wait for per;        
        simbolos <= "010000"; --x11
        wait for per;        
        simbolos <= "001000"; --x10
        wait for per;        
        simbolos <= "000100"; --x9
        wait for per;        
        simbolos <= "000010"; --x8
        wait for per;        
        simbolos <= "000111"; --x7
        wait for per;        
        simbolos <= "101111"; --x6
        wait for per;        
        simbolos <= "001000"; --x5
        wait for per;        
        simbolos <= "011011"; --x4
        wait for per;        
        simbolos <= "011000"; --x3
        wait for per;        
        simbolos <= "000101"; --x2
        wait for per;
        simbolos <= "110001"; --x1
        wait for per;
        simbolos <= "100111"; --x0
        wait;
    end process;

end Behavioral;

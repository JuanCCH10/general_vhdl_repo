library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poly_eval_tb is
end poly_eval_tb;

architecture Behavioral of poly_eval_tb is

    component poly_eval is
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
    end component;
    constant per : time := 10ns;
    
    signal clk, rst, hab, sin_e, fin : std_logic;
    signal rstr, habr : std_logic;
    --signal simbolos : std_logic_vector(5 downto 0);
    type entrada is array(0 to 23) of std_logic_vector(5 downto 0);
    signal d, dr : entrada;
    type salida is array (0 to 15) of std_logic_vector(5 downto 0);
    signal s : salida; 
    
    

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    register_in : process (clk) is begin
        if rising_edge(clk) then
            rstr <= rst;
            habr <= hab;
            dr(0)  <= d(0) ;
            dr(1)  <= d(1) ;
            dr(2)  <= d(2) ;
            dr(3)  <= d(3) ;
            dr(4)  <= d(4) ;
            dr(5)  <= d(5) ;
            dr(6)  <= d(6) ;
            dr(7)  <= d(7) ;
            dr(8)  <= d(8) ;
            dr(9)  <= d(9) ;
            dr(10) <= d(10);
            dr(11) <= d(11);
            dr(12) <= d(12);
            dr(13) <= d(13);
            dr(14) <= d(14);
            dr(15) <= d(15);
            dr(16) <= d(16);
            dr(17) <= d(17);
            dr(18) <= d(18);
            dr(19) <= d(19);
            dr(20) <= d(20);
            dr(21) <= d(21);
            dr(22) <= d(22);
            dr(23) <= d(23);    
        end if;
    end process;
    
    conex : poly_eval
    port map(
        clk     => clk,
        rst     => rstr,
        hab     => habr,
        d0      => dr(0),
        d1      => dr(1),
        d2      => dr(2),
        d3      => dr(3),
        d4      => dr(4),
        d5      => dr(5),
        d6      => dr(6),
        d7      => dr(7),
        d8      => dr(8),
        d9      => dr(9),
        d10     => dr(10),
        d11     => dr(11),
        d12     => dr(12),
        d13     => dr(13),
        d14     => dr(14),
        d15     => dr(15),
        d16     => dr(16),
        d17     => dr(17),
        d18     => dr(18),
        d19     => dr(19),
        d20     => dr(20),
        d21     => dr(21),
        d22     => dr(22),
        d23     => dr(23),
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
        rst <= '0';
        hab <= '0';
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for per;
        hab <= '1';
        d(23) <= "010011"; --23   x23        
        d(22) <= "101000"; --50   x22        
        d(21) <= "010100"; --24   x21        
        d(20) <= "001010"; --12   x20        
        d(19) <= "000101"; --05   x19        
        d(18) <= "100011"; --43   x18        
        d(17) <= "110000"; --60   x17        
        d(16) <= "011000"; --30   x16        
        d(15) <= "001100"; --14   x15        
        d(14) <= "000110"; --06   x14        
        d(13) <= "000011"; --03   x13        
        d(12) <= "100000"; --40   x12        
        d(11) <= "010000"; --20   x11        
        d(10) <= "001000"; --10   x10        
        d(9)  <= "000100"; --04   x9        
        d(8)  <= "000010"; --02   x8        
        d(7)  <= "000111"; --07   x7        
        d(6)  <= "101111"; --57   x6        
        d(5)  <= "001000"; --10   x5        
        d(4)  <= "011011"; --33   x4        
        d(3)  <= "011000"; --30   x3        
        d(2)  <= "000101"; --05   x2
        d(1)  <= "110001"; --61   x1
        d(0)  <= "100111"; --47   x0
        wait;
    end process;

end Behavioral;

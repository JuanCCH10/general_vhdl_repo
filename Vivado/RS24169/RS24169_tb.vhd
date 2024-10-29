library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS24169_tb is
end RS24169_tb;

architecture Behavioral of RS24169_tb is
    
    component RS24169 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        simbolos : in std_logic_vector(5 downto 0);
        no_corregible : out std_logic;
        sin_errores : out std_logic;
        d0, d1, d2, d3, d4 : out std_logic_vector(5 downto 0);
        d5, d6, d7, d8, d9 : out std_logic_vector(5 downto 0);
        d10, d11, d12, d13, d14 : out std_logic_vector(5 downto 0);
        d15, d16, d17, d18, d19 : out std_logic_vector(5 downto 0);
        d20, d21, d22, d23 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    signal simbolo : std_logic_vector(5 downto 0);
    signal clk, rst, en, no_corregible, sin_errores, fin: std_logic;
    constant per : time := 10ns;
    
    type datos is array (0 to 23) of std_logic_vector(5 downto 0);
    signal resul : datos;
    
    type trama is array (0 to 23) of std_logic_vector(5 downto 0);
    signal dato : trama :=
    (
     "100010", -- alpha^1 x^23
     "100010", 
     "100010", 
     "100010", 
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",
     "000010",  
     "000010",       
     "001100",-- parity        
     "010011",          
     "101011",         
     "100000",         
     "000011",         
     "111100",      
     "101101",      
     "111000" --x^0
     
-- DATOS ORIGINALES
--     "000010", -- alpha^1 x^23
--     "000010", 
--     "000010", 
--     "000010", 
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",
--     "000010",  
--     "000010",       
--     "001100",-- parity        
--     "010011",          
--     "101011",         
--     "100000",         
--     "000011",         
--     "111100",      
--     "101101",      
--     "111000" --x^0
     );

begin
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : RS24169
    port map(
        clk => clk,
        rst => rst,
        en => en,
        simbolos => simbolo,
        no_corregible => no_corregible,
        sin_errores => sin_errores,
        d0  => resul(0),
        d1  => resul(1),
        d2  => resul(2),
        d3  => resul(3),
        d4  => resul(4),
        d5  => resul(5),
        d6  => resul(6),
        d7  => resul(7),
        d8  => resul(8),
        d9  => resul(9),
        d10 => resul(10),
        d11 => resul(11),
        d12 => resul(12),
        d13 => resul(13),
        d14 => resul(14),
        d15 => resul(15),
        d16 => resul(16),
        d17 => resul(17),
        d18 => resul(18),
        d19 => resul(19),
        d20 => resul(20),
        d21 => resul(21),
        d22 => resul(22),
        d23 => resul(23),
        fin => fin
    );
    
    estimulos : process is begin
        rst <= '1';
        en <= '0';
        simbolo <= "000000";
        wait for per;
        rst <= '0';
        en <= '1';
        simbolo <= dato(0);
        wait for per;
        simbolo <= dato(1);
        wait for per;
        simbolo <= dato(2);
        wait for per;
        simbolo <= dato(3);
        wait for per;
        simbolo <= dato(4);
        wait for per;
        simbolo <= dato(5);
        wait for per;
        simbolo <= dato(6);
        wait for per;
        simbolo <= dato(7);
        wait for per;
        simbolo <= dato(8);
        wait for per;
        simbolo <= dato(9);
        wait for per;
        simbolo <= dato(10);
        wait for per;
        simbolo <= dato(11);
        wait for per;
        simbolo <= dato(12);
        wait for per;
        simbolo <= dato(13);
        wait for per;
        simbolo <= dato(14);
        wait for per;
        simbolo <= dato(15); 
        wait for per;
        simbolo <= dato(16); 
        wait for per;
        simbolo <= dato(17); 
        wait for per;
        simbolo <= dato(18); 
        wait for per;
        simbolo <= dato(19); 
        wait for per;
        simbolo <= dato(20); 
        wait for per;
        simbolo <= dato(21); 
        wait for per;
        simbolo <= dato(22); 
        wait for per;
        simbolo <= dato(23);
        wait for per;
        --en <= '0';
        wait;
    end process;

end Behavioral;

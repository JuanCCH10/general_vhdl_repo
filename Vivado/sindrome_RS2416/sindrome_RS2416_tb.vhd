library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sindrome_RS2416_tb is
end sindrome_RS2416_tb;

architecture Behavioral of sindrome_RS2416_tb is

    component sindrome_RS2416 is
        Port (
            clk : in std_logic;
            rst : in std_logic;
            en : in std_logic;
            t2s : in std_logic_vector(1 downto 0);
            simbolos : in std_logic_vector(5 downto 0);
            fin, sin_e : out std_logic;
            s1,s2,s3,s4,s5,s6,s7,s8 : out std_logic_vector(5 downto 0);
            s9,s10,s11,s12,s13,s14,s15,s16 : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal simbolo,alpha : std_logic_vector(5 downto 0);
    signal clk, rst, fin, sin_e, en : std_logic;
    constant per : time := 10ns;
    
    type trama is array (0 to 23) of std_logic_vector(5 downto 0);
    signal dato : trama :=
    (
     "000010", -- alpha^1 x^23
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
     );

begin
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : sindrome_RS2416
    port map(
        clk => clk,
        rst => rst,
        en => en,
        t2s => "00",
        simbolos => simbolo,
        fin => fin,
        sin_e => sin_e,
        s1 => open,
        s2 => open,
        s3 => open,
        s4 => open,
        s5 => open,
        s6 => open,
        s7 => open,
        s8 => open,
        s9 => open,
        s10 => open,
        s11 => open,
        s12 => open,
        s13 => open,
        s14 => open,
        s15 => open,
        s16 => open
    );
    
    estimulos : process is begin
        rst <= '1';
        en <= '0';
        simbolo <= "000000";
        alpha <= "000000";
        wait for per;
        rst <= '0';
        en <= '1';
        simbolo <= dato(0);
        alpha   <= "001000";
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
        en <= '0';
        wait;
    end process;
end Behavioral;

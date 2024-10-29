library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RSdecoder_tb is
end RSdecoder_tb;

architecture Behavioral of RSdecoder_tb is

    component RSdecoder is
    Port(
        clk             : in std_logic;
        rst             : in std_logic;
        en              : in std_logic;
        t2              : in std_logic_vector(1 downto 0);
        simbolos        : in std_logic_vector(5 downto 0);
        no_corregible   : out std_logic;
        mx0             : out std_logic_vector(5 downto 0);
        mx1             : out std_logic_vector(5 downto 0);
        mx2             : out std_logic_vector(5 downto 0);
        mx3             : out std_logic_vector(5 downto 0);
        mx4             : out std_logic_vector(5 downto 0);
        mx5             : out std_logic_vector(5 downto 0);
        mx6             : out std_logic_vector(5 downto 0);
        mx7             : out std_logic_vector(5 downto 0);
        mx8             : out std_logic_vector(5 downto 0);
        mx9             : out std_logic_vector(5 downto 0);
        mx10            : out std_logic_vector(5 downto 0);
        mx11            : out std_logic_vector(5 downto 0);
        mx12            : out std_logic_vector(5 downto 0);
        mx13            : out std_logic_vector(5 downto 0);
        mx14            : out std_logic_vector(5 downto 0);
        mx15            : out std_logic_vector(5 downto 0);
        mx16            : out std_logic_vector(5 downto 0);
        mx17            : out std_logic_vector(5 downto 0);
        mx18            : out std_logic_vector(5 downto 0);
        mx19            : out std_logic_vector(5 downto 0);
        mx20            : out std_logic_vector(5 downto 0);
        mx21            : out std_logic_vector(5 downto 0);
        mx22            : out std_logic_vector(5 downto 0);
        mx23            : out std_logic_vector(5 downto 0);
        mx24            : out std_logic_vector(5 downto 0);
        mx25            : out std_logic_vector(5 downto 0);
        mx26            : out std_logic_vector(5 downto 0);
        mx27            : out std_logic_vector(5 downto 0);
        mx28            : out std_logic_vector(5 downto 0);
        mx29            : out std_logic_vector(5 downto 0);
        mx30            : out std_logic_vector(5 downto 0);
        mx31            : out std_logic_vector(5 downto 0);
        mx32            : out std_logic_vector(5 downto 0);
        mx33            : out std_logic_vector(5 downto 0);
        mx34            : out std_logic_vector(5 downto 0);
        mx35            : out std_logic_vector(5 downto 0);
        fin             : out std_logic
    );
    end component;

    signal simbolo, simbolo_d : std_logic_vector(5 downto 0);
    signal clk, rst, en, no_corregible, fin : std_logic;
    signal rst_d, en_d : std_logic;
    signal t2, t2_d : std_logic_vector(1 downto 0);
    constant per : time := 10ns;
    
    type datos is array (0 to 35) of std_logic_vector(5 downto 0);
    signal resul : datos;
    
    type trama is array (0 to 23) of std_logic_vector(5 downto 0);
    signal dato : trama :=
    (
-- DATOS ORIGINALES
     "110011", --ex^23
     "101000", --x^22
     "010100", --x^21
     "001010", --x^20
     "000101", --x^19
     "100011", --x^18
     "110000", --x^17
     "111000", --ex^16
     "001100", --x^15
     "000110", --x^14
     "000011", --x^13
     "100000", --x^12 
     "010000", --x^11 PARITY(24,12,13)
     "001000", --x^10
     "000100", --x^9  
     "000010", --x^8       
     "000111", --x^7  PARITY(24,16,9)       
     "001111", --ex^6          
     "001000", --x^5         
     "011011", --x^4         
     "011000", --x^3         
     "000101", --x^2      
     "110001", --x^1      
     "000111"  --ex^0
     );

begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : RSdecoder
    port map(
        clk             => clk,
        rst             => rst_d,
        en              => en_d,
        t2              => t2_d,
        simbolos        => simbolo_d,
        no_corregible   => no_corregible,
        mx0             => resul(0),
        mx1             => resul(1),
        mx2             => resul(2),
        mx3             => resul(3),
        mx4             => resul(4),
        mx5             => resul(5),
        mx6             => resul(6),
        mx7             => resul(7),
        mx8             => resul(8),
        mx9             => resul(9),
        mx10            => resul(10),
        mx11            => resul(11),
        mx12            => resul(12),
        mx13            => resul(13),
        mx14            => resul(14),
        mx15            => resul(15),
        mx16            => resul(16),
        mx17            => resul(17),
        mx18            => resul(18),
        mx19            => resul(19),
        mx20            => resul(20),
        mx21            => resul(21),
        mx22            => resul(22),
        mx23            => resul(23),
        mx24            => resul(24),
        mx25            => resul(25),
        mx26            => resul(26),
        mx27            => resul(27),
        mx28            => resul(28),
        mx29            => resul(29),
        mx30            => resul(30),
        mx31            => resul(31),
        mx32            => resul(32),
        mx33            => resul(33),
        mx34            => resul(34),
        mx35            => resul(35),
        fin             => fin
    );
    
    estimulos : process is begin
        rst     <= '0';
        en      <= '0';
        t2      <= "00";
        simbolo <= "000000";
        wait for 2*per;   
        rst     <= '1';
        wait for per;
        rst     <= '0';
        --wait for per;
        en      <= '1';
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
    
    delay_for_simulation : process(clk) is begin
        if rising_edge(clk) then
            rst_d       <= rst;
            en_d        <= en;
            t2_d        <= t2;
            simbolo_d   <= simbolo;  
        end if;
    end process;

end Behavioral;

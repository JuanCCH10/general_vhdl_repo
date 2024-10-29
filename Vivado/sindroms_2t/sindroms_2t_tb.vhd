library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sindroms_2t_tb is
end sindroms_2t_tb;

architecture Behavioral of sindroms_2t_tb is

    component sindroms_2t is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        t2 : in std_logic_vector(1 downto 0);
        simbolos : in std_logic_vector(5 downto 0);
        s1  : out std_logic_vector(5 downto 0);
        s2  : out std_logic_vector(5 downto 0);
        s3  : out std_logic_vector(5 downto 0);
        s4  : out std_logic_vector(5 downto 0);
        s5  : out std_logic_vector(5 downto 0);
        s6  : out std_logic_vector(5 downto 0);
        s7  : out std_logic_vector(5 downto 0);
        s8  : out std_logic_vector(5 downto 0);
        s9  : out std_logic_vector(5 downto 0);
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
    end component;
    
    signal simbolo : std_logic_vector(5 downto 0);
    signal clk, rst, fin, sin_e, en : std_logic;
    constant per : time := 10ns;
    
    type trama is array (0 to 23) of std_logic_vector(5 downto 0);
    signal dato : trama :=
    (
     --"", --x^35
     --"", --x^34
     --"", --x^33
     --"", --x^32
     --"", --x^31
     --"", --x^30
     --"", --x^29
     --"", --x^28
     --"", --x^27
     --"", --x^26
     --"", --x^25
     --"", --x^24
     "000010", --x^23
     "000010", --x^22
     "000010", --x^21
     "000010", --x^20
     "000010", --x^19
     "000010", --x^18
     "000010", --x^17
     "000010", --x^16
     "000010", --x^15
     "000010", --x^14
     "000010", --x^13
     "000010", --x^12
     "000010", --x^11
     "000010", --x^10
     "000010", --x^9 
     "000010", --x^8      
     "001100", --x^7      
     "010011", --x^6         
     "101011", --x^5        
     "100000", --x^4        
     "000011", --x^3        
     "011100", --x^2     
     "001101", --x^1     
     "011000"  --x^0
     );
     

begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexion : sindroms_2t
    port map(
        clk         => clk,
        rst         => rst,
        en          => en,
        t2          => "01",
        simbolos    => simbolo,
        s1          => open,
        s2          => open,
        s3          => open,
        s4          => open,
        s5          => open,
        s6          => open,
        s7          => open,
        s8          => open,
        s9          => open,
        s10         => open,
        s11         => open,
        s12         => open,
        s13         => open,
        s14         => open,
        s15         => open,
        s16         => open,
        sin_e       => sin_e,
        fin         => fin
    );
    
    estimulus : process is begin
        rst <= '0';
        en <= '0';
        simbolo <= "000000";
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for per;
        en <= '1';
        simbolo <= dato(23);
        wait for per;
        simbolo <= dato(22);
        wait for per;
        simbolo <= dato(21);
        wait for per;
        simbolo <= dato(20);
        wait for per;
        simbolo <= dato(19);
        wait for per;
        simbolo <= dato(18);
        wait for per;
        simbolo <= dato(17);
        wait for per;
        simbolo <= dato(16);
        wait for per;
        simbolo <= dato(15);
        wait for per;
        simbolo <= dato(14);
        wait for per;
        simbolo <= dato(13);
        wait for per;   
        simbolo <= dato(12);
        wait for per;   
        simbolo <= dato(11);
        wait for per;   
        simbolo <= dato(10);
        wait for per;   
        simbolo <= dato(9);
        wait for per;   
        simbolo <= dato(8);
        wait for per;   
        simbolo <= dato(7);
        wait for per;   
        simbolo <= dato(6);
        wait for per;   
        simbolo <= dato(5);
        wait for per;   
        simbolo <= dato(4);
        wait for per;
        simbolo <= dato(3);
        wait for per;
        simbolo <= dato(2);
        wait for per;
        simbolo <= dato(1);
        wait for per;
        simbolo <= dato(0);
        wait;
        
    end process;
    


end Behavioral;

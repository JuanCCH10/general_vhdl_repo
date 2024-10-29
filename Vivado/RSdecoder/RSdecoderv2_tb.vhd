library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RSdecoderv2_tb is
end RSdecoderv2_tb;

architecture Behavioral of RSdecoderv2_tb is

    component RSdecoderv2 is
    Port(
        clk             : in std_logic;
        rst             : in std_logic;
        en              : in std_logic;
        t2              : in std_logic_vector(1 downto 0);
        x0              : in std_logic_vector(5 downto 0);
        x1              : in std_logic_vector(5 downto 0);
        x2              : in std_logic_vector(5 downto 0);
        x3              : in std_logic_vector(5 downto 0);
        x4              : in std_logic_vector(5 downto 0);
        x5              : in std_logic_vector(5 downto 0);
        x6              : in std_logic_vector(5 downto 0);
        x7              : in std_logic_vector(5 downto 0);
        x8              : in std_logic_vector(5 downto 0);
        x9              : in std_logic_vector(5 downto 0);
        x10             : in std_logic_vector(5 downto 0);
        x11             : in std_logic_vector(5 downto 0);
        x12             : in std_logic_vector(5 downto 0);
        x13             : in std_logic_vector(5 downto 0);
        x14             : in std_logic_vector(5 downto 0);
        x15             : in std_logic_vector(5 downto 0);
        x16             : in std_logic_vector(5 downto 0);
        x17             : in std_logic_vector(5 downto 0);
        x18             : in std_logic_vector(5 downto 0);
        x19             : in std_logic_vector(5 downto 0);
        x20             : in std_logic_vector(5 downto 0);
        x21             : in std_logic_vector(5 downto 0);
        x22             : in std_logic_vector(5 downto 0);
        x23             : in std_logic_vector(5 downto 0);
        x24             : in std_logic_vector(5 downto 0);
        x25             : in std_logic_vector(5 downto 0);
        x26             : in std_logic_vector(5 downto 0);
        x27             : in std_logic_vector(5 downto 0);
        x28             : in std_logic_vector(5 downto 0);
        x29             : in std_logic_vector(5 downto 0);
        x30             : in std_logic_vector(5 downto 0);
        x31             : in std_logic_vector(5 downto 0);
        x32             : in std_logic_vector(5 downto 0);
        x33             : in std_logic_vector(5 downto 0);
        x34             : in std_logic_vector(5 downto 0);
        x35             : in std_logic_vector(5 downto 0);
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

    signal clk, rst, en, fin : std_logic;
    signal rst_d, en_d : std_logic;
    signal t2, t2_d : std_logic_vector(1 downto 0);
    constant per : time := 10ns;
    
    type datos is array (0 to 35) of std_logic_vector(5 downto 0);
    signal resul : datos;
    
--    -- prueba base RS2412 t2 = 01
--     signal dato : datos := (
--     "100111", --x^0  47
--     "110001", --x^1  61
--     "000101", --x^2  05
--     "011000", --x^3  30
--     "011011", --x^4  33
--     "001000", --x^5  10
--     "101111", --x^6  57
--     "000111", --x^7  07
--     "000010", --x^8  02
--     "000100", --x^9  04
--     "001000", --x^10 10
--     "010000", --x^11 20
--     "100000", --x^12 40
--     "000011", --x^13 03
--     "000110", --x^14 06
--     "001100", --x^15 14
--     "011000", --x^16 30
--     "110000", --x^17 60
--     "100011", --x^18 43
--     "000101", --x^19 05
--     "001010", --x^20 12
--     "010100", --x^21 24
--     "101000", --x^22 50
--     "010011", --x^23 23
--     others => "000000"
--     );

-- prueba RS2412 t2 = 01
--     signal dato : datos := (
--     "110000", --x^0  60
--     "000000", --x^1  00
--     "010011", --x^2  23
--     "000110", --x^3  06
--     "111001", --x^4  71
--     "001100", --x^5  14
--     "100101", --x^6  45
--     "111101", --x^7  75
--     "000111", --x^8  07
--     "111100", --x^9  74
--     "011100", --x^10 34
--     "100000", --x^11 40
--     "010010", --x^12 22  PARITY(24,12,13)
--     "010001", --x^13 21
--     "011001", --x^14 31
--     "000000", --x^15 00
--     "000000", --x^16 00
--     "000000", --x^17 00
--     "000000", --x^18 00
--     "000000", --x^19 00
--     "000000", --x^20 00
--     "000000", --x^21 00
--     "110000", --x^22 60
--     "010011", --x^23 23
--     others => "000000"
--     );

-- prueba RS2416 t2 = 00
--    signal dato : datos := (
--     "010001", --x^0  21
--     "000001", --x^1  01
--     "111000", --x^2  70
--     "101000", --x^3  50
--     "101000", --x^4  50
--     "000110", --x^5  06
--     "010111", --x^6  27
--     "001110", --x^7  16    PARITY(24,16,9)
--     "100011", --x^8  43
--     "000000", --x^9  00
--     "000010", --x^10 02
--     "100001", --x^11 41
--     "000000", --x^12 00  
--     "110000", --x^13 60
--     "010011", --x^14 23
--     "000001", --x^15 01
--     "110111", --x^16 67
--     "011001", --x^17 31
--     "100001", --x^18 41
--     "111001", --x^19 71
--     "001101", --x^20 15
--     "011100", --x^21 34
--     "100111", --x^22 47
--     "101101", --x^23 55
--     others => "000000"
--     );

-- prueba RS3620 t2 =10/11
    signal dato : datos := (
     "000101", --x^0  05
     "101111", --x^1  57
     "010001", --x^2  21
     "001010", --x^3  12
     "011101", --x^4  35
     "101110", --x^5  56
     "100000", --x^6  40
     "011100", --x^7  34
     "110101", --x^8  65
     "001001", --x^9  11
     "101111", --x^10 57
     "011101", --x^11 35
     "011101", --x^12 35
     "010000", --x^13 20
     "011011", --x^14 33
     "110011", --x^15 63    PARITY(36,20,17)
     "010000", --x^16 20
     "100001", --x^17 41
     "110010", --x^18 62
     "001000", --x^19 10
     "100000", --x^20 40
     "010000", --x^21 20
     "001000", --x^22 10 
     "000000", --x^23 00 
     "000000", --x^24 00 
     "010100", --x^25 24
     "011001", --x^26 31 
     "110110", --x^27 66 
     "011111", --x^28 37
     "101011", --x^29 53
     "100100", --x^30 44
     "110100", --x^31 64
     "010100", --x^32 24
     "101100", --x^33 54
     "110010", --x^34 62
     "011100"  --x^35 34
    );

     
     signal dato_d, rx: datos;

begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    estimulos : process is begin
        rst     <= '0';
        en      <= '0';
        t2      <= "10";
        wait for 4*per;   
        rst     <= '1';
        wait for per;
        rst     <= '0';
        wait for per;
        en      <= '1';
        wait;
    end process;
    
        -- incersion de errores
    rx(0 ) <= "000001" xor dato(0);
    rx(1 ) <= "000000" xor dato(1);
    rx(2 ) <= "000000" xor dato(2);
    rx(3 ) <= "000000" xor dato(3);
    rx(4 ) <= "000000" xor dato(4);
    rx(5 ) <= "000000" xor dato(5);
    rx(6 ) <= "000000" xor dato(6);
    rx(7 ) <= "000000" xor dato(7);
    rx(8 ) <= "000000" xor dato(8);
    rx(9 ) <= "000000" xor dato(9);
    rx(10) <= "000000" xor dato(10);
    rx(11) <= "000000" xor dato(11);
    rx(12) <= "000000" xor dato(12);
    rx(13) <= "000000" xor dato(13);
    rx(14) <= "000000" xor dato(14);
    rx(15) <= "000000" xor dato(15);
    rx(16) <= "000000" xor dato(16);
    rx(17) <= "000000" xor dato(17);
    rx(18) <= "000000" xor dato(18);
    rx(19) <= "000000" xor dato(19);
    rx(20) <= "000000" xor dato(20);
    rx(21) <= "000000" xor dato(21);
    rx(22) <= "000000" xor dato(22);
    rx(23) <= "000000" xor dato(23);
    --------------------------------
    rx(24) <= "000000" xor dato(24);
    rx(25) <= "000000" xor dato(25);
    rx(26) <= "000000" xor dato(26);
    rx(27) <= "000000" xor dato(27);
    rx(28) <= "000000" xor dato(28);
    rx(29) <= "000000" xor dato(29);
    rx(30) <= "000000" xor dato(30);
    rx(31) <= "000000" xor dato(31);
    rx(32) <= "000000" xor dato(32);
    rx(33) <= "000000" xor dato(33);
    rx(34) <= "000000" xor dato(34);
    rx(35) <= "000000" xor dato(35);
    
    conexiones : RSdecoderv2
    port map(
        clk             => clk,
        rst             => rst_d,
        en              => en_d,
        t2              => t2_d,
        x0              => dato_d(0),
        x1              => dato_d(1),
        x2              => dato_d(2),
        x3              => dato_d(3),
        x4              => dato_d(4),
        x5              => dato_d(5),
        x6              => dato_d(6),
        x7              => dato_d(7),
        x8              => dato_d(8),
        x9              => dato_d(9),
        x10             => dato_d(10),
        x11             => dato_d(11),
        x12             => dato_d(12),
        x13             => dato_d(13),
        x14             => dato_d(14),
        x15             => dato_d(15),
        x16             => dato_d(16),
        x17             => dato_d(17),
        x18             => dato_d(18),
        x19             => dato_d(19),
        x20             => dato_d(20),
        x21             => dato_d(21),
        x22             => dato_d(22),
        x23             => dato_d(23),
        x24             => dato_d(24),
        x25             => dato_d(25),
        x26             => dato_d(26),
        x27             => dato_d(27),
        x28             => dato_d(28),
        x29             => dato_d(29),
        x30             => dato_d(30),
        x31             => dato_d(31),
        x32             => dato_d(32),
        x33             => dato_d(33),
        x34             => dato_d(34),
        x35             => dato_d(35),
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
    
    delay_for_simulation : process(clk) is begin
        if rising_edge(clk) then
            rst_d       <= rst;
            en_d        <= en;
            t2_d        <= t2;
            dato_d(0)  <= rx(0);
            dato_d(1)  <= rx(1);
            dato_d(2)  <= rx(2);
            dato_d(3)  <= rx(3);
            dato_d(4)  <= rx(4);
            dato_d(5)  <= rx(5);
            dato_d(6)  <= rx(6);
            dato_d(7)  <= rx(7);
            dato_d(8)  <= rx(8);
            dato_d(9)  <= rx(9);
            dato_d(10) <= rx(10);
            dato_d(11) <= rx(11);
            dato_d(12) <= rx(12);
            dato_d(13) <= rx(13);
            dato_d(14) <= rx(14); 
            dato_d(15) <= rx(15); 
            dato_d(16) <= rx(16); 
            dato_d(17) <= rx(17); 
            dato_d(18) <= rx(18); 
            dato_d(19) <= rx(19); 
            dato_d(20) <= rx(20);
            dato_d(21) <= rx(21);
            dato_d(22) <= rx(22);
            dato_d(23) <= rx(23);
            dato_d(24) <= rx(24);
            dato_d(25) <= rx(25);
            dato_d(26) <= rx(26);
            dato_d(27) <= rx(27);
            dato_d(28) <= rx(28);
            dato_d(29) <= rx(29);
            dato_d(30) <= rx(30);
            dato_d(31) <= rx(31);
            dato_d(32) <= rx(32);
            dato_d(33) <= rx(33);
            dato_d(34) <= rx(34); 
            dato_d(35) <= rx(35); 
        end if;
    end process;

end Behavioral;

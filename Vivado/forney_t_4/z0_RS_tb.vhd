library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z0_RS_tb is
end z0_RS_tb;

architecture Behavioral of z0_RS_tb is

component z0_RSv2 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2      : in std_logic_vector(1 downto 0);
        s1      : in std_logic_vector(5 downto 0);
        s2      : in std_logic_vector(5 downto 0);
        s3      : in std_logic_vector(5 downto 0);
        s4      : in std_logic_vector(5 downto 0);
        s5      : in std_logic_vector(5 downto 0);
        s6      : in std_logic_vector(5 downto 0);
        s7      : in std_logic_vector(5 downto 0);
        s8      : in std_logic_vector(5 downto 0);
        sigma1  : in std_logic_vector(5 downto 0);
        sigma2  : in std_logic_vector(5 downto 0);
        sigma3  : in std_logic_vector(5 downto 0);
        sigma4  : in std_logic_vector(5 downto 0);
        sigma5  : in std_logic_vector(5 downto 0);
        sigma6  : in std_logic_vector(5 downto 0);
        sigma7  : in std_logic_vector(5 downto 0);
        beta0   : in std_logic_vector(5 downto 0);
        beta1   : in std_logic_vector(5 downto 0);
        beta2   : in std_logic_vector(5 downto 0);
        beta3   : in std_logic_vector(5 downto 0);
        beta4   : in std_logic_vector(5 downto 0);
        beta5   : in std_logic_vector(5 downto 0);
        beta6   : in std_logic_vector(5 downto 0);
        beta7   : in std_logic_vector(5 downto 0);
        beta8   : in std_logic_vector(5 downto 0);
        beta9   : in std_logic_vector(5 downto 0);
        beta10  : in std_logic_vector(5 downto 0);
        beta11  : in std_logic_vector(5 downto 0);
        beta12  : in std_logic_vector(5 downto 0);
        beta13  : in std_logic_vector(5 downto 0);
        beta14  : in std_logic_vector(5 downto 0);
        beta15  : in std_logic_vector(5 downto 0);
        beta16  : in std_logic_vector(5 downto 0);
        beta17  : in std_logic_vector(5 downto 0);
        beta18  : in std_logic_vector(5 downto 0);
        beta19  : in std_logic_vector(5 downto 0);
        beta20  : in std_logic_vector(5 downto 0);
        beta21  : in std_logic_vector(5 downto 0);
        beta22  : in std_logic_vector(5 downto 0);
        beta23  : in std_logic_vector(5 downto 0);
        beta24  : in std_logic_vector(5 downto 0);
        beta25  : in std_logic_vector(5 downto 0);
        beta26  : in std_logic_vector(5 downto 0);
        beta27  : in std_logic_vector(5 downto 0);
        beta28  : in std_logic_vector(5 downto 0);
        beta29  : in std_logic_vector(5 downto 0);
        beta30  : in std_logic_vector(5 downto 0);
        beta31  : in std_logic_vector(5 downto 0);
        beta32  : in std_logic_vector(5 downto 0);
        beta33  : in std_logic_vector(5 downto 0);
        beta34  : in std_logic_vector(5 downto 0);
        beta35  : in std_logic_vector(5 downto 0);
        z0      : out std_logic_vector(5 downto 0);
        z1      : out std_logic_vector(5 downto 0);
        z2      : out std_logic_vector(5 downto 0);
        z3      : out std_logic_vector(5 downto 0);
        z4      : out std_logic_vector(5 downto 0);
        z5      : out std_logic_vector(5 downto 0);
        z6      : out std_logic_vector(5 downto 0);
        z7      : out std_logic_vector(5 downto 0);
        z8      : out std_logic_vector(5 downto 0);
        z9      : out std_logic_vector(5 downto 0);
        z10     : out std_logic_vector(5 downto 0);
        z11     : out std_logic_vector(5 downto 0);
        z12     : out std_logic_vector(5 downto 0);
        z13     : out std_logic_vector(5 downto 0);
        z14     : out std_logic_vector(5 downto 0);
        z15     : out std_logic_vector(5 downto 0);
        z16     : out std_logic_vector(5 downto 0);
        z17     : out std_logic_vector(5 downto 0);
        z18     : out std_logic_vector(5 downto 0);
        z19     : out std_logic_vector(5 downto 0);
        z20     : out std_logic_vector(5 downto 0);
        z21     : out std_logic_vector(5 downto 0);
        z22     : out std_logic_vector(5 downto 0);
        z23     : out std_logic_vector(5 downto 0);
        z24     : out std_logic_vector(5 downto 0);
        z25     : out std_logic_vector(5 downto 0);
        z26     : out std_logic_vector(5 downto 0);
        z27     : out std_logic_vector(5 downto 0);
        z28     : out std_logic_vector(5 downto 0);
        z29     : out std_logic_vector(5 downto 0);
        z30     : out std_logic_vector(5 downto 0);
        z31     : out std_logic_vector(5 downto 0);
        z32     : out std_logic_vector(5 downto 0);
        z33     : out std_logic_vector(5 downto 0);
        z34     : out std_logic_vector(5 downto 0);
        z35     : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
end component;

constant per : time := 10ns;
signal clk, rst, hab, fin : std_logic;
signal t2 : std_logic_vector(1 downto 0);

type sindroms_array is array (1 to 8) of std_logic_vector(5 downto 0);
type sigmas_array is array (1 to 7) of std_logic_vector(5 downto 0);
type betas_array is array (0 to 35) of std_logic_vector(5 downto 0);
type z0s_array is array (0 to 35) of std_logic_vector(5 downto 0);

signal s : sindroms_array;
signal sigma : sigmas_array;
signal beta : betas_array;
signal z0 : z0s_array;

begin
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : z0_RSv2
    port map(
        clk     => clk,
        rst     => rst,
        hab     => hab,
        t2      => t2,
        s1      => s(1),
        s2      => s(2),
        s3      => s(3),
        s4      => s(4),
        s5      => s(5),
        s6      => s(6),
        s7      => s(7),
        s8      => s(8),
        sigma1  => sigma(1),
        sigma2  => sigma(2),
        sigma3  => sigma(3),
        sigma4  => sigma(4),
        sigma5  => sigma(5),
        sigma6  => sigma(6),
        sigma7  => sigma(7),
        beta0   => beta(0),
        beta1   => beta(1),
        beta2   => beta(2),
        beta3   => beta(3),
        beta4   => beta(4),
        beta5   => beta(5),
        beta6   => beta(6),
        beta7   => beta(7),
        beta8   => beta(8),
        beta9   => beta(9),
        beta10  => beta(10),
        beta11  => beta(11),
        beta12  => beta(12),
        beta13  => beta(13),
        beta14  => beta(14),
        beta15  => beta(15),
        beta16  => beta(16),
        beta17  => beta(17),
        beta18  => beta(18),
        beta19  => beta(19),
        beta20  => beta(20),
        beta21  => beta(21),
        beta22  => beta(22),
        beta23  => beta(23),
        beta24  => beta(24),
        beta25  => beta(25),
        beta26  => beta(26),
        beta27  => beta(27),
        beta28  => beta(28),
        beta29  => beta(29),
        beta30  => beta(30),
        beta31  => beta(31),
        beta32  => beta(32),
        beta33  => beta(33),
        beta34  => beta(34),
        beta35  => beta(35),
        z0      => z0(0), 
        z1      => z0(1), 
        z2      => z0(2), 
        z3      => z0(3), 
        z4      => z0(4), 
        z5      => z0(5), 
        z6      => z0(6), 
        z7      => z0(7), 
        z8      => z0(8), 
        z9      => z0(9), 
        z10     => z0(10),
        z11     => z0(11),
        z12     => z0(12),
        z13     => z0(13),
        z14     => z0(14),
        z15     => z0(15),
        z16     => z0(16),
        z17     => z0(17),
        z18     => z0(18),
        z19     => z0(19),
        z20     => z0(20),
        z21     => z0(21),
        z22     => z0(22),
        z23     => z0(23),
        z24     => z0(24),
        z25     => z0(25),
        z26     => z0(26),
        z27     => z0(27),
        z28     => z0(28),
        z29     => z0(29),
        z30     => z0(30),
        z31     => z0(31),
        z32     => z0(32),
        z33     => z0(33),
        z34     => z0(34),
        z35     => z0(35),
        fin     => fin
    );
    
    estimulos : process is begin
        rst         <= '1';
        hab         <= '0';
        t2          <= "00";
        
        s(1)        <= "100100";
        s(2)        <= "000001";
        s(3)        <= "000000";
        s(4)        <= "111111";
        s(5)        <= "100000";
        s(6)        <= "000000";
        s(7)        <= "111111";
        s(8)        <= "001101";
        
--        s(1)        <= "111111";
--        s(2)        <= "111111";
--        s(3)        <= "111111";
--        s(4)        <= "111111";
--        s(5)        <= "111111";
--        s(6)        <= "111111";
--        s(7)        <= "111111";
--        s(8)        <= "111111";
        
        sigma(1)    <= "111000";
        sigma(2)    <= "000010";
        sigma(3)    <= "100010";
        sigma(4)    <= "011001";
        sigma(5)    <= "000000";
        sigma(6)    <= "000000";
        sigma(7)    <= "000000";
        
        beta(0)     <= "000001";
        beta(1)     <= "000000";
        beta(2)     <= "000000";
        beta(3)     <= "000000";
        beta(4)     <= "000000";
        beta(5)     <= "000000";
        beta(6)     <= "111110";
        beta(7)     <= "000000";
        beta(8)     <= "000000";
        beta(9)     <= "000000";
        beta(10)    <= "000000";
        beta(11)    <= "000000";
        beta(12)    <= "000000";
        beta(13)    <= "000000";
        beta(14)    <= "000000";
        beta(15)    <= "000000";
        beta(16)    <= "100111";
        beta(17)    <= "000000";
        beta(18)    <= "000000";
        beta(19)    <= "000000";
        beta(20)    <= "000000";
        beta(21)    <= "000000";
        beta(22)    <= "000000";
        beta(23)    <= "101111";
        beta(24)    <= "000000";
        beta(25)    <= "000000";
        beta(26)    <= "000000";
        beta(27)    <= "000000";
        beta(28)    <= "000000";
        beta(29)    <= "000000";
        beta(30)    <= "000000";
        beta(31)    <= "000000";
        beta(32)    <= "000000";
        beta(33)    <= "000000";
        beta(34)    <= "000000";
        beta(35)    <= "000000";
        wait for 2*per;
        rst <= '0';
        wait for per;
        hab <= '1';
        wait for per;
        hab <= '0';
        wait;
    end process;


end Behavioral;

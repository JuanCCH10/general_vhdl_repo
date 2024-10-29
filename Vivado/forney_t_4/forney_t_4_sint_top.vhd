library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forney_t_4_sint_top is
    Port(
        clk, rst, hab : in std_logic;
        s1, sigma1, beta0 : in std_logic_vector(5 downto 0);
        val0 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end forney_t_4_sint_top;

architecture Behavioral of forney_t_4_sint_top is
    component forney_t_4 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
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
        sigma8  : in std_logic_vector(5 downto 0);
        sigma9  : in std_logic_vector(5 downto 0);
        sigma10 : in std_logic_vector(5 downto 0);
        sigma11 : in std_logic_vector(5 downto 0);
        sigma12 : in std_logic_vector(5 downto 0);
        sigma13 : in std_logic_vector(5 downto 0);
        sigma14 : in std_logic_vector(5 downto 0);
        sigma15 : in std_logic_vector(5 downto 0);
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
        val0    : out std_logic_vector(5 downto 0);
        val1    : out std_logic_vector(5 downto 0);
        val2    : out std_logic_vector(5 downto 0);
        val3    : out std_logic_vector(5 downto 0);
        val4    : out std_logic_vector(5 downto 0);
        val5    : out std_logic_vector(5 downto 0);
        val6    : out std_logic_vector(5 downto 0);
        val7    : out std_logic_vector(5 downto 0);
        val8    : out std_logic_vector(5 downto 0);
        val9    : out std_logic_vector(5 downto 0);
        val10   : out std_logic_vector(5 downto 0);
        val11   : out std_logic_vector(5 downto 0);
        val12   : out std_logic_vector(5 downto 0);
        val13   : out std_logic_vector(5 downto 0);
        val14   : out std_logic_vector(5 downto 0);
        val15   : out std_logic_vector(5 downto 0);
        val16   : out std_logic_vector(5 downto 0);
        val17   : out std_logic_vector(5 downto 0);
        val18   : out std_logic_vector(5 downto 0);
        val19   : out std_logic_vector(5 downto 0);
        val20   : out std_logic_vector(5 downto 0);
        val21   : out std_logic_vector(5 downto 0);
        val22   : out std_logic_vector(5 downto 0);
        val23   : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
    end component;
    
    type long is array (0 to 23) of std_logic_vector(5 downto 0);
    signal v : long;

begin

    conexiones : forney_t_4
    port map(
        clk     => clk,
        rst     => rst,
        hab     => hab,
        s1      => s1,
        s2      => "010101",
        s3      => "010101",
        s4      => "010101",
        s5      => "010101",
        s6      => "010101",
        s7      => "010101",
        s8      => "010101",
        sigma1  => sigma1,
        sigma2  => "101010",
        sigma3  => "101010",
        sigma4  => "101010",
        sigma5  => "101010",
        sigma6  => "101010",
        sigma7  => "101010",
        sigma8  => "101010",
        sigma9  => "101010",
        sigma10 => "101010",
        sigma11 => "101010",
        sigma12 => "101010",
        sigma13 => "101010",
        sigma14 => "101010",
        sigma15 => "101010",
        beta0   => beta0,
        beta1   => "000001",
        beta2   => "000001",
        beta3   => "000001",
        beta4   => "000001",
        beta5   => "000001",
        beta6   => "000001",
        beta7   => "000001",
        beta8   => "000001",
        beta9   => "000001",
        beta10  => "000001",
        beta11  => "000001",
        beta12  => "000001",
        beta13  => "000001",
        beta14  => "000001",
        beta15  => "000001",
        beta16  => "000001",
        beta17  => "000001",
        beta18  => "000001",
        beta19  => "000001",
        beta20  => "000001",
        beta21  => "000001",
        beta22  => "000001",
        beta23  => "000001",
        beta24  => "000001",
        beta25  => "000001",
        beta26  => "000001",
        beta27  => "000001",
        beta28  => "000001",
        beta29  => "000001",
        beta30  => "000001",
        beta31  => "000001",
        beta32  => "000001",
        beta33  => "000001",
        beta34  => "000001",
        beta35  => "000001",
        val0    => v(0),
        val1    => v(1),
        val2    => v(2),
        val3    => v(3),
        val4    => v(4),
        val5    => v(5),
        val6    => v(6),
        val7    => v(7),
        val8    => v(8),
        val9    => v(9),
        val10   => v(10),
        val11   => v(11),
        val12   => v(12),
        val13   => v(13),
        val14   => v(14),
        val15   => v(15),
        val16   => v(16),
        val17   => v(17),
        val18   => v(18),
        val19   => v(19),
        val20   => v(20),
        val21   => v(21),
        val22   => v(22),
        val23   => v(23),
        fin     => fin   
    );
    
    val0 <= v(0) xor v(1) xor v(2) xor v(3) xor v(4) xor v(5) xor v(6) xor v(7) xor v(8) xor v(9) xor v(10) xor v(11) xor v(12) xor v(13) xor v(14) xor v(15) xor v(16) xor v(17) xor v(18) xor v(19) xor v(20) xor v(21) xor v(22) xor v(23);

end Behavioral;

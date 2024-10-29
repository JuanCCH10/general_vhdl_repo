library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forney_t_4_tb is
end forney_t_4_tb;

architecture Behavioral of forney_t_4_tb is
    
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

    signal rst, clk, hab, fin : std_logic;
    constant per : time := 10ns;

begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;

    conexiones : forney_t_4
    port map(
        clk => clk,
        rst => rst,
        hab => hab,
        s1      => "101001",
        s2      => "011101",
        s3      => "011011",
        s4      => "010100",
        s5      => "000100",
        s6      => "001100",
        s7      => "111100",
        s8      => "101001",
        
        sigma1  => "001111",
        sigma2  => "110110",
        sigma3  => "111011",
        sigma4  => "000011",
        sigma5  => "000000",
        sigma6  => "000000",
        sigma7  => "000000",
        sigma8  => "000000",
        sigma9  => "000000",
        sigma10 => "000000",
        sigma11 => "000000",
        sigma12 => "000000",
        sigma13 => "000000",
        sigma14 => "000000",
        sigma15 => "000000",
        
        beta0   => "111001",
        beta1   => "110001",
        beta2   => "100001",
        beta3   => "000001",
        beta4   => "000000",
        beta5   => "000000",
        beta6   => "000000",
        beta7   => "000000",
        beta8   => "000000",
        beta9   => "000000",
        beta10  => "000000",
        beta11  => "000000",
        beta12  => "000000",
        beta13  => "000000",
        beta14  => "000000",
        beta15  => "000000",
        beta16  => "000000",
        beta17  => "000000",
        beta18  => "000000",
        beta19  => "000000",
        beta20  => "000000",
        beta21  => "000000",
        beta22  => "000000",
        beta23  => "000000",
        beta24  => "000000",
        beta25  => "000000",
        beta26  => "000000",
        beta27  => "000000",
        beta28  => "000000",
        beta29  => "000000",
        beta30  => "000000",
        beta31  => "000000",
        beta32  => "000000",
        beta33  => "000000",
        beta34  => "000000",
        beta35  => "000000",
        fin => fin
    );

    estimulos : process is begin
        rst <= '1';
        hab <= '0';
        wait for per;
        rst <= '0';
        hab <= '1';
        wait for per;
        hab <= '0';
        wait;
    end process;


end Behavioral;

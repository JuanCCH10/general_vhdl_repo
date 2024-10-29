library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ChienSearchGF26_tb is
end ChienSearchGF26_tb;

architecture Behavioral of ChienSearchGF26_tb is

    component chien_searchGF26 is
    Port(
        clk  : in std_logic;
        rst  : in std_logic;
        hab  : in std_logic;
        Ax0  : in std_logic_vector(5 downto 0);
        Ax1  : in std_logic_vector(5 downto 0);
        Ax2  : in std_logic_vector(5 downto 0);
        Ax3  : in std_logic_vector(5 downto 0);
        Ax4  : in std_logic_vector(5 downto 0);
        Ax5  : in std_logic_vector(5 downto 0);
        Ax6  : in std_logic_vector(5 downto 0);
        Ax7  : in std_logic_vector(5 downto 0);
        Ax8  : in std_logic_vector(5 downto 0);
        Ax9  : in std_logic_vector(5 downto 0);
        Ax10 : in std_logic_vector(5 downto 0);
        Ax11 : in std_logic_vector(5 downto 0);
        Ax12 : in std_logic_vector(5 downto 0);
        Ax13 : in std_logic_vector(5 downto 0);
        Ax14 : in std_logic_vector(5 downto 0);
        Ax15 : in std_logic_vector(5 downto 0);
        beta0   : out std_logic_vector(5 downto 0);
        beta1   : out std_logic_vector(5 downto 0);
        beta2   : out std_logic_vector(5 downto 0);
        beta3   : out std_logic_vector(5 downto 0);
        beta4   : out std_logic_vector(5 downto 0);
        beta5   : out std_logic_vector(5 downto 0);
        beta6   : out std_logic_vector(5 downto 0);
        beta7   : out std_logic_vector(5 downto 0);
        beta8   : out std_logic_vector(5 downto 0);
        beta9   : out std_logic_vector(5 downto 0);
        beta10  : out std_logic_vector(5 downto 0);
        beta11  : out std_logic_vector(5 downto 0);
        beta12  : out std_logic_vector(5 downto 0);
        beta13  : out std_logic_vector(5 downto 0);
        beta14  : out std_logic_vector(5 downto 0);
        beta15  : out std_logic_vector(5 downto 0);
        beta16  : out std_logic_vector(5 downto 0);
        beta17  : out std_logic_vector(5 downto 0);
        beta18  : out std_logic_vector(5 downto 0);
        beta19  : out std_logic_vector(5 downto 0);
        beta20  : out std_logic_vector(5 downto 0);
        beta21  : out std_logic_vector(5 downto 0);
        beta22  : out std_logic_vector(5 downto 0);
        beta23  : out std_logic_vector(5 downto 0);
        beta24  : out std_logic_vector(5 downto 0);
        beta25  : out std_logic_vector(5 downto 0);
        beta26  : out std_logic_vector(5 downto 0);
        beta27  : out std_logic_vector(5 downto 0);
        beta28  : out std_logic_vector(5 downto 0);
        beta29  : out std_logic_vector(5 downto 0);
        beta30  : out std_logic_vector(5 downto 0);
        beta31  : out std_logic_vector(5 downto 0);
        beta32  : out std_logic_vector(5 downto 0);
        beta33  : out std_logic_vector(5 downto 0);
        beta34  : out std_logic_vector(5 downto 0);
        beta35  : out std_logic_vector(5 downto 0);
        et_OL   : out std_logic;
        fin  : out std_logic
    );
    end component;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta_out : beta_array;
    
    signal rst, clk, hab, fin : std_logic;
    constant per : time := 10ns;

begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : chien_searchGF26
    port map(
        clk => clk,
        rst => rst,
        hab => hab,
        Ax0  => "000001",--0,01
        Ax1  => "011011",--38,33
        Ax2  => "010011",--16,23
        Ax3  => "001111",--18,17
        Ax4  => "101001",--23,51
        Ax5  => "000000",
        Ax6  => "000000",
        Ax7  => "000000",
        Ax8  => "000000",
        Ax9  => "000000",
        Ax10 => "000000",
        Ax11 => "000000",
        Ax12 => "000000",
        Ax13 => "000000",
        Ax14 => "000000",
        Ax15 => "000000",
        beta0  => beta_out(0),
        beta1  => beta_out(1),
        beta2  => beta_out(2),
        beta3  => beta_out(3),
        beta4  => beta_out(4),
        beta5  => beta_out(5),
        beta6  => beta_out(6),
        beta7  => beta_out(7),
        beta8  => beta_out(8),
        beta9  => beta_out(9),
        beta10 => beta_out(10),
        beta11 => beta_out(11),
        beta12 => beta_out(12),
        beta13 => beta_out(13),
        beta14 => beta_out(14),
        beta15 => beta_out(15),
        beta16 => beta_out(16),
        beta17 => beta_out(17),
        beta18 => beta_out(18),
        beta19 => beta_out(19),
        beta20 => beta_out(20),
        beta21 => beta_out(21),
        beta22 => beta_out(22),
        beta23 => beta_out(23),
        beta24 => beta_out(24),
        beta25 => beta_out(25),
        beta26 => beta_out(26),
        beta27 => beta_out(27),
        beta28 => beta_out(28),
        beta29 => beta_out(29),
        beta30 => beta_out(30),
        beta31 => beta_out(31),
        beta32 => beta_out(32),
        beta33 => beta_out(33),
        beta34 => beta_out(34),
        beta35 => beta_out(35),
        fin => fin
    );
    
    estimulos : process is begin
        rst <= '1';
        hab <= '0';
        wait for 2*per;
        rst <= '0';
        hab <= '1';
        wait for per;
        hab <= '0';
        wait;
    end process;


end Behavioral;

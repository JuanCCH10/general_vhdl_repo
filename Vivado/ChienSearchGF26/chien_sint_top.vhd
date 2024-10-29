library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity chien_sint_top is
    Port(
        clk, rst, hab : in std_logic;
        Ax0, Ax1, Ax2, Ax3, Ax4, Ax5, Ax6, Ax7 : in std_logic_vector(5 downto 0);
        beta0 : out std_logic_vector(5 downto 0);
        Et_OL : out std_logic;
        fin : out std_logic
    );
end chien_sint_top;

architecture Behavioral of chien_sint_top is
    
    component chien_searchGF26 is
    Port(
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        Ax0     : in std_logic_vector(5 downto 0);
        Ax1     : in std_logic_vector(5 downto 0);
        Ax2     : in std_logic_vector(5 downto 0);
        Ax3     : in std_logic_vector(5 downto 0);
        Ax4     : in std_logic_vector(5 downto 0);
        Ax5     : in std_logic_vector(5 downto 0);
        Ax6     : in std_logic_vector(5 downto 0);
        Ax7     : in std_logic_vector(5 downto 0);
        Ax8     : in std_logic_vector(5 downto 0);
        Ax9     : in std_logic_vector(5 downto 0);
        Ax10    : in std_logic_vector(5 downto 0);
        Ax11    : in std_logic_vector(5 downto 0);
        Ax12    : in std_logic_vector(5 downto 0);
        Ax13    : in std_logic_vector(5 downto 0);
        Ax14    : in std_logic_vector(5 downto 0);
        Ax15    : in std_logic_vector(5 downto 0);
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
        Et_OL   : out std_logic;
        fin     : out std_logic
    );
    end component;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal b : beta_array;

begin

    conexiones : chien_searchGF26
    port map(
        clk => clk, 
        rst => rst,
        hab => hab,
        Ax0  => Ax0 ,
        Ax1  => Ax1 ,
        Ax2  => Ax2 ,
        Ax3  => Ax3 ,
        Ax4  => Ax4 ,
        Ax5  => Ax5 ,
        Ax6  => Ax6 ,
        Ax7  => Ax7 ,
        Ax8  => "000000",
        Ax9  => "000000",
        Ax10 => "000000",
        Ax11 => "000000",
        Ax12 => "000000",
        Ax13 => "000000",
        Ax14 => "000000",
        Ax15 => "000000",
        beta0  => b(0),
        beta1  => b(1),
        beta2  => b(2),
        beta3  => b(3),
        beta4  => b(4),
        beta5  => b(5),
        beta6  => b(6),
        beta7  => b(7),
        beta8  => b(8),
        beta9  => b(9),
        beta10 => b(10),
        beta11 => b(11),
        beta12 => b(12),
        beta13 => b(13),
        beta14 => b(14),
        beta15 => b(15),
        beta16 => b(16),
        beta17 => b(17),
        beta18 => b(18),
        beta19 => b(19),
        beta20 => b(20),
        beta21 => b(21),
        beta22 => b(22),
        beta23 => b(23),
        beta24 => b(24),
        beta25 => b(25),
        beta26 => b(26),
        beta27 => b(27),
        beta28 => b(28),
        beta29 => b(29),
        beta30 => b(30),
        beta31 => b(31),
        beta32 => b(32),
        beta33 => b(33),
        beta34 => b(34),
        beta35 => b(35),
        Et_OL => Et_OL,
        fin => fin 
    );
    
    beta0 <= b(0) xor b(1) xor b(2) xor b(3) xor b(4) xor b(5) xor b(6) xor b(7) xor b(8) xor b(9) xor b(10) xor b(11) xor b(12) xor b(13) xor b(14) xor b(15) xor b(16) xor b(17) xor b(18) xor b(19) xor b(30) xor b(31) xor b(32) xor b(33) xor b(34) xor b(35);  

end Behavioral;

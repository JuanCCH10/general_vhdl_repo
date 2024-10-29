library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BMA_top_imp is
    Port(
        rst,clk,hab : in std_logic;
        t2 : in std_logic_vector(1 downto 0);
        s1 : in std_logic_vector(5 downto 0);
        Ax0 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end BMA_top_imp;

architecture Behavioral of BMA_top_imp is
    
    component berlekamp_masseyGF26 is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        hab : in std_logic;
        t2 : in std_logic_vector(1 downto 0);
        s1 : in std_logic_vector(5 downto 0);
        s2 : in std_logic_vector(5 downto 0);
        s3 : in std_logic_vector(5 downto 0);
        s4 : in std_logic_vector(5 downto 0);
        s5 : in std_logic_vector(5 downto 0);
        s6 : in std_logic_vector(5 downto 0);
        s7 : in std_logic_vector(5 downto 0);
        s8 : in std_logic_vector(5 downto 0);
        s9 : in std_logic_vector(5 downto 0);
        s10 : in std_logic_vector(5 downto 0);
        s11 : in std_logic_vector(5 downto 0);
        s12 : in std_logic_vector(5 downto 0);
        s13 : in std_logic_vector(5 downto 0);
        s14 : in std_logic_vector(5 downto 0);
        s15 : in std_logic_vector(5 downto 0);
        s16 : in std_logic_vector(5 downto 0);
        Ax0 : out std_logic_vector(5 downto 0);
        Ax1 : out std_logic_vector(5 downto 0);
        Ax2 : out std_logic_vector(5 downto 0);
        Ax3 : out std_logic_vector(5 downto 0);
        Ax4 : out std_logic_vector(5 downto 0);
        Ax5 : out std_logic_vector(5 downto 0);
        Ax6 : out std_logic_vector(5 downto 0);
        Ax7 : out std_logic_vector(5 downto 0);
        Ax8 : out std_logic_vector(5 downto 0);
        Ax9 : out std_logic_vector(5 downto 0);
        Ax10 : out std_logic_vector(5 downto 0);
        Ax11 : out std_logic_vector(5 downto 0);
        Ax12 : out std_logic_vector(5 downto 0);
        Ax13 : out std_logic_vector(5 downto 0);
        Ax14 : out std_logic_vector(5 downto 0);
        Ax15 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    type long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal a_x : long;
begin
    
    conexiones : berlekamp_masseyGF26
    port map(
        rst => rst,
        clk => clk,
        hab => hab,
        t2  => t2,
        s1  => s1(0)&"00001",
        s2  => s1(1)&"00001",
        s3  => s1(2)&"00001",
        s4  => s1(3)&"00001",
        s5  => s1(4)&"00001",
        s6  => s1(5)&"00001",
        s7  => "000001",
        s8  => "000001",
        s9  => "000001",
        s10 => "000001",
        s11 => "000001",
        s12 => "000001",
        s13 => "000001",
        s14 => "000001",
        s15 => "000001",
        s16 => "000001",
        Ax0 => a_x(0),
        Ax1 => a_x(1),
        Ax2 => a_x(2),
        Ax3 => a_x(3),
        Ax4 => a_x(4),
        Ax5 => a_x(5),
        Ax6 => a_x(6),
        Ax7 => a_x(7),
        fin => fin
    );
    
    Ax0 <= a_x(0) xor a_x(1) xor a_x(2) xor a_x(3) xor a_x(4) xor a_x(5) xor a_x(6) xor a_x(7);

end Behavioral;

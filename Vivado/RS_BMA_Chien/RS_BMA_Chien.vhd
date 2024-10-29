library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_BMA_Chien is
    Port(
        rst : in std_logic;
        clk : in std_logic;
        hab : in std_logic;
        t2 : in std_logic_vector(4 downto 0);
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
        s16 : in std_logic_vector(5 downto 0)
    );
end RS_BMA_Chien;

architecture Behavioral of RS_BMA_Chien is
    
    component sindrome_RS2416 is
    Port (
        clk, rst : in std_logic;
        simbolos : in std_logic_vector(5 downto 0);
        s1 : out std_logic_vector(5 downto 0);
        s2 : out std_logic_vector(5 downto 0);
        s3 : out std_logic_vector(5 downto 0);
        s4 : out std_logic_vector(5 downto 0);
        s5 : out std_logic_vector(5 downto 0);
        s6 : out std_logic_vector(5 downto 0);
        s7 : out std_logic_vector(5 downto 0);
        s8 : out std_logic_vector(5 downto 0);
        s9 : out std_logic_vector(5 downto 0);
        s10 : out std_logic_vector(5 downto 0);
        s11 : out std_logic_vector(5 downto 0);
        s12 : out std_logic_vector(5 downto 0);
        s13 : out std_logic_vector(5 downto 0);
        s14 : out std_logic_vector(5 downto 0);
        s15 : out std_logic_vector(5 downto 0);
        s16 : out std_logic_vector(5 downto 0);
        fin, sin_e : out std_logic
    );
    end component;
    
    component berlekamp_masseyGF26 is
    Port (
        rst : in std_logic;
        clk : in std_logic;
        hab : in std_logic;
        t2 : in std_logic_vector(4 downto 0);
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
    
    component chien_searchGF26 is
    Port(
        clk  : in std_logic;
        rst  : in std_logic;
        hab  : in std_logic;
        t2   : in std_logic_vector(4 downto 0);
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
        Et   : out std_logic_vector(8 downto 0);
        fin  : out std_logic
    );
    end component;
    
    type ax_long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal ax_con : ax_long;

begin

    BMA : berlekamp_masseyGF26
    port map(
        rst => rst,
        clk => clk,
        hab => hab,
        t2 => "00000",
        s1   => s1 ,
        s2   => s2 ,
        s3   => s3 ,
        s4   => s4 ,
        s5   => s5 ,
        s6   => s6 ,
        s7   => s7 ,
        s8   => s8 ,
        s9   => s9 ,
        s10  => s10,
        s11  => s11,
        s12  => s12,
        s13  => s13,
        s14  => s14,
        s15  => s15,
        s16  => s16,
        Ax0  => ax_con(0),
        Ax1  => ax_con(1),
        Ax2  => ax_con(2),
        Ax3  => ax_con(3),
        Ax4  => ax_con(4),
        Ax5  => ax_con(5),
        Ax6  => ax_con(6),
        Ax7  => ax_con(7),
        Ax8  => ax_con(8),
        Ax9  => ax_con(9),
        Ax10 => ax_con(10),
        Ax11 => ax_con(11),
        Ax12 => ax_con(12),
        Ax13 => ax_con(13),
        Ax14 => ax_con(14),
        Ax15 => ax_con(15),
        fin  => open
    );
    
    CS : chien_searchGF26
    port map(
        clk  => clk,
        rst  => clk,
        hab  => '0',
        t2   => "00000",
        Ax0  => ax_con(0), 
        Ax1  => ax_con(1), 
        Ax2  => ax_con(2), 
        Ax3  => ax_con(3), 
        Ax4  => ax_con(4), 
        Ax5  => ax_con(5), 
        Ax6  => ax_con(6), 
        Ax7  => ax_con(7), 
        Ax8  => ax_con(8), 
        Ax9  => ax_con(9), 
        Ax10 => ax_con(10),
        Ax11 => ax_con(11),
        Ax12 => ax_con(12),
        Ax13 => ax_con(13),
        Ax14 => ax_con(14),
        Ax15 => ax_con(15),
        Et   => open,
        fin  => open
    );


end Behavioral;

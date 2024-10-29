library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity berlekamp_masseyGF26_tb is
end berlekamp_masseyGF26_tb;

architecture Behavioral of berlekamp_masseyGF26_tb is
    
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
    
    signal rst, clk, hab, fin : std_logic;
    signal t2 : std_logic_vector(1 downto 0);
    type long_symbol is array (0 to 15) of std_logic_vector(5 downto 0);
    signal s, ax : long_symbol; 
    constant per : time := 10ns;

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : berlekamp_masseyGF26
    port map(
        rst   => rst,
        clk   => clk,
        hab   => hab,
        t2    => t2,
        s1    => s(0),
        s2    => s(1),
        s3    => s(2),
        s4    => s(3),
        s5    => s(4),
        s6    => s(5),
        s7    => s(6),
        s8    => s(7),
        s9    => s(8),
        s10   => s(9),
        s11   => s(10),
        s12   => s(11),
        s13   => s(12),
        s14   => s(13),
        s15   => s(14),
        s16   => s(15),
        
        Ax0   => ax(0),
        Ax1   => ax(1),
        Ax2   => ax(2),
        Ax3   => ax(3),
        Ax4   => ax(4),
        Ax5   => ax(5),
        Ax6   => ax(6),
        Ax7   => ax(7),
        Ax8   => ax(8),
        Ax9   => ax(9),
        Ax10  => ax(10),
        Ax11  => ax(11),
        Ax12  => ax(12),
        Ax13  => ax(13),
        Ax14  => ax(14),
        Ax15  => ax(15),
        fin   => fin
    );
    
    estimulos : process is begin
        rst <= '0';
        hab <= '0';
        t2 <= "00";     
        s(0)  <= "110111"; 
        s(1)  <= "001111"; 
        s(2)  <= "001011"; 
        s(3)  <= "100101"; 
        s(4)  <= "110110"; 
        s(5)  <= "000100"; 
        s(6)  <= "100100"; 
        s(7)  <= "111110"; 
        s(8)  <= "000000"; 
        s(9)  <= "000000"; 
        s(10) <= "000000"; 
        s(11) <= "000000"; 
        s(12) <= "000000"; 
        s(13) <= "000000"; 
        s(14) <= "000000"; 
        s(15) <= "000000"; 
        wait for per;
        rst <= '1';
--        wait for per;
--        rst <= '0';
--        wait for per;
--        rst <= '1';
        wait for per;
        rst <= '0';
        hab <= '1';
        wait for per;
        hab <= '0';
        wait;
        
    end process;


end Behavioral;

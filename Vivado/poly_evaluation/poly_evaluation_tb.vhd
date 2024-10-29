library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poly_evaluation_tb is
end poly_evaluation_tb;

architecture Behavioral of poly_evaluation_tb is
    
    component poly_evaluation is
    Port (
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
        fin : out std_logic
    );
    end component;
    
    signal clk, rst, fin, hab : std_logic;
    constant per : time := 10ns;

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : poly_evaluation
    port map(
        clk => clk,
        rst => rst,
        hab => hab,
        t2 => "00000",
        Ax0  => "000001",
        Ax1  => "100110",
        Ax2  => "000000",
        Ax3  => "000000",
        Ax4  => "000000",
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

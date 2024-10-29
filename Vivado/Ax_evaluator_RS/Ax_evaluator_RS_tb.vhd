library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ax_evaluator_RS_tb is
end Ax_evaluator_RS_tb;

architecture Behavioral of Ax_evaluator_RS_tb is

    component Ax_evaluator_RS is
        Port (
            rst, clk, hab : in std_logic;
            t2 : in std_logic_vector(3 downto 0);
            j : in std_logic_vector(5 downto 0);
            d : in std_logic_vector(5 downto 0);
            dm : in std_logic_vector(5 downto 0);
            Ax0 : in std_logic_vector(5 downto 0);
            Ax1 : in std_logic_vector(5 downto 0);
            Ax2 : in std_logic_vector(5 downto 0);
            Ax3 : in std_logic_vector(5 downto 0);
            Ax4 : in std_logic_vector(5 downto 0);
            Ax5 : in std_logic_vector(5 downto 0);
            Ax6 : in std_logic_vector(5 downto 0);
            Ax7 : in std_logic_vector(5 downto 0);
            Ax8  : in std_logic_vector(5 downto 0);
            Ax9  : in std_logic_vector(5 downto 0);
            Ax10 : in std_logic_vector(5 downto 0);
            Ax11 : in std_logic_vector(5 downto 0);
            Ax12 : in std_logic_vector(5 downto 0);
            Ax13 : in std_logic_vector(5 downto 0);
            Ax14 : in std_logic_vector(5 downto 0);
            Ax15 : in std_logic_vector(5 downto 0);
            Bx0  : in std_logic_vector(5 downto 0);
            Bx1  : in std_logic_vector(5 downto 0);
            Bx2  : in std_logic_vector(5 downto 0);
            Bx3  : in std_logic_vector(5 downto 0);
            Bx4  : in std_logic_vector(5 downto 0);
            Bx5  : in std_logic_vector(5 downto 0);
            Bx6  : in std_logic_vector(5 downto 0);
            Bx7  : in std_logic_vector(5 downto 0);
            Bx8  : in std_logic_vector(5 downto 0);
            Bx9  : in std_logic_vector(5 downto 0);
            Bx10 : in std_logic_vector(5 downto 0);
            Bx11 : in std_logic_vector(5 downto 0);
            Bx12 : in std_logic_vector(5 downto 0);
            Bx13 : in std_logic_vector(5 downto 0);
            Bx14 : in std_logic_vector(5 downto 0);
            Bx15 : in std_logic_vector(5 downto 0);
            A0 : out std_logic_vector(5 downto 0);
            A1 : out std_logic_vector(5 downto 0);
            A2 : out std_logic_vector(5 downto 0);
            A3 : out std_logic_vector(5 downto 0);
            A4 : out std_logic_vector(5 downto 0);
            A5 : out std_logic_vector(5 downto 0);
            A6 : out std_logic_vector(5 downto 0);
            A7 : out std_logic_vector(5 downto 0);
            A8 : out std_logic_vector(5 downto 0);
            A9 : out std_logic_vector(5 downto 0);
            A10 : out std_logic_vector(5 downto 0);
            A11 : out std_logic_vector(5 downto 0);
            A12 : out std_logic_vector(5 downto 0);
            A13 : out std_logic_vector(5 downto 0);
            A14 : out std_logic_vector(5 downto 0);
            A15 : out std_logic_vector(5 downto 0);
            fin : out std_logic
        );
    end component;

    type symbol_long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal A_x : symbol_long := (
    "000001",
    "000111",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000"
    );
    signal rst, clk, hab, fin : std_logic;
    signal t2 : std_logic_vector(3 downto 0);
    signal j, d, dm : std_logic_vector(5 downto 0);
    signal ax, bx, a : symbol_long;
    
    constant per : time := 10ns;

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : Ax_evaluator_RS
    port map(
        rst     => rst, 
        clk     => clk, 
        hab     => hab,
        t2      => t2,
        j       => j,
        d       => d,
        dm      => dm,
        Ax0     => ax(0),
        Ax1     => ax(1),
        Ax2     => ax(2),
        Ax3     => ax(3),
        Ax4     => ax(4),
        Ax5     => ax(5),
        Ax6     => ax(6),
        Ax7     => ax(7),
        Ax8     => ax(8),
        Ax9     => ax(9),
        Ax10    => ax(10),
        Ax11    => ax(11),
        Ax12    => ax(12),
        Ax13    => ax(13),
        Ax14    => ax(14),
        Ax15    => ax(15),
        Bx0     => bx(0), 
        Bx1     => bx(1), 
        Bx2     => bx(2), 
        Bx3     => bx(3), 
        Bx4     => bx(4), 
        Bx5     => bx(5), 
        Bx6     => bx(6), 
        Bx7     => bx(7), 
        Bx8     => bx(8), 
        Bx9     => bx(9), 
        Bx10    => bx(10),
        Bx11    => bx(11),
        Bx12    => bx(12),
        Bx13    => bx(13),
        Bx14    => bx(14),
        Bx15    => bx(15),
        A0      => a(0), 
        A1      => a(1), 
        A2      => a(2), 
        A3      => a(3), 
        A4      => a(4), 
        A5      => a(5), 
        A6      => a(6), 
        A7      => a(7), 
        A8      => a(8), 
        A9      => a(9), 
        A10     => a(10),
        A11     => a(11),
        A12     => a(12),
        A13     => a(13),
        A14     => a(14),
        A15     => a(15),
        fin     => fin
    );
    
    estimulos : process is begin
        rst     <= '1';
        hab     <= '0';
        t2      <= "1000";
        j       <= "000010";
        d       <= "101100";
        dm      <= "010001";
        
        ax(0)   <= "000001"; 
        ax(1)   <= "111101"; 
        ax(2)   <= "000100"; 
        ax(3)   <= "110011"; 
        ax(4)   <= "001111"; 
        ax(5)   <= "000000"; 
        ax(6)   <= "000000"; 
        ax(7)   <= "000000"; 
        ax(8)   <= "000000"; 
        ax(9)   <= "000000"; 
        ax(10)  <= "000000";
        ax(11)  <= "000000";
        ax(12)  <= "000000";
        ax(13)  <= "000000";
        ax(14)  <= "000000";
        ax(15)  <= "000000";
        
        bx(0)   <= "000001"; 
        bx(1)   <= "111101"; 
        bx(2)   <= "110111"; 
        bx(3)   <= "100100"; 
        bx(4)   <= "000000"; 
        bx(5)   <= "000000"; 
        bx(6)   <= "000000"; 
        bx(7)   <= "000000"; 
        bx(8)   <= "000000"; 
        bx(9)   <= "000000"; 
        bx(10)  <= "000000";
        bx(11)  <= "000000";
        bx(12)  <= "000000";
        bx(13)  <= "000000";
        bx(14)  <= "000000";
        bx(15)  <= "000000";
        
        wait for per;
        rst <= '0';
        hab <= '1';
        wait for per;
        hab <= '0';
        wait;
    end process;
end Behavioral;

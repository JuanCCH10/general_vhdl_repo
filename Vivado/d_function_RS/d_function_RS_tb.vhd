library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity d_function_RS_tb is
end d_function_RS_tb;

architecture Behavioral of d_function_RS_tb is
    
    component d_function_RS is
    Port (
        rst, clk, hab : in std_logic;
        K : in std_logic_vector(4 downto 0);
        L : in std_logic_vector(4 downto 0);
        s1 : in std_logic_vector(5 downto 0);
        s2 : in std_logic_vector(5 downto 0);
        s3 : in std_logic_vector(5 downto 0);
        s4 : in std_logic_vector(5 downto 0);
        s5 : in std_logic_vector(5 downto 0);
        s6 : in std_logic_vector(5 downto 0);
        s7 : in std_logic_vector(5 downto 0);
        s8 : in std_logic_vector(5 downto 0);
        ax0 : in std_logic_vector(5 downto 0);
        ax1 : in std_logic_vector(5 downto 0);
        ax2 : in std_logic_vector(5 downto 0);
        ax3 : in std_logic_vector(5 downto 0);
        ax4 : in std_logic_vector(5 downto 0);
        ax5 : in std_logic_vector(5 downto 0);
        ax6 : in std_logic_vector(5 downto 0);
        ax7 : in std_logic_vector(5 downto 0);
        fin : out std_logic;
        d : out std_logic_vector(5 downto 0)
    );
    end component;
    
    signal rst, clk, hab, fin : std_logic;
    signal l, k : std_logic_vector(4 downto 0);
    signal s1, s2, s3, s4, s5, s6, s7, s8, ax0, ax1, ax2, ax3, ax4, ax5, ax6, ax7, d : std_logic_vector(5 downto 0);
    
    constant per : time := 10ns;
    
    type state_values is array (0 to 8) of std_logic_vector(5 downto 0);
    signal A_x : state_values := (
    "000001",
    "010001",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "000000",
    "111111"
    );
    
    signal Sv : state_values :=(
    "010001",
    "110100",
    "100110",
    "000110",
    "001010",
    "000111",
    "111010",
    "100010",
    "000000"
--    "000000",
--    "000001",
--    "000010",
--    "000011",
--    "000100",
--    "000101",
--    "000110",
--    "000111",
--    "001000"
    );
    
begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : d_function_RS
    port map(
        rst => rst,
        clk => clk,
        hab => hab,
        L => l,
        K => k,
        s1 => s1,
        s2 => s2,
        s3 => s3,
        s4 => s4,
        s5 => s5,
        s6 => s6,
        s7 => s7,
        s8 => s8,
        ax0 => ax0,
        ax1 => ax1,
        ax2 => ax2,
        ax3 => ax3,
        ax4 => ax4,
        ax5 => ax5,
        ax6 => ax6,
        ax7 => ax7,
        fin => fin,
        d => d  
    );
    
    estimulos : process is begin
        rst <= '1'; -- (1)
        hab <= '0';
        l <= "00001";
        k <= "00010"; --k-1 
        s1 <= Sv(0); --alpha^47
        s2 <= Sv(1); --alpha^47
        s3 <= Sv(2);
        s4 <= Sv(3); --alpha^58
        s5 <= Sv(4); ---1
        s6 <= Sv(5); --alpha^47
        s7 <= Sv(6); --alpha^57
        s8 <= Sv(7); --alpha^56
        ax0 <= A_x(0);
        ax1 <= A_x(1);
        ax2 <= A_x(2);
        ax3 <= A_x(3);
        ax4 <= A_x(4);
        ax5 <= A_x(5);
        ax6 <= A_x(6);
        ax7 <= A_x(7);
        wait for per;
        rst <= '0';
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        hab <= '1';
        wait for per;
        hab <= '0';
        
        wait;
    end process;
    
end Behavioral;

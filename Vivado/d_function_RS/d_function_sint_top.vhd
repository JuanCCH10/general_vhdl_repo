library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_function_sint_top is
    Port(
        rst, clk, hab : in std_logic;
        k, l : in std_logic_vector(4 downto 0);
        s1 : in std_logic_vector(5 downto 0);
        ax0 : in std_logic_vector(5 downto 0);
        d : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end d_function_sint_top;

architecture Behavioral of d_function_sint_top is
    
    component d_function_GF26 is
    Port (
        rst, clk, hab : in std_logic;
        K : in std_logic_vector(4 downto 0);
        L : in std_logic_vector(4 downto 0);
        s1  : in std_logic_vector(5 downto 0);
        s2  : in std_logic_vector(5 downto 0);
        s3  : in std_logic_vector(5 downto 0);
        s4  : in std_logic_vector(5 downto 0);
        s5  : in std_logic_vector(5 downto 0);
        s6  : in std_logic_vector(5 downto 0);
        s7  : in std_logic_vector(5 downto 0);
        s8  : in std_logic_vector(5 downto 0);
        s9  : in std_logic_vector(5 downto 0);
        s10 : in std_logic_vector(5 downto 0);
        s11 : in std_logic_vector(5 downto 0);
        s12 : in std_logic_vector(5 downto 0);
        s13 : in std_logic_vector(5 downto 0);
        s14 : in std_logic_vector(5 downto 0);
        s15 : in std_logic_vector(5 downto 0);
        s16 : in std_logic_vector(5 downto 0);
        ax0  : in std_logic_vector(5 downto 0);
        ax1  : in std_logic_vector(5 downto 0);
        ax2  : in std_logic_vector(5 downto 0);
        ax3  : in std_logic_vector(5 downto 0);
        ax4  : in std_logic_vector(5 downto 0);
        ax5  : in std_logic_vector(5 downto 0);
        ax6  : in std_logic_vector(5 downto 0);
        ax7  : in std_logic_vector(5 downto 0);
        ax8  : in std_logic_vector(5 downto 0);
        ax9  : in std_logic_vector(5 downto 0);
        ax10 : in std_logic_vector(5 downto 0);
        ax11 : in std_logic_vector(5 downto 0);
        ax12 : in std_logic_vector(5 downto 0);
        ax13 : in std_logic_vector(5 downto 0);
        ax14 : in std_logic_vector(5 downto 0);
        ax15 : in std_logic_vector(5 downto 0);
        fin : out std_logic;
        d : out std_logic_vector(5 downto 0)
    );
    end component;

begin

    conexiones : d_function_GF26
    port map(
        rst => rst,
        clk => clk,
        hab => hab,
        K => k,
        L => l,
        s1 => s1,
        s2 => "000001",
        s3 => "000001",
        s4 => "000001",
        s5 => "000001",
        s6 => "000001",
        s7 => "000001",
        s8 => "000001",
        s9 => "000001",
        s10 => "000001",
        s11 => "000001",
        s12 => "000001",
        s13 => "000001",
        s14 => "000001",
        s15 => "000001",
        s16 => "000001",
        ax0 => ax0,
        ax1 => "000001",
        ax2 => "000001",
        ax3 => "000001",
        ax4 => "000001",
        ax5 => "000001",
        ax6 => "000001",
        ax7 => "000001",
        ax8 => "000001",
        ax9 => "000001",
        ax10 => "000001",
        ax11 => "000001",
        ax12 => "000001",
        ax13 => "000001",
        ax14 => "000001",
        ax15 => "000001",
        fin => fin,
        d => d
    );

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ax_evaluator_sint_top is
    Port(
        rst, clk, hab : in std_logic;
        j,d,dm,Ax0,Bx0 : in std_logic_vector(5 downto 0);
        a : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end ax_evaluator_sint_top;

architecture Behavioral of ax_evaluator_sint_top is

    component Ax_evaluator_RS is
    Port (
        rst, clk, hab : in std_logic;
        j : in std_logic_vector(5 downto 0);
        d : in std_logic_vector(5 downto 0);
        dm : in std_logic_vector(5 downto 0);
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
    
    type long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal ax : long;

begin
    
    conexiones : Ax_evaluator_RS
    port map(
        rst => rst,
        clk => clk,
        hab => hab,
        j => j,
        d => d,
        dm => dm,
        Ax0 => Ax0,
        Ax1  => "000001",
        Ax2  => "000001",
        Ax3  => "000001",
        Ax4  => "000001",
        Ax5  => "000001",
        Ax6  => "000001",
        Ax7  => "000001",
        Ax8  => "000001",
        Ax9  => "000001",
        Ax10 => "000001",
        Ax11 => "000001",
        Ax12 => "000001",
        Ax13 => "000001",
        Ax14 => "000001",
        Ax15 => "000001",
        Bx0  => Bx0,
        Bx1  => "000001",
        Bx2  => "000001",
        Bx3  => "000001",
        Bx4  => "000001",
        Bx5  => "000001",
        Bx6  => "000001",
        Bx7  => "000001",
        Bx8  => "000001",
        Bx9  => "000001",
        Bx10 => "000001",
        Bx11 => "000001",
        Bx12 => "000001",
        Bx13 => "000001",
        Bx14 => "000001",
        Bx15 => "000001",
        A0  => ax(0 ),
        A1  => ax(1 ),
        A2  => ax(2 ),
        A3  => ax(3 ),
        A4  => ax(4 ),
        A5  => ax(5 ),
        A6  => ax(6 ),
        A7  => ax(7 ),
        A8  => ax(8 ),
        A9  => ax(9 ),
        A10 => ax(10),
        A11 => ax(11),
        A12 => ax(12),
        A13 => ax(13),
        A14 => ax(14),
        A15 => ax(15),
        fin => fin
    );
    a <= ax(0) xor ax(1) xor ax(2) xor ax(3) xor ax(4) xor ax(5) xor ax(6) xor ax(7) xor ax(8) xor ax(9) xor ax(10) xor ax(11) xor ax(12) xor ax(13) xor ax(14) xor ax(15);
end Behavioral;

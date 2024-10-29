library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SHift_Register_n_tb is
end SHift_Register_n_tb;

architecture Behavioral of SHift_Register_n_tb is

    component Shift_Register_n is
    Generic(long_Reg: integer := 100;
            DataBits: integer := 18
    );
    Port (  Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
    );
    end component;
    
    constant per : time := 10ns;
    signal rst, ce, clk : std_logic;
    signal d, q : std_logic_vector(5 downto 0);

begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : Shift_Register_n
    generic map(long_Reg => 8, DataBits => 6)
    port map(
        Reset => rst,
        D => d,
        CE => ce,
        CLK => clk,
        Q => q
    );
    
    estimulos : process is begin
        rst <= '1';
        d <= "110101";
        ce <= '0';
        wait for 2*per;
        rst <= '0';
        wait for per;
        ce <= '1';
        wait for per;
        ce <= '0';
        wait for per;
        ce <= '1';
        wait;
    end process;


end Behavioral;

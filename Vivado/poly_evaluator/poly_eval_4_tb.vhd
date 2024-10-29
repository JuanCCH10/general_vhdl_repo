library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poly_eval_4_tb is
end poly_eval_4_tb;

architecture Behavioral of poly_eval_4_tb is
    component poly_eval_4 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        x0      : in std_logic_vector(5 downto 0);
        x1      : in std_logic_vector(5 downto 0);
        x2      : in std_logic_vector(5 downto 0);
        x3      : in std_logic_vector(5 downto 0);
        x4      : in std_logic_vector(5 downto 0);
        x5      : in std_logic_vector(5 downto 0);
        x6      : in std_logic_vector(5 downto 0);
        x7      : in std_logic_vector(5 downto 0);
        x8      : in std_logic_vector(5 downto 0);
        x9      : in std_logic_vector(5 downto 0);
        x10     : in std_logic_vector(5 downto 0);
        x11     : in std_logic_vector(5 downto 0);
        x12     : in std_logic_vector(5 downto 0);
        x13     : in std_logic_vector(5 downto 0);
        x14     : in std_logic_vector(5 downto 0);
        x15     : in std_logic_vector(5 downto 0);
        x16     : in std_logic_vector(5 downto 0);
        x17     : in std_logic_vector(5 downto 0);
        x18     : in std_logic_vector(5 downto 0);
        x19     : in std_logic_vector(5 downto 0);
        x20     : in std_logic_vector(5 downto 0);
        x21     : in std_logic_vector(5 downto 0);
        x22     : in std_logic_vector(5 downto 0);
        x23     : in std_logic_vector(5 downto 0);
        coef0   : in std_logic_vector(5 downto 0);
        coef1   : in std_logic_vector(5 downto 0);
        coef2   : in std_logic_vector(5 downto 0);
        coef3   : in std_logic_vector(5 downto 0);
        s0      : out std_logic_vector(5 downto 0);     
        s1      : out std_logic_vector(5 downto 0);
        s2      : out std_logic_vector(5 downto 0);
        s3      : out std_logic_vector(5 downto 0);
        s4      : out std_logic_vector(5 downto 0);
        s5      : out std_logic_vector(5 downto 0);
        s6      : out std_logic_vector(5 downto 0);
        s7      : out std_logic_vector(5 downto 0);
        s8      : out std_logic_vector(5 downto 0);
        s9      : out std_logic_vector(5 downto 0);
        s10     : out std_logic_vector(5 downto 0);
        s11     : out std_logic_vector(5 downto 0);
        s12     : out std_logic_vector(5 downto 0);
        s13     : out std_logic_vector(5 downto 0);
        s14     : out std_logic_vector(5 downto 0);
        s15     : out std_logic_vector(5 downto 0);
        s16     : out std_logic_vector(5 downto 0);
        s17     : out std_logic_vector(5 downto 0);
        s18     : out std_logic_vector(5 downto 0);
        s19     : out std_logic_vector(5 downto 0);
        s20     : out std_logic_vector(5 downto 0);
        s21     : out std_logic_vector(5 downto 0);
        s22     : out std_logic_vector(5 downto 0);
        s23     : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
    end component;
    
    constant per : time := 10ns;
    
    signal clk, rst, hab : std_logic;
    
begin

    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conection : poly_eval_4
    port map(
        clk   => clk,
        rst   => rst,
        hab   => hab,
        x0    => "000001",
        x1    => "000000",
        x2    => "000000",
        x3    => "000000",
        x4    => "000000",
        x5    => "000000",
        x6    => "111110",
        x7    => "000000",
        x8    => "000000",
        x9    => "000000",
        x10   => "000000",
        x11   => "000000",
        x12   => "000000",
        x13   => "000000",
        x14   => "000000",
        x15   => "000000",
        x16   => "100111",
        x17   => "000000",
        x18   => "000000",
        x19   => "000000",
        x20   => "000000",
        x21   => "000000",
        x22   => "000000",
        x23   => "101111",
        coef0 => "100100",
        coef1 => "000000",
        coef2 => "110011",
        coef3 => "000000",
        s0    => open,
        s1    => open,
        s2    => open,
        s3    => open,
        s4    => open,
        s5    => open,
        s6    => open,
        s7    => open,
        s8    => open,
        s9    => open,
        s10   => open,
        s11   => open,
        s12   => open,
        s13   => open,
        s14   => open,
        s15   => open,
        s16   => open,
        s17   => open,
        s18   => open,
        s19   => open,
        s20   => open,
        s21   => open,
        s22   => open,
        s23   => open,
        fin   => open
    );
    
    estimulus : process is begin
        rst <= '0';
        hab <= '0';
        wait for per;
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for per;
        hab <= '1';
        wait;
    end process;

end Behavioral;

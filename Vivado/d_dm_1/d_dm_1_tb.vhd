library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_dm_1_tb is
end d_dm_1_tb;

architecture Behavioral of d_dm_1_tb is
    
    component d_dm_1 is
    Port (
        d :  in std_logic_vector(5 downto 0);
        dm : in std_logic_vector(5 downto 0);
        ddm1 : out std_logic_vector(5 downto 0)
    );
    end component;
    
    signal d, dm, ddm1 : std_logic_vector(5 downto 0);
    signal clk : std_logic;
    constant per : time := 10ns;
    
begin
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : d_dm_1
    port map(
        d => d,
        dm => dm,
        ddm1 => ddm1
    );
    
    estimulos : process is begin
        d <= "000001";
        dm <= "000001";
        wait for per;
        d <= "000001";
        dm <= "000000";
        wait for per;
        d <= "000000";
        dm <= "000001";
        wait for per;
        d <= "000000";
        dm <= "000000";
        wait for per;
        ----------------------------------
        d <= "010101"; --25oct
        dm <= "100111";--47oct
        wait for per;
        d <= "011100"; --34oct
        dm <= "101001";--51oct
        wait for per;
        d <= "111000"; --70oct
        dm <= "010001";--21oct
        wait for per;
        d <= "101110"; --56oct
        dm <= "110100";--64oct
        wait;
    end process;

end Behavioral;

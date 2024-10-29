library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity modAC_VA34_V3tb is
end modAC_VA34_V3tb;

architecture Behavioral of modAC_VA34_V3tb is

    component modAC_VA34_V3 is
    port(
        clk : in std_logic; 
        rst : in std_logic; 
        ce : in std_logic; 
        en_rd : in std_logic;
        dibits_rx   : in std_logic_vector(3 downto 0);
        addr_rd     : in std_logic_vector(5 downto 0);
        est_r       : out std_logic_vector(2 downto 0);
        fin         : out std_logic
    );
    end component;
    
    signal clk, rst, ce, en_rd, fin : std_logic;
    signal est_r : std_logic_vector(2 downto 0);
    signal dibits_rx : std_logic_vector(3 downto 0);
    signal addr_rd : std_logic_vector(5 downto 0);
    constant per : time := 10ns;
    
    file fileRD : text open READ_MODE is "01_block_2.txt";
    file fileWR : text open WRITE_MODE is "analisis_dist_1.txt";

begin
    en_rd <= fin;
    
    conexiones : modAC_VA34_V3
    port map(
        clk => clk,
        rst => rst,
        ce => ce,
        en_rd => en_rd,
        dibits_rx => dibits_rx,
        addr_rd => addr_rd,
        est_r => est_r,
        fin => fin
    );
    
    clk_gen : process is begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    reset_gen : process is begin
        rst <= '1';
        wait for per;
        rst <= '0';
        wait for per*249; 
    end process;
    
    ce_gen : process is 
        variable j : integer := 0;
    begin
        ce <= '0';
        wait for per;
        while j < 49 loop
            ce <= '0';
            wait for per;
            ce <= '1';
            wait for per;
            j := j + 1;
        end loop;
        j := 0;
        ce <= '0';
        --wait for 151*per; -- se utiliza para repetir el proceso
        wait;
    end process;
    
    estimulos : process is 
        variable i      : integer   := 0;
        variable R_point: line;
        variable R_val  : std_logic_vector(3 downto 0);
    begin
        if endfile(fileRD) then
            wait;
        end if;
        readline(fileRD, R_point);
        read(R_point, R_val);
        dibits_rx <= R_val;
        wait for 2*per;
        while i < 49 loop
            readline(fileRD, R_point);
            read(R_point, R_val);
            dibits_rx <= R_val;
            i := i + 1;
        wait for 2*per; --wait for per*2;
        end loop;
        i := 0;
        wait for 150*per;
    end process;
    
    addr_rd_gen : process is
        variable j : integer := 0;
    begin
        wait for 200*per;  -- + 2, antes 198
        while j < 49 loop
            addr_rd <= CONV_STD_LOGIC_VECTOR(j,6);
            wait for per;
            j := j + 1;
        end loop;
        j := 0;
        wait for per;
    end process;
    
--    save_data : process(clk) is
--        variable WR_point : line;
--    begin
--        if fin = '1' then
--            if falling_edge(clk) then
--                write(WR_point, est_r);
--                writeline(fileWR, WR_point);
--            end if;
--        end if;
--    end process;

end Behavioral;

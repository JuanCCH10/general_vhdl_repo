library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;


entity divisor_limit is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           dout : out STD_LOGIC);
end divisor_limit;

architecture Behavioral of divisor_limit is

signal Conta: std_logic_vector (Nbits-1 downto 0);
constant Lim: std_logic_vector (Nbits-1 downto 0):= conv_std_logic_vector (Limit,Nbits);
signal D_int: std_logic;

begin

process (rst, clk) is

BEGIN
    if rst = '1' then
        Conta <= (others => '0');
        D_int <= '0';
        elsif rising_edge (clk) then
            if en = '1' then
                if Conta < Lim then
                    Conta <= Conta +1;
                else 
                    Conta <= (others => '0');
                    D_int <= not D_int;
                end if;
            end if;
    end if;
end process;

Dout <= D_int;

end Behavioral;

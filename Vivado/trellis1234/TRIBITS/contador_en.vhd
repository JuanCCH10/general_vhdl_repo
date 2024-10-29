library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;


entity contador_en is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            );
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           BusOut	: out STD_LOGIC_VECTOR(Nbits-1 downto 0));
           --dout : out STD_LOGIC);
end contador_en;

architecture Behavioral of contador_en is

signal Conta: std_logic_vector (Nbits-1 downto 0);
constant Lim: std_logic_vector (Nbits-1 downto 0):= conv_std_logic_vector (Limit,Nbits);
--signal D_int: std_logic;

begin

process (en, clk) is

BEGIN
 if rst = '1' then
        Conta <= (others => '0');
        --D_int <= '0';
        elsif rising_edge (clk) then
            if en = '1' then
                if Conta < Lim then
                    Conta <= Conta +1;
                   else
                    Conta <= (others => '0');
                    --D_int <= not D_int;
                end if;
            end if;
    end if;
end process;

--Dout <= D_int;
BusOut <= Conta;

end Behavioral;

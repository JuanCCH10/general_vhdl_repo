library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_nbits is
    generic(nbits : integer := 10);
    Port (
        A : in std_logic_vector(nbits-1 downto 0);
        B : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits downto 0)
    );
end sumador_nbits;

architecture Behavioral of sumador_nbits is

component Sumador is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal resultado : std_logic_vector(nbits-1 downto 0);
type carrys is array (0 to nbits) of std_logic;
signal carry : carrys;

begin
    carry(0) <= '0';
    Inst_Sumador : for I in 0 to nbits-1 generate
            sumador_1bit : Sumador
            port map(
                A => A(I),
                B => B(I),
                Cin => carry(I),
                S => resultado(I),
                Cout => carry(I+1)
            );
    end generate;
    S <= carry(nbits) & resultado(nbits-1 downto 0);

end Behavioral;

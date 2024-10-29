library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.rom_ddm_1.all;
use ieee.std_logic_unsigned.all;

entity d_dm_1 is
    Port (
        d :  in std_logic_vector(5 downto 0);
        dm : in std_logic_vector(5 downto 0);
        ddm1 : out std_logic_vector(5 downto 0)
    );
end d_dm_1;

architecture Behavioral of d_dm_1 is

    component mux_bits2alpha is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 63
            value : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal dm_pot, d_pot : std_logic_vector(5 downto 0);
    signal addr_ddm1 : std_logic_vector(11 downto 0);

begin
    potencia_dm : mux_bits2alpha
    port map(
        pointer => dm,
        value => dm_pot
    );
    potencia_d : mux_bits2alpha
    port map(
        pointer => d,
        value => d_pot
    );
    addr_ddm1 <= dm_pot & d_pot;
    
    ddm1 <= rom_ddm1(conv_integer(addr_ddm1));

end Behavioral;

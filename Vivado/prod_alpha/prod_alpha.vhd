library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
end prod_alpha;

architecture Behavioral of prod_alpha is

    component mux_alpha2bits is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 62
            value : out std_logic_vector(5 downto 0)
        );
    end component;
    
    component mux_bits2alpha is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 63
            value : out std_logic_vector(5 downto 0)
        );
    end component;
    
    component sumador_nbits is
        generic(nbits : integer := 10);
        Port (
            A : in std_logic_vector(nbits-1 downto 0);
            B : in std_logic_vector(nbits-1 downto 0);
            S : out std_logic_vector(nbits downto 0)
        );
    end component;
    
    signal decA : std_logic_vector(5 downto 0);
    signal decB : std_logic_vector(5 downto 0);
    signal alpha_pointer, pot_res : std_logic_vector(5 downto 0);
    signal pot : std_logic_vector(6 downto 0);
    signal res : std_logic_vector(7 downto 0);

begin
    -- Hay que manejar los alphas en su notación real en bits
    -- Internamente, la multiplicación debe manejar las potencias 
    -- de las alphas en notación decimal
    Interf_alphaA : mux_bits2alpha
    port map(
        pointer => alphaA,
        value => decA
    );
    
    Interf_alphaB : mux_bits2alpha
    port map(
        pointer => alphaB,
        value => decB
    );
    
    suma_pot : sumador_nbits
    generic map(nbits => 6)
    port map(
        A => decA,
        B => decB,
        S => pot
    );
    
    resultado : mux_alpha2bits
    port map(
        pointer => alpha_pointer,
        value => pot_res
    );
    
    resta_pot : sumador_nbits
    generic map(nbits => 7)
    port map(
        A => pot,
        B => "1000001",
        S => res
    );
    
    alpha_pointer <= pot(5 downto 0) when (pot < "0111111") else res(5 downto 0);
    
    --excepcion
    alphaR <= "000000" when (alphaA = "000000" or alphaB = "000000") else pot_res;
                    
end Behavioral;

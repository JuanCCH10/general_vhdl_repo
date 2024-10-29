library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_serie_paral_8 is
    Port (
        clk : in std_logic;
        load : in std_logic;
        d : in std_logic_vector(5 downto 0);
        q0 : out std_logic_vector(5 downto 0);
        q1 : out std_logic_vector(5 downto 0);
        q2 : out std_logic_vector(5 downto 0);
        q3 : out std_logic_vector(5 downto 0);
        q4 : out std_logic_vector(5 downto 0);
        q5 : out std_logic_vector(5 downto 0);
        q6 : out std_logic_vector(5 downto 0);
        q7 : out std_logic_vector(5 downto 0)
    );
end reg_serie_paral_8;

architecture Behavioral of reg_serie_paral_8 is

begin


end Behavioral;

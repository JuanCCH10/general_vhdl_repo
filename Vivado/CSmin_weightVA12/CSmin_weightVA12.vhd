----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.08.2022 11:38:02
-- Design Name: 
-- Module Name: CSmin_weightVA12 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- %% Elección de peso mínimo de trayectoria en cada estado
--            weight(1,aux_c) = min(weight_acc(1:4,aux_c));
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CSmin_weightVA12 is
    generic(num_bits : integer := 10); 
    Port (
        a,b,c,d : in std_logic_vector(num_bits-1 downto 0);
        weight_state : out std_logic_vector(num_bits-1 downto 0)
    );
end CSmin_weightVA12;

architecture Behavioral of CSmin_weightVA12 is

component modulo_C_VA is
    generic(num_bits : integer := 10);
    Port (
        A, B : in std_logic_vector(num_bits-1 downto 0);
        G,L,E : out std_logic
    );
end component;

signal aL : std_logic_vector(2 downto 0);
signal aE : std_logic_vector(2 downto 0);
signal bL : std_logic_vector(1 downto 0);
signal bE : std_logic_vector(1 downto 0);
signal cEL : std_logic_vector(1 downto 0);
signal dG : std_logic_vector(2 downto 0);
signal selector : std_logic_vector(3 downto 0);
signal sa, sb, sc, sd : std_logic;



begin

    a01 : modulo_C_VA
    port map(
        A => a,
        B => b,
        G => open,
        L => aL(0),
        E => aE(0)
    );
            
    a02 : modulo_C_VA
    port map(
        A => a,
        B => c,
        G => open,
        L => aL(1),
        E => aE(1)
    );
    
    a03 : modulo_C_VA
    port map(
        A => a,
        B => d,
        G => dG(0),
        L => aL(2),
        E => aE(2)
    );        
    
    b12 : modulo_C_VA
    port map(
        A => b,
        B => c,
        G => open,
        L => bL(0),
        E => bE(0)
    );
    
    b13 : modulo_C_VA
    port map(
        A => b,
        B => d,
        G => dG(1),
        L => bL(1),
        E => bE(1)
    );
    
    c23 : modulo_C_VA
    port map(
        A => c,
        B => d,
        G => dG(2),
        L => cEL(0),
        E => cEL(1)
    );
    
    sa <= (aL(2) or aL(1) or aL(0) or aE(2) or aE(1) or aE(0));
    sb <= (bL(1) or bL(0) or bE(1) or bE(0));
    sc <= cEL(1) or cEL(0);
    sd <= dG(2) or dG(1) or dG(0);
     
--    selector <= dG & cEL & bE & bL & aE & aL;
    selector <= sa & sb & sc & sd;
    
--    process(selector) is begin
--        case selector is
--        when "" => weight_state <= a;
        
--        when others => weight_state <= a;
--        end case;
--    end process;


end Behavioral;

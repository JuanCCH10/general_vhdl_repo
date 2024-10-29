----------------------------------------------------------------------------------
-- Company: UNINDETEC
-- Engineer: Juan Carlos Chavez Hermoso
-- 
-- Create Date: 11.03.2022 11:31:13
-- Design Name: Trellis 3/4
-- Module Name: Trellis_34 - Behavioral
-- Project Name: Trellis_34
-- Target Devices: A7 cmod 35t
-- Tool Versions: 
-- Description: Maquina de estados finitos correspondiente al algoritmo Trellis 3/4 de TIA BAAA, tabla 12, pág. 37
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Trellis_34 is
    Port (
    en : in std_logic;
    rst : in std_logic;
    clk : in std_logic;
    trib_in : in std_logic_vector(2 downto 0);
    dibs_out : out std_logic_vector(3 downto 0)
     );
end Trellis_34;

architecture Behavioral of Trellis_34 is

type nombres_estados is (st0, st1, st2, st3, st4, st5, st6, st7);
signal estado : nombres_estados;
signal entrada_aux : std_logic_vector(2 downto 0);

begin

entrada_aux <= trib_in;

process(rst, clk, en) begin
    if en = '1' then
        if rst = '1' then
            estado <= st0;
        elsif clk = '1' and clk'event then
            case estado is
                when st0 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;
                when st1 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;
                when st2 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;
                when st3 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;    
                when st4 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;    
                when st5 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;    
                when st6 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;
                when st7 =>
                    case entrada_aux is
                        when "000" => estado <= st0;
                        when "001" => estado <= st1;
                        when "010" => estado <= st2;
                        when "011" => estado <= st3;
                        when "100" => estado <= st4;
                        when "101" => estado <= st5;
                        when "110" => estado <= st6;
                        when "111" => estado <= st7;
                        when others => estado <=st0;
                    end case;    
                when others => estado <= st0;
            end case;    
        end if;
    end if;
end process;

process(estado, entrada_aux, en) begin
    if en = '1' then
        case estado is
            when st0 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0000";
                    when "001" => dibs_out <= "1000";
                    when "010" => dibs_out <= "0010";
                    when "011" => dibs_out <= "1100";
                    when "100" => dibs_out <= "0010";
                    when "101" => dibs_out <= "1010";
                    when "110" => dibs_out <= "0110";
                    when "111" => dibs_out <= "1110";
                    when others => dibs_out <= "0000";
                end case;
            when st1 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0100";
                    when "001" => dibs_out <= "1100";
                    when "010" => dibs_out <= "0010";
                    when "011" => dibs_out <= "1010";
                    when "100" => dibs_out <= "0110";
                    when "101" => dibs_out <= "1110";
                    when "110" => dibs_out <= "0000";
                    when "111" => dibs_out <= "1000";
                    when others => dibs_out <= "0000";
                end case;
            when st2 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0001";
                    when "001" => dibs_out <= "1001";
                    when "010" => dibs_out <= "0101";
                    when "011" => dibs_out <= "1101";
                    when "100" => dibs_out <= "0011";
                    when "101" => dibs_out <= "1011";
                    when "110" => dibs_out <= "0111";
                    when "111" => dibs_out <= "1111";
                    when others => dibs_out <= "0000";
                end case;   
            when st3 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0101";
                    when "001" => dibs_out <= "1101";
                    when "010" => dibs_out <= "0011";
                    when "011" => dibs_out <= "1011";
                    when "100" => dibs_out <= "0111";
                    when "101" => dibs_out <= "1111";
                    when "110" => dibs_out <= "0001";
                    when "111" => dibs_out <= "1001";
                    when others => dibs_out <= "0000";
                end case; 
            when st4 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0011";
                    when "001" => dibs_out <= "1011";
                    when "010" => dibs_out <= "0111";
                    when "011" => dibs_out <= "1111";
                    when "100" => dibs_out <= "0001";
                    when "101" => dibs_out <= "1001";
                    when "110" => dibs_out <= "0101";
                    when "111" => dibs_out <= "1101";
                    when others => dibs_out <= "0000";
                end case;   
            when st5 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0111";
                    when "001" => dibs_out <= "1111";
                    when "010" => dibs_out <= "0001";
                    when "011" => dibs_out <= "1001";
                    when "100" => dibs_out <= "0101";
                    when "101" => dibs_out <= "1101";
                    when "110" => dibs_out <= "0011";
                    when "111" => dibs_out <= "1011";
                    when others => dibs_out <= "0000";
                end case;     
            when st6 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0010";
                    when "001" => dibs_out <= "1010";
                    when "010" => dibs_out <= "0110";
                    when "011" => dibs_out <= "1110";
                    when "100" => dibs_out <= "0000";
                    when "101" => dibs_out <= "1000";
                    when "110" => dibs_out <= "0100";
                    when "111" => dibs_out <= "1100";
                    when others => dibs_out <= "0000";
                end case;    
            when st7 =>
                case entrada_aux is
                    when "000" => dibs_out <= "0110";
                    when "001" => dibs_out <= "1110";
                    when "010" => dibs_out <= "0000";
                    when "011" => dibs_out <= "1000";
                    when "100" => dibs_out <= "0100";
                    when "101" => dibs_out <= "1100";
                    when "110" => dibs_out <= "0010";
                    when "111" => dibs_out <= "1010";
                    when others => dibs_out <= "0000";
                end case;
            when others => dibs_out <= "0000";
        end case;
    end if;       
end process;
                        

end Behavioral;

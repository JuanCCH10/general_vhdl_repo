----------------------------------------------------------------------------------
-- Company: UNINDETEC
-- Engineer: Juan Carlos Chavez Hermoso
--
-- Create Date: 11.03.2022 08:38:53
-- Design Name: Trellis 1/2
-- Module Name: Trellis_12 - Behavioral
-- Project Name: Trellis_12
-- Target Devices: A7 cmod 35t
-- Tool Versions:
-- Description: Maquina de estados finitos correspondiente al algoritmo Trellis 1/2 de TIA BAAA, tabla 12, p�g. 37
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Sin mapeador
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trellis_12 is
    Port (
    en : in std_logic;
    rst : in std_logic;
    clk : in std_logic;
    dib_in : in std_logic_vector(1 downto 0);
    dibs_out : out std_logic_vector(3 downto 0)
     );
end Trellis_12;

architecture Behavioral of Trellis_12 is

type estados is (st0, st1, st2, st3);
signal estado : estados;
signal entrada_aux : std_logic_vector(1 downto 0);

begin

entrada_aux <= dib_in;

process(rst, clk) is begin
        if rst = '1' then
            estado <= st0;
        elsif rising_edge(clk) then
            if en = '1' then
                case estado is
                    when st0 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out <= "0000";
                            when "01" =>
                                estado <= st1;
                                dibs_out <= "1111";
                            when "10" =>
                                estado <= st2;
                                dibs_out <= "1100";
                            when "11" =>
                                estado <= st3;
                                dibs_out <= "0011";
                            when others =>
                                estado <= st0;
                                dibs_out <= "0000";
                        end case;
                    when st1 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out <= "0100";
                            when "01" =>
                                estado <= st1;
                                dibs_out <= "1011";
                            when "10" =>
                                estado <= st2;
                                dibs_out <= "1000";
                            when "11" =>
                                estado <= st3;
                                dibs_out <= "0111";
                            when others =>
                                estado <= st0;
                                dibs_out <= "0000";
                        end case;
                    when st2 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out <= "1101";
                            when "01" =>
                                estado <= st1;
                                dibs_out <= "0010";
                            when "10" =>
                                estado <= st2;
                                dibs_out <= "0001";
                            when "11" =>
                                estado <= st3;
                                dibs_out <= "1110";
                            when others =>
                                estado <= st0;
                                dibs_out <= "0000";
                        end case;
                    when st3 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out <= "1001";
                            when "01" =>
                                estado <= st1;
                                dibs_out <= "0110";
                            when "10" =>
                                estado <= st2;
                                dibs_out <= "0101";
                            when "11" =>
                                estado <= st3;
                                dibs_out <= "1010";
                            when others =>
                                estado <= st0;
                                dibs_out <= "0000";
                        end case;
                    when others =>
                        estado <= st0;
                        dibs_out <= "0000";
                end case;
            end if;
        end if;
end process;
end Behavioral;

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
-- Se modificaron las salidas conforme al mapeador
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
    dibs_out : out std_logic_vector(3 downto 0);
    Valido : out std_logic
     );
end Trellis_12;

architecture Behavioral of Trellis_12 is

type estados is (st0, st1, st2, st3);
signal estado : estados;
signal entrada_aux : std_logic_vector(1 downto 0);

signal aux_val: std_logic;
signal dibs_out1: std_logic_vector (3 downto 0);

component FF_Add_n is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 1);
    Port ( Clk  : in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end component;

begin

entrada_aux <= dib_in;

process(rst, clk) is begin
        if rst = '1' then
            estado <= st0;
            dibs_out1 <=(others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                case estado is
                    when st0 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out1 <= "0010"; 
                            when "01" =>
                                estado <= st1;
                                dibs_out1 <= "1100"; 
                            when "10" =>
                                estado <= st2;
                                dibs_out1 <= "0001"; 
                            when "11" =>
                                estado <= st3;
                                dibs_out1 <= "1111"; 
                            when others =>
                                estado <= st0;
                                dibs_out1 <= "0010";
                        end case;
                    when st1 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out1 <= "1110";
                            when "01" =>
                                estado <= st1;
                                dibs_out1 <= "0000";
                            when "10" =>
                                estado <= st2;
                                dibs_out1 <= "1101";
                            when "11" =>
                                estado <= st3;
                                dibs_out1 <= "0011";
                            when others =>
                                estado <= st0;
                                dibs_out1 <= "0010";
                        end case;
                    when st2 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out1 <= "1001";
                            when "01" =>
                                estado <= st1;
                                dibs_out1 <= "0111";
                            when "10" =>
                                estado <= st2;
                                dibs_out1 <= "1010";
                            when "11" =>
                                estado <= st3;
                                dibs_out1 <= "0100";
                            when others =>
                                estado <= st0;
                                dibs_out1 <= "0010";
                        end case;
                    when st3 =>
                        case entrada_aux is
                            when "00" =>
                                estado <= st0;
                                dibs_out1 <= "0101";
                            when "01" =>
                                estado <= st1;
                                dibs_out1 <= "1011";
                            when "10" =>
                                estado <= st2;
                                dibs_out1 <= "0110";
                            when "11" =>
                                estado <= st3;
                                dibs_out1 <= "1000";
                            when others =>
                                estado <= st0;
                                dibs_out1 <= "0010";
                        end case;
                    when others =>
                        estado <= st0;
                        dibs_out1 <= "0010";
                end case;
            end if;
        end if;
end process;

dibs_out <= dibs_out1;
 
FF0: FF_Add_n
generic map(nFF   => 1,
            nbits=> 1)
Port map( Clk   => Clk, 
          D(0) => en,    
          Q(0) => aux_val);
          
Valido <= aux_val;
         
end Behavioral;

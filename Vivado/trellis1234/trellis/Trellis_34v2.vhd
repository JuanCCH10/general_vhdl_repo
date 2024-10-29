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
-- Description: Maquina de estados finitos correspondiente al algoritmo Trellis 3/4 de TIA BAAA, tabla 12, p�g. 37
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

entity Trellis_34 is
    Port (
    en : in std_logic;
    rst : in std_logic;
    clk : in std_logic;
    trib_in : in std_logic_vector(2 downto 0);
    dibs_out : out std_logic_vector(3 downto 0);
    Valido: out std_logic
     );
end Trellis_34;

architecture Behavioral of Trellis_34 is

type nombres_estados is (st0, st1, st2, st3, st4, st5, st6, st7);
signal estado : nombres_estados;
signal entrada_aux : std_logic_vector(2 downto 0);
signal dibs_out1: std_logic_vector (3 downto 0);
signal aux_val: std_logic;

component FF_Add_n is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 1);
    Port ( Clk  : in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end component;

begin

entrada_aux <= trib_in;

process(rst, clk, en) begin
    if rst = '1' then
        estado <= st0;
        dibs_out1 <=(others => '0');
    elsif rising_edge(clk) then
        if en = '1' then
            case estado is
                when st0 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "0010";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "1101";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "1110"; --
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "0001";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "0111";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "1000";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "1011";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "0100";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st1 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "1110";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "0001";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "0111";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "1000";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "1011";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "0100";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "0010";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "1101";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st2 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "1010";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "0101";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "0110";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "1001";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "1111";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "0000";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "0011";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "1100";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st3 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "0110";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "1001";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "1111";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "0000";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "0011";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "1100";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "1010";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "0101";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st4 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "1111";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "0000";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "0011";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "1100";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "1010";
                        when "101" => 
                            estado <= st5;
                            dibs_out1 <= "0101";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "0110";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "1001";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st5 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "0011";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "1100";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "1010";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "0101";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "0110";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "1001";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "1111";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "0000";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st6 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "0111";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "1000";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "1011";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "0100";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "0010";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "1101";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "1110";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "0001";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
                    end case;
                when st7 =>
                    case entrada_aux is
                        when "000" =>
                            estado <= st0;
                            dibs_out1 <= "1011";
                        when "001" =>
                            estado <= st1;
                            dibs_out1 <= "0100";
                        when "010" =>
                            estado <= st2;
                            dibs_out1 <= "0010";
                        when "011" =>
                            estado <= st3;
                            dibs_out1 <= "1101";
                        when "100" =>
                            estado <= st4;
                            dibs_out1 <= "1110";
                        when "101" =>
                            estado <= st5;
                            dibs_out1 <= "0001";
                        when "110" =>
                            estado <= st6;
                            dibs_out1 <= "0111";
                        when "111" =>
                            estado <= st7;
                            dibs_out1 <= "1000";
                        when others =>
                            estado <=st0;
                            dibs_out1 <= "0000";
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

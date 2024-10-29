library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trellis_3_4 is
	Port (
		inicio: in std_logic;
		ck: in std_logic;
		b1: in std_logic;
		b2: in std_logic;
		b3: in std_logic;
		out1: out std_logic;
		out2: out std_logic;
		out3: out std_logic;
		out4: out std_logic
		);
end Trellis_3_4;

architecture behavioral of Trellis_3_4 is

type nombres_estados is (St0, St1, St2, St3, St4, St5, St6, St7);
signal estado: nombres_estados;
signal entrada_aux: std_logic_vector (2 downto 0);

begin

entrada_aux<=b1&b2&b3

process(inicio, ck)
begin
if inicio='1' then
	estado<=St0;
elsif ck='1' and ck'event then
	case estado is
		when St0 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St1 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St2 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St3 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St4 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St5 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St6 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when St7 =>
			case entrada_aux is
				when "000" => estado<=St0;
				when "001" => estado<=St1;
				when "010" => estado<=St2;
				when "011" => estado<=St3;
				when "100" => estado<=St4;
				when "101" => estado<=St5;
				when "110" => estado<=St6;
				when "111" => estado<=St7;
				when others => estado<=St0;
			end case;
		when others => estado<=St0;
	end case;
end if;
end process;

process(estado, entrada_aux)
begin
case estado is
	when St0 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='0';
			when "001" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='0';
			when "010" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='0';
			when "011" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='0';
			when "100" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='0';
			when "101" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='0';
			when "110" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='0';
			when "111" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='0';
		end case;
	when St1 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='0';
			when "001" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='0';
			when "010" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='0';
			when "011" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='0';
			when "100" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='0';
			when "101" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='0';
			when "110" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='0';
			when "111" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='0';
		end case;
	when St2 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='1';
			when "001" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='1';
			when "010" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='1';
			when "011" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='1';
			when "100" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='1';
			when "101" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='1';
			when "110" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='1';
			when "111" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='1';
		end case;
	when St3 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='1';
			when "001" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='1';
			when "010" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='1';
			when "011" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='1';
			when "100" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='1';
			when "101" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='1';
			when "110" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='1';
			when "111" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='1';
		end case;
	when St4 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='1';
			when "001" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='1';
			when "010" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='1';
			when "011" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='1';
			when "100" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='1';
			when "101" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='1';
			when "110" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='1';
			when "111" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='1';
		end case;
	when St5 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='1';
			when "001" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='1';
			when "010" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='1';
			when "011" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='1';
			when "100" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='1';
			when "101" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='1';
			when "110" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='1';
			when "111" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='1';
		end case;
	when St6 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='0';
			when "001" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='0';
			when "010" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='0';
			when "011" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='0';
			when "100" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='0';
			when "101" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='0';
			when "110" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='0';
			when "111" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='0';
		end case;
	when St7 =>
		case entrada_aux is
			when "000" =>
				out1<='0';
				out2<='1';
				out3<='1';
				out4<='0';
			when "001" =>
				out1<='1';
				out2<='1';
				out3<='1';
				out4<='0';
			when "010" =>
				out1<='0';
				out2<='0';
				out3<='0';
				out4<='0';
			when "011" =>
				out1<='1';
				out2<='0';
				out3<='0';
				out4<='0';
			when "100" =>
				out1<='0';
				out2<='1';
				out3<='0';
				out4<='0';
			when "101" =>
				out1<='1';
				out2<='1';
				out3<='0';
				out4<='0';
			when "110" =>
				out1<='0';
				out2<='0';
				out3<='1';
				out4<='0';
			when "111" =>
				out1<='1';
				out2<='0';
				out3<='1';
				out4<='0';
		end case;
end case;
end process;

end behavioral;

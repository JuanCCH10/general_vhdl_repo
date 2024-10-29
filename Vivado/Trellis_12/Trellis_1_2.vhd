library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trellis_1_2 is
	Port (
		rst: in std_logic;
		clk: in std_logic;
		b1: in std_logic;
		b2: in std_logic;
		bout1: out std_logic;
		bout2: out std_logic;
		bout3: out std_logic;
		bout4: out std_logic
		);
end Trellis_1_2;

architecture behavioral of Trellis_1_2 is

type nombres_estados is (St0, St1, St2, St3);
signal estado: nombres_estados;
signal entrada_aux: std_logic_vector (1 downto 0);
signal sb1 : std_logic;
signal sb2 : std_logic;

begin
sb1 <= b1;
sb2 <= b2;

entrada_aux <= sb1 & sb2;

process(rst, clk)
begin
if rst = '1' then
	estado<=St0;
elsif clk='1' and clk'event then
	case estado is
		when St0 =>
			case entrada_aux is
				when "00" => estado<=St0;
				when "01" => estado<=St1;
				when "10" => estado<=St2;
				when "11" => estado<=St3;
				when others => estado<=St0;
			end case;
		when St1 =>
			case entrada_aux is
				when "00" => estado<=St0;
				when "01" => estado<=St1;
				when "10" => estado<=St2;
				when "11" => estado<=St3;
				when others => estado<=St0;
			end case;
		when St2 =>
			case entrada_aux is
				when "00" => estado<=St0;
				when "01" => estado<=St1;
				when "10" => estado<=St2;
				when "11" => estado<=St3;
				when others => estado<=St0;
			end case;
		when St3 =>
			case entrada_aux is
				when "00" => estado<=St0;
				when "01" => estado<=St1;
				when "10" => estado<=St2;
				when "11" => estado<=St3;
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
	       when "00" =>
	           bout1<='0';
			   bout2<='0';
			   bout3<='0';
			   bout4<='0';
			when "01" =>
				bout1<='1';
				bout2<='1';
				bout3<='1';
				bout4<='1';
			when "10" =>
				bout1<='1';
				bout2<='1';
				bout3<='0';
				bout4<='0';
			when "11" =>
				bout1<='0';
				bout2<='0';
				bout3<='1';
				bout4<='1';
		    when others =>
		        bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='0';  
		end case;
	when St1 =>
		case entrada_aux is
			when "00" =>
				bout1<='0';
				bout2<='1';
				bout3<='0';
				bout4<='0';
			when "01" =>
				bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='1';
			when "10" =>
				bout1<='1';
				bout2<='0';
				bout3<='0';
				bout4<='0';
			when "11" =>
				bout1<='0';
				bout2<='1';
				bout3<='1';
				bout4<='1';
			when others =>
		        bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='0'; 
		end case;
	when St2 =>
		case entrada_aux is
			when "00" =>
				bout1<='1';
				bout2<='1';
				bout3<='0';
				bout4<='1';
			when "01" =>
				bout1<='0';
				bout2<='0';
				bout3<='1';
				bout4<='0';
			when "10" =>
				bout1<='0';
				bout2<='0';
				bout3<='0';
				bout4<='1';
			when "11" =>
				bout1<='1';
				bout2<='1';
				bout3<='1';
				bout4<='0';
			when others =>
		        bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='0'; 
		end case;
	when St3 =>
		case entrada_aux is
			when "00" =>
				bout1<='1';
				bout2<='0';
				bout3<='0';
				bout4<='1';
			when "01" =>
				bout1<='0';
				bout2<='1';
				bout3<='1';
				bout4<='0';
			when "10" =>
				bout1<='0';
				bout2<='1';
				bout3<='0';
				bout4<='1';
			when "11" =>
				bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='0';
			when others =>
		        bout1<='1';
				bout2<='0';
				bout3<='1';
				bout4<='0'; 
		end case;
    when others => bout1 <='1';	 
end case;
end process;

end behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Antirebotes is
    generic (Nciclos	: integer := 50);
	 Port ( reset	: in STD_LOGIC;
			  clk 	: in  STD_LOGIC;
           boton 	: in  STD_LOGIC;
           salida : out  STD_LOGIC);
end Antirebotes;

architecture Behavioral of Antirebotes is

signal dato : std_logic;
signal conteo : integer RANGE 0 TO Nciclos:= 0;

begin
	salida <= boton and dato; 
		
process (reset, clk)
begin
	if reset = '1' then
		dato 		<= '0';
		conteo	<= 0;
	elsif(rising_edge (clk)) then
		if boton = '1' then
			if conteo < Nciclos then 
				conteo	<= conteo + 1;
				dato		<= '0';
			else 
				dato		<= '1';
			end if;
		else
			dato		<= '0';
			conteo	<= 0;
		end if;
	end if;
end process;

end Behavioral;


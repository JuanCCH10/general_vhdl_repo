----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Detec_flancos is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
		  PulsoS : out  STD_LOGIC);
end Detec_flancos;

architecture Behavioral of Detec_flancos is
signal Iaux: std_logic;


begin
--genera pulso de 1 ciclo de reloj en los flancos(subida y bajada)
PROCESS (clk)
	BEGIN
		IF RISING_EDGE (clk) THEN
			Iaux			<= Entrada;
		END IF;
	END PROCESS;
PulsoB		<= NOT Entrada AND Iaux;
PulsoS		<= Entrada AND not Iaux;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:29 09/30/2015 
-- Design Name: 
-- Module Name:    DetectorFlancos - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--USADO PARA SEÑALES QUE SE GENERAN INTERNAMENTE O QUE ESTAN SINCRONIZADAS CON EL RELOJ BASE
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DetectFlancosSincro is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
			  PulsoS : out  STD_LOGIC);
end DetectFlancosSincro;

architecture Behavioral of DetectFlancosSincro is
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


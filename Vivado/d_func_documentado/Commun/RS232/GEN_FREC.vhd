----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:30 10/21/2014 
-- Design Name: 
-- Module Name:    GEN_FREC_TX - Behavioral 
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
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GEN_FREC is
	generic(
			  DIVIDE : integer := 500
			  );
    Port ( RESET 	: in  STD_LOGIC;
           CLK 	: in  STD_LOGIC;
           HAB 	: in  STD_LOGIC;
           SALIDA : out  STD_LOGIC);
end GEN_FREC;

architecture Behavioral of GEN_FREC is

signal counter: integer;
signal SALIDA_AUX: STD_LOGIC;
begin

gen_frec: process(RESET,CLK) is
begin
	if RESET = '1' then
		SALIDA_AUX <= '0';
		counter <= 0;
	elsif rising_edge(CLK) then
		if HAB = '1' then
			if counter < DIVIDE then
				counter <= counter + 1;
			else
				counter <= 0;
				SALIDA_AUX <= NOT SALIDA_AUX;
			end if;
		else
		SALIDA_AUX <= '0';
		end if;
	end if;
end process;

SALIDA <=SALIDA_AUX;

end Behavioral;


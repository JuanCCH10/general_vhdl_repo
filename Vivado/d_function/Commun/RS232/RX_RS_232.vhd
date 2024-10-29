----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:51 04/23/2015 
-- Design Name: 
-- Module Name:    RX_RS_232 - Behavioral 
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

entity RX_RS_232 is
    generic(DIVIDE : integer := 7813);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RXD : in  STD_LOGIC;
           dato_valido : out  STD_LOGIC;
           Byte_Rx : out  STD_LOGIC_VECTOR (7 downto 0));
end RX_RS_232;

architecture Behavioral of RX_RS_232 is
COMPONENT RECEPCION
	PORT(
		reset				: IN std_logic;
		clk				: IN std_logic;
		ck_bauds			: IN std_logic;
		RXD				: IN std_logic;          
		Hab_Gen_Frec	: OUT std_logic;
		dato_valido		: OUT std_logic;
		Byte_Rx			: OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
component GEN_FREC is
	generic(
			  DIVIDE : integer := 500
			  );
    Port ( RESET 	: in  STD_LOGIC;
           CLK 	: in  STD_LOGIC;
           HAB 	: in  STD_LOGIC;
           SALIDA : out  STD_LOGIC);
end component;

--constant DIVIDE: INTEGER :=5208/4;--100,000,000/9600 = 10416 : 10416/2=5208
--constant DIVIDE: INTEGER :=8;--9600	
--constant DIVIDE: INTEGER :=7813;--100,000,000/6400 = 15627 : 15627/2=7813
--constant DIVIDE: INTEGER :=1736;--100,000,000/28800 = 3472 : 3472/2=1736
signal ck_bauds, Hab_Gen_Frec: std_logic;
begin

Inst_RECEPCION: RECEPCION PORT MAP(
		reset				=> reset,
		clk				=> clk,
		ck_bauds			=> ck_bauds,
		RXD				=> RXD,
		Hab_Gen_Frec	=> Hab_Gen_Frec,
		dato_valido		=> dato_valido,
		Byte_Rx			=> Byte_Rx
	);
	
BAUDAJE_RX: GEN_FREC
generic map(DIVIDE => DIVIDE)
Port map ( RESET 	=> reset,
           CLK 	=> clk,
           HAB		=> Hab_Gen_Frec,
			  SALIDA =>ck_bauds
			  );
end Behavioral;


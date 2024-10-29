----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:54 04/23/2015 
-- Design Name: 
-- Module Name:    RS_232_TX - Behavioral 
-- Project Name: 
-- Target Devices: SPARTAM 3A (XCS700A)
-- Tool versions: ISE 14.7
-- Description:	Modulo que transmite datos por el protocolo RS-232
--						transmite el dato puesto en el puerto entrada y cuando el
--						el puerto de enviar dato se pone alto
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TX_RS_232 is
    generic(DIVIDE : integer := 7813);
    Port ( reset			: in  STD_LOGIC; --reset general del modulo
           clk				: in  STD_LOGIC; --reloj general de entrada al FPGA	
           envia_dato	: in  STD_LOGIC; --señal de habilitacion para envio del dato (alto)
           Byte_Tx		: in  STD_LOGIC_VECTOR (7 downto 0);--dato a enviar
           dato_enviado	: out  STD_LOGIC; --bandera que indica que se envio el dato (1 ciclo baudio)
           TXD				: out  STD_LOGIC); --puerto de transmision de bits
end TX_RS_232;

architecture Behavioral of TX_RS_232 is

component GEN_FREC is
	generic(
			  DIVIDE : integer := 500
			  );
    Port ( RESET 	: in  STD_LOGIC;
           CLK 	: in  STD_LOGIC;
           HAB 	: in  STD_LOGIC;
           SALIDA : out  STD_LOGIC);
end component;
--constant DIVIDE: INTEGER :=5208;--100,000,000/9,600 = 10416 : 10416/2=5208
--constant DIVIDE2: INTEGER :=2604;--50000000/9600 = 5208 : 5208/2=2604
--constant DIVIDE2: INTEGER :=446;--50000000/56000 = 892 : 892/2=446
--constant DIVIDE2: INTEGER :=8;--9600
--constant DIVIDE: INTEGER :=7813;--100,000,000/6400 = 15627 : 15627/2=7813
--constant DIVIDE: INTEGER :=1736;--100,000,000/28800 = 3472 : 3472/2=1736
COMPONENT TRANSMISION
	PORT(
		reset				: IN std_logic;
		clk				: IN std_logic;
		ck_bauds			: IN std_logic;
		Byte_Tx			: IN std_logic_vector(7 downto 0);
		Envia_dato		: IN std_logic;
		enable_TX		: out std_logic;          
		Dato_enviado	: OUT std_logic;
		TXD				: OUT std_logic
		);
	END COMPONENT;
signal ck_bauds, enable_TX: std_logic;

begin

BAUDAJE_TX: GEN_FREC
generic map(DIVIDE => DIVIDE)
Port map ( RESET 	=> reset,
           CLK 	=> clk,
           HAB		=> enable_TX,
			  SALIDA =>ck_bauds
			  );
			  
Inst_TRANSMISION: TRANSMISION PORT MAP(
		reset				=> reset,
		clk				=> clk,
		ck_bauds			=> ck_bauds,
		Byte_Tx			=> Byte_Tx,
		Envia_dato		=> envia_dato,
		enable_TX		=> enable_TX,
		Dato_enviado	=> dato_enviado,
		TXD				=> TXD
	);


end Behavioral;


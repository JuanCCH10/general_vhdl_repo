----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:53 04/22/2015 
-- Design Name: 
-- Module Name:    TRANSMISION - Behavioral 
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

entity TRANSMISION is
    Port ( reset			: in  STD_LOGIC;--Reset general
           clk				: in  STD_LOGIC;--reloj general
           ck_bauds		: in  STD_LOGIC;--frecuencia transmision
           Byte_Tx		: in  STD_LOGIC_VECTOR (7 downto 0);--datos a enviar
           Envia_dato	: in  STD_LOGIC; --habilitador de envio
			  enable_TX		: out	STD_LOGIC; --habilitador del generador de frecuencia de TX
           Dato_enviado	: out  STD_LOGIC; --bandera indica ya se envio dato(1 ciclo de clk)
           TXD 			: out  STD_LOGIC);--linea de TX
end TRANSMISION;

architecture Behavioral of TRANSMISION is

type TX_ESTADO is (
    INICIO,BIT_INICIO,TX_BYTE,SEND_END
    );
signal ESTADO_TX          : TX_ESTADO;
signal bit_index   : integer range 0 to 7;
signal ck_tx, ck_bauds_aux	: std_logic;
signal TX	:std_logic;
signal send_dato, Envia_dato_aux	: std_logic;

signal Dato_enviado1,Dato_enviado1_aux,pulso_Dato_enviado1: STD_LOGIC;
begin

--GENERAR UN PULSO DE UN RELOJ A PARTIR DE LA SEÑAL EN EL FLANCO DE SUBIDA
Pulso_bauds: process (clk)
   begin
		if rising_edge(clk) then
			ck_tx <= ck_bauds and  not ck_bauds_aux;
         ck_bauds_aux <= ck_bauds;
      end if;
	end process;
	
Pulso_envia: process (clk)
   begin
		if rising_edge(clk) then
			send_dato <= Envia_dato and  not Envia_dato_aux;
         Envia_dato_aux <= Envia_dato;
      end if;
	end process;
	
TX_SINCRONO: process(reset,clk) is
begin
	if reset = '1' then
		ESTADO_TX	<= INICIO;
		TX				<= '1';
		enable_TX	<= '0';
		Dato_enviado1<= '0';
	elsif rising_edge(clk) then
		if ck_tx = '1' then
			case ESTADO_TX is
			
				when	INICIO =>
					TX				<= '1';
					bit_index 	<= 0;
					Dato_enviado1<= '0';
					enable_TX	<= '0';
					
				when	BIT_INICIO =>
					TX				<= '0';
					ESTADO_TX	<=TX_BYTE;
					
				when	TX_BYTE =>
					TX <= Byte_Tx(bit_index);
					if bit_index < 7 then		
						bit_index  <= bit_index + 1;
					else
						ESTADO_TX	<= SEND_END;			
					end if;					
					
				when	SEND_END =>
					TX				<= '1';
					Dato_enviado1<= '1';
					ESTADO_TX	<= INICIO;
				when others =>
					ESTADO_TX	<= INICIO;
			end case;
		end if;
		if send_dato = '1' then
			ESTADO_TX <=BIT_INICIO;
			enable_TX	<= '1';
		end if;	
		
	end if;
end process;

TXD <= TX;

pulso_envio_dato: process (clk)
   begin
		if rising_edge(clk) then
			pulso_Dato_enviado1	<= not Dato_enviado1 and Dato_enviado1_aux;
         Dato_enviado1_aux	<= Dato_enviado1;
      end if;
	end process;
Dato_enviado <= pulso_Dato_enviado1;

end Behavioral;


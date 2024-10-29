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
use work.Modulos_Genericos_Pkg.all;


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

--type TX_ESTADO is (
--    INICIO,BIT_INICIO,TX_BYTE,SEND_END
--    );
--signal ESTADO_TX          : TX_ESTADO;
--signal bit_index   : integer range 0 to 7;
--signal ck_tx, ck_bauds_aux	: std_logic;
--signal TX	:std_logic;
--signal send_dato, Envia_dato_aux	: std_logic;

--signal Dato_enviado1,Dato_enviado1_aux,pulso_Dato_enviado1: STD_LOGIC;



signal ck_tx: std_logic;
signal Data_Tx: std_logic_vector(9 downto 0);

signal Rst_Int: std_logic;
signal Enable_TX_Int: STD_LOGIC;
begin

Detec01: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => ck_bauds,
            PulsoB  => ck_tx,--
            PulsoS  => open);--

Rst_Int <= Envia_dato or Reset;
Ret_inicio:Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Rst_Int,
            Clk      => Clk,
           	En       => ck_tx,
           	DIN      => x"9",
           	Dout     => open,
           	En_Out   => Enable_TX_Int);

process(clk) is
begin
	if Reset = '1' then
		Data_Tx <= (others=>'1');
	elsif rising_edge(clk) then
		if Envia_dato = '1' then
--			Data_Tx <=  "10" & Byte_Tx;
			Data_Tx <=  Byte_Tx & "01";
		else
			if ck_tx = '1' then
--				Data_Tx <= Data_Tx(8 downto 0) & '1';	--corrimiento hacia la izquierda
				Data_Tx <= '1' & Data_Tx(9 downto 1);	--corrimiento hacia la derecha
			end if;
		end if;
	end if;
end process;

           	
--TXD <= Data_Tx(8);          	
TXD <= Data_Tx(0); 
Enable_TX <= Enable_TX_Int;
Detec02: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Enable_TX_Int,
            PulsoB  => Dato_enviado,--
            PulsoS  => open);--
            

end Behavioral;


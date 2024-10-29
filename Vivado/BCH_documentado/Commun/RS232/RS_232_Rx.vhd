----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2019 11:21:22
-- Design Name: 
-- Module Name: RS_232_Tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

entity RS_232_Rx is
    Port (  Reset   : in STD_LOGIC;
            clk     : in STD_LOGIC;
            Rx      : in STD_LOGIC;
            led     : out STD_LOGIC_VECTOR(7 DOWNTO 0);
            TXD     : out STD_LOGIC
            );
end RS_232_Rx;

architecture Behavioral of RS_232_Rx is
--**********************************************
component RX_RS_232 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RXD : in  STD_LOGIC;
           dato_valido : out  STD_LOGIC;
           Byte_Rx : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Byte_Rx : STD_LOGIC_VECTOR (7 downto 0);
signal dato_valido : STD_LOGIC;

--**********************************************
component TX_RS_232 is
    Port ( reset			: in  STD_LOGIC; --reset general del modulo
           clk				: in  STD_LOGIC; --reloj general de entrada al FPGA	
           envia_dato	: in  STD_LOGIC; --señal de habilitacion para envio del dato (alto)
           Byte_Tx		: in  STD_LOGIC_VECTOR (7 downto 0);--dato a enviar
           dato_enviado	: out  STD_LOGIC; --bandera que indica que se envio el dato (1 ciclo baudio)
           TXD				: out  STD_LOGIC); --puerto de transmision de bits
end component;
--**********************************************
begin

Serial_Rx: RX_RS_232
Port Map ( reset        => Reset,
           clk          => clk,
           RXD          => Rx,
           dato_valido  => dato_valido,
           Byte_Rx      => Byte_Rx
           );
		
process(clk) is
begin
    if rising_edge(clk) then
        if  dato_valido = '1' then
            led <= Byte_Rx;
        end if;
    end if;
end process;
--**********************************************
Serial_Tx: TX_RS_232
Port map ( reset        => Reset,
           clk          => clk,		
           envia_dato   => dato_valido,
           Byte_Tx      => Byte_Rx,		
           dato_enviado => open,	
           TXD          => TXD
           );

 

end Behavioral;

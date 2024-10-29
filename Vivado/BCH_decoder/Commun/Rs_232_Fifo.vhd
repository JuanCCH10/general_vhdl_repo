----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:09 02/07/2017 
-- Design Name: 
-- Module Name:    Rs_232_Fifo - Behavioral 
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

entity Rs_232_Fifo is
    Port ( Reset    : in  STD_LOGIC;
           Clk		: in  STD_LOGIC;
           Data_Rx	: in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           En_Rx	: in  STD_LOGIC;
           TXD		: out  STD_LOGIC;
           Tx_End	: out  STD_LOGIC;
		   busy	    : out  STD_LOGIC);
end Rs_232_Fifo;

architecture Behavioral of Rs_232_Fifo is

component DetectFlancosSincro is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
			  PulsoS : out  STD_LOGIC);
end component;
signal En_Rx_Pulso: std_logic;

COMPONENT Fifo_Rx_RS_232
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

signal FIFO_FULL	: STD_LOGIC;--se�al proveniente de un contro(ej. FIFO)
signal FIFO_EMPTY	: STD_LOGIC;--se�al proveniente de un contro(ej. FIFO)
signal DATA_TX1		: STD_LOGIC_VECTOR (7 downto 0); --Dato para ser enviado por el PCI
signal rd_en : STD_LOGIC;
signal envia_dato: std_logic;
signal dato_enviado	: STD_LOGIC;

type TX_ESTADO is (
    INICIO,TX_DATO,WAIT_SEND
    );
signal ESTADO_TX          : TX_ESTADO;

COMPONENT TX_RS_232
generic(DIVIDE : integer := 7813);
	PORT(
		reset				: IN std_logic;
		clk				: IN std_logic;
		envia_dato		: IN std_logic;
		Byte_Tx			: IN std_logic_vector(7 downto 0);          
		dato_enviado	: OUT std_logic;
		TXD				: OUT std_logic
		);
end component;
signal TXD1	: std_logic;
COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;


	trig_in : IN STD_LOGIC;
	trig_in_ack : OUT STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;

begin

your_instance_name : Fifo_Rx_RS_232
  PORT MAP (
    clk     => clk,
    rst    => Reset,
    din     => Data_Rx,
    wr_en   => En_Rx,
    rd_en   => rd_en,
    dout    => DATA_TX1,
    full    => FIFO_FULL,
    empty   => FIFO_EMPTY
  );
  
--your_instance_name : FiFo128x8in_8out
--  PORT MAP (
--    rst		=> Reset,
--    wr_clk	=> clk0,
--    rd_clk	=> clk1,
--    din		=> Data_Rx(63 downto 56),
--    wr_en	=> En_Rx,--En_Rx_Pulso,
--    rd_en	=> rd_en,
--    dout		=> DATA_TX1,
--    full		=> FIFO_FULL,
--    empty	=> FIFO_EMPTY
--  );
--1302 = 38400
--5208 = 9600
Inst_TX_RS_232: TX_RS_232 
generic map (DIVIDE =>1302)
PORT MAP(
		reset				=> reset,
		clk				=> clk,
		envia_dato		=> envia_dato,
		Byte_Tx			=> DATA_TX1,
		dato_enviado	=> dato_enviado,
		TXD				=> TXD1
	);
TXD <= TXD1;
Tx_End <= dato_enviado;

TX_SINCRONO: process(Reset,Clk) is
begin
	if Reset = '1' then
		ESTADO_TX <= INICIO;
		envia_dato<= '0';
		rd_en     <= '0';
	elsif rising_edge(Clk) then
		case ESTADO_TX is
			when	INICIO =>
				if FIFO_EMPTY = '0' then
					ESTADO_TX	<= TX_DATO;
					envia_dato	<= '1';
					rd_en	<= '1';
				end if;
			when	TX_DATO =>
				ESTADO_TX	<=WAIT_SEND;
				rd_en	<= '0';
			when	WAIT_SEND =>
				envia_dato	<= '0';
				if dato_enviado ='1' then		
					ESTADO_TX	<= INICIO;
				end if;
			when others =>
				ESTADO_TX	<= INICIO;
		end case;
	end if;
end process;

busy <= not FIFO_EMPTY;




your_instancame : ila_0
PORT MAP (
	clk => clk,


	trig_in => envia_dato,
	trig_in_ack => open,
	probe0(0) => envia_dato, 
	probe1(0) => dato_enviado, 
	probe2(0) => En_Rx, 
	probe3(0) => rd_en, 
	probe4	  => Data_Rx, --8bits
	probe5 	  => DATA_TX1, 
	probe6(0) => FIFO_EMPTY, 
	probe7(0) => FIFO_EMPTY, 
	probe8(0) => TXD1,
	probe9(0) => FIFO_FULL
);

end Behavioral;

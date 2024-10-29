----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:50 04/23/2015 
-- Design Name: 
-- Module Name:    RX_RS_232  - Behavioral 
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

entity RECEPCION is
    Port ( reset			: in  STD_LOGIC;--Reset general
           clk				: in  STD_LOGIC;--reloj general
           ck_bauds		: in  STD_LOGIC;--frecuencia de baudaje
           RXD				: in  STD_LOGIC;--puerto de recepcion de bits
           Hab_Gen_Frec	: out STD_LOGIC;--habilitador para generar ck_bauds
			  dato_valido	: out  STD_LOGIC;--bandera indica que se recibio un byte (1 ciclo de clk)
			  Byte_Rx		: out  STD_LOGIC_VECTOR (7 downto 0)--byte recibido por la uart
           );
end RECEPCION;

architecture Behavioral of RECEPCION is

component FF_Sinc is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
signal RXD1: std_logic;

component DetectFlancosSincro is
    Port ( clk     :in STD_LOGIC;
	       Entrada : in  STD_LOGIC;
           PulsoB  : out  STD_LOGIC;
		   PulsoS  : out  STD_LOGIC);
end component;
signal pulso_RXD: std_logic;
signal pulso_ck_bauds: std_logic;

type Rx_UART is (inicio,rx_bit_inicio,rx_byte);
signal Rx_estado	: Rx_UART;
signal bitin		: integer range 0 to 7;
signal dato_valido1,pulso_dato_valido,dato_valido_aux: std_logic;
signal dato_rx1	: STD_LOGIC_VECTOR (7 downto 0);

--debug
COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;


	trig_in : IN STD_LOGIC;
	trig_in_ack : OUT STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT  ;
begin

--sincroniza la señal de entrada con el reloj interno
FFs: FF_Sinc
Port Map ( Clk  => Clk,
           D    => RXD,
           Q    => RXD1);


Detec_Flanco1: DetectFlancosSincro 
	PORT MAP(
		clk		=> Clk,
		Entrada	=> RXD1,
		PulsoB	=> pulso_RXD,
		PulsoS	=> open
	);

Detec_Flanco2: DetectFlancosSincro 
	PORT MAP(
		clk		=> Clk,
		Entrada	=> ck_bauds,
		PulsoB	=> open,
		PulsoS	=> pulso_ck_bauds
	);

Rx_datos:process(reset,clk) is
begin
	if reset = '1' then
		Rx_estado <= inicio;
		dato_rx1 <= x"70";-- (others => '0');
	elsif rising_edge(clk) then
			case Rx_estado is		
				when inicio =>
					dato_valido1 <= '0';
					bitin  <= 0;
					Hab_Gen_Frec <= '0';
					if pulso_RXD = '1' then --espera el bit de inicio
						Rx_estado <= rx_bit_inicio;
						Hab_Gen_Frec <= '1';
					end if;
					
				when rx_bit_inicio => 
					if pulso_ck_bauds = '1' then
						Rx_estado <= rx_byte;
					end if;
					
				when rx_byte =>
					if pulso_ck_bauds = '1' then	--se sincroniza con el flaco del reloj		
						dato_rx1(bitin)	<= RXD1;
						if bitin < 7 then		--incrementa el contador de bits hasta el 7
							bitin  <= bitin + 1;
						else
							dato_valido1 <= '1';
							Rx_estado <= inicio;
						end if;						
					end if;
					
				when others =>
				Rx_estado <= inicio;
			end case;
	end if;
end process;

process(Clk) is
begin
    if rising_edge(Clk) then
        if dato_valido1 <= '1' then
            Byte_Rx <= dato_rx1;
        end if;
        dato_valido <= dato_valido1;
    end if;
end process;

----debug
--your_instance_name : ila_0
--PORT MAP (
--	clk => clk,
--	trig_in => pulso_RXD,
--	trig_in_ack => open,
--	probe0(0) => RXD1, 
--	probe1(0) => pulso_RXD, 
--	probe2(0) => ck_bauds, 
--	probe3(0) => dato_valido1,
--	probe4 => dato_rx1
--);



end Behavioral;

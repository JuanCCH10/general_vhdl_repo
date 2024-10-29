----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2020 21:41:21
-- Design Name: 
-- Module Name: Ctrl_SPI - Behavioral
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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity Ctrl_SPI is
    generic(Nbits: integer:=24;--bits maximos a enviar
            NbitsC: integer:=6);--bits para contar los bist enviados
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           Clk_SPI  : in STD_LOGIC;--tren de pulsos
           En_Wr    : in STD_LOGIC;
           Limite   : in std_logic_vector(NbitsC-1 downto 0);
           Data_In  : in std_logic_vector(Nbits-1 downto 0);
           CS       : out STD_LOGIC;
           SCLK     : out STD_LOGIC;
           SDIN     : out STD_LOGIC;
           Tx_End   : out STD_LOGIC
           );
end Ctrl_SPI;

architecture Behavioral of Ctrl_SPI is

type Control_SPI is(Inicio,Start_Tx,Start_Wr,Wr_Dato,Wr_End);
signal SPI_estado : Control_SPI;
---------------------------------------------
component DetectFlancosSincro is
    Port ( clk     :in STD_LOGIC;
	       Entrada : in  STD_LOGIC;
           PulsoB  : out  STD_LOGIC;
		   PulsoS  : out  STD_LOGIC);
end component;
signal Clk_SPI_S: std_logic;
signal Clk_SPI_B: std_logic;

signal CS_Aux: std_logic;
signal Data_Wr:std_logic_vector(Nbits-1 downto 0);
signal Wr_Flag: std_logic;
signal Contador_bits: std_logic_vector(NbitsC-1 downto 0);
signal Lim_bits: integer;
begin

Detec_Flanco1: DetectFlancosSincro 
	PORT MAP(
		clk		=> Clk,
		Entrada	=> Clk_SPI,
		PulsoB	=> Clk_SPI_B,
		PulsoS	=> Clk_SPI_S
	);

Lim_bits <= conv_integer(Limite);
contrl_SPI: process(Reset,Clk) is
begin
	if Reset = '1' THEN
		SPI_estado    <= Inicio;
		CS_Aux        <= '1';
		Wr_Flag       <= '0';
		Data_Wr       <= (others => '0');
		Contador_bits <= (others => '0');
	elsif rising_edge(CLK) then
		
		case SPI_estado is
			when inicio =>
                if En_Wr = '1' then--espera pulso de subida del SCLK
                    SPI_estado  <= Start_Tx;
                end if;
            when Start_Tx =>
                if Clk_SPI_S='1' then--espera pulso de subida del SCLK
					SPI_estado  <= Start_Wr;
					CS_Aux      <= '0';--habilita el chip 
					Wr_Flag     <='1';---bandera que indica que esta escribiendo
				end if;
            when Start_Wr =>
                if Clk_SPI_B = '1' then
                    SPI_estado    <= Wr_Dato;
                    Data_Wr     <= Data_In;--guarda el dato que se mandara al display
                end if;
            when Wr_Dato =>
                if Clk_SPI_B = '1' then
                    Data_Wr <= Data_Wr(Nbits-2 downto 0) & '0';
                    Contador_bits <= Contador_bits + 1;
                end if;
                if Contador_bits = (Limite-1) and Clk_SPI_S = '1' then
                    SPI_estado    <= Wr_End;
                    Wr_Flag     <='0';
                end if;
                
            when Wr_End =>
                if Clk_SPI_B = '1' then
                    CS_Aux        <= '1';
                    SPI_estado    <= Inicio;
                    Contador_bits <=(others => '0');
                end if;
            when others =>
                SPI_estado    <= inicio;
        end case;
    end if;
end process;

CS <=  CS_Aux;
SDIN <= Data_Wr(Nbits-1);
SCLK <= Clk_SPI or not Wr_Flag;

Detec_Flanco2: DetectFlancosSincro 
	PORT MAP(
		clk		=> Clk,
		Entrada	=> CS_Aux,
		PulsoB	=> open,
		PulsoS	=> Tx_End
	);



end Behavioral;

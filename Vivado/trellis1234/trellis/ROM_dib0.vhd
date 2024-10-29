----------------------------------------------------------------------------------
-- Company: SEMAR
-- Engineer: TTE.FRAG.SIA.ELCO. GUILLERMO VICENCIO GUTIERREZ
--
-- Create Date:    12:27:30 01/03/2012
-- Design Name:   MEMORIA
-- Module Name:    RAM_PRF - Behavioral
-- Project Name:
-- Target Devices: XC4VSX35-10FF668
-- Tool versions: ISE 13.1
-- Description: ALMACENAR EN EL FPGA LOS DATOS CORRESPONDIENTES A LOS NIVELES
-- DE UNA SE�AL DE FERFIL DE RANGO, ESTA SE�AL FUE MUESTREADA CON EL OSCILOSCOPIO
-- DE UN RADAR BME
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

entity ROM_dib0 is
    generic(Addrbits: integer := 6;
			DataBits: integer := 8
				);
	 Port (
            Rst : in STD_LOGIC;
            Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end ROM_dib0;

architecture Behavioral of ROM_dib0 is

--direcciones entrelazador trellis para dibit 0
TYPE ROM_TYPE IS ARRAY (0 TO 2**Addrbits - 1) OF STD_LOGIC_VECTOR(DATA'range);
SIGNAL ROM : ROM_TYPE := (
x"00",
x"1A",
x"32",
x"4A",
x"02",
x"1C",
x"34",
x"4C",
x"04",
x"1E",
x"36",
x"4E",
x"06",
x"20",
x"38",
x"50",
x"08",
x"22",
x"3A",
x"52",
x"0A",
x"24",
x"3C",
x"54",
x"0C",
x"26",
x"3E",
x"56",
x"0E",
x"28",
x"40",
x"58",
x"10",
x"2A",
x"42",
x"5A",
x"12",
x"2C",
x"44",
x"5C",
x"14",
x"2E",
x"46",
x"5E",
x"16",
x"30",
x"48",
x"60",
x"18",
others => x"00"
);
begin

  process(Rst, clk)
   begin
    if Rst ='1' then
     Data <= (others => '0');
  	elsif rising_edge(clk)  then
  		if Rd = '1' then
  			Data <= ROM(conv_integer(addr));  -- First register
  		end if;
  	end if;
  end process;
  end Behavioral;

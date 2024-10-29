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

entity ROM_dib1 is
    generic(Addrbits: integer := 6;
			DataBits: integer := 8
				);
	 Port ( Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end ROM_dib1;

architecture Behavioral of ROM_dib1 is

--direcciones entrelazador trellis
TYPE ROM_TYPE IS ARRAY (0 TO 2**Addrbits - 1) OF STD_LOGIC_VECTOR(DATA'range);
SIGNAL ROM: ROM_TYPE := (
x"01",
x"1B",
x"33",
x"4B",
x"03",
x"1D",
x"35",
x"4D",
x"05",
x"1F",
x"37",
x"4F",
x"07",
x"21",
x"39",
x"51",
x"09",
x"23",
x"3B",
x"53",
x"0B",
x"25",
x"3D",
x"55",
x"0D",
x"27",
x"3F",
x"57",
x"0F",
x"29",
x"41",
x"59",
x"11",
x"2B",
x"43",
x"5B",
x"13",
x"2D",
x"45",
x"5D",
x"15",
x"2F",
x"47",
x"5F",
x"17",
x"31",
x"49",
x"61",
x"19",
others => x"00"
);
begin

process(clk)  begin
	if rising_edge(clk)  then
		if Rd = '1' then
			Data <= ROM(conv_integer(addr));  -- First register
		end if;
	end if;
end process;
end Behavioral;

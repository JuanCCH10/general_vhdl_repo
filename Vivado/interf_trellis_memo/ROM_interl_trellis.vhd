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

entity ROM_interl_trellis is
    generic(Addrbits: integer := 7;
			DataBits: integer := 8
				);
	 Port ( Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end ROM_interl_trellis;

architecture Behavioral of ROM_interl_trellis is

--direcciones entrelazador trellis
TYPE ROM_TYPE IS ARRAY (0 TO 2**Addrbits - 1) OF STD_LOGIC_VECTOR(DATA'range);
SIGNAL ROM: ROM_TYPE := (
x"00",
x"01",
x"08",
x"09",
x"10",
x"11",
x"18",
x"19",
x"20",
x"21",
x"28",
x"29",
x"30",
x"31",
x"38",
x"39",
x"40",
x"41",
x"48",
x"49",
x"50",
x"51",
x"58",
x"59",
x"60",
x"61",
x"02",
x"03",
x"0A",
x"0B",
x"12",
x"13",
x"1A",
x"1B",
x"22",
x"23",
x"2A",
x"2B",
x"32",
x"33",
x"3A",
x"3B",
x"42",
x"43",
x"4A",
x"4B",
x"52",
x"53",
x"5A",
x"5B",
x"04",
x"05",
x"0C",
x"0D",
x"14",
x"15",
x"1C",
x"1D",
x"24",
x"25",
x"2C",
x"2D",
x"34",
x"35",
x"3C",
x"3D",
x"44",
x"45",
x"4C",
x"4D",
x"54",
x"55",
x"5C",
x"5D",
x"06",
x"07",
x"0E",
x"0F",
x"16",
x"17",
x"1E",
x"1F",
x"26",
x"27",
x"2E",
x"2F",
x"36",
x"37",
x"3E",
x"3F",
x"46",
x"47",
x"4E",
x"4F",
x"56",
x"57",
x"5E",
x"5F",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
others => x"00"
);
begin

process(clk)  begin
	if rising_edge(clk)  then
		if Rd = '1' then
			Data <= rom(conv_integer(addr));  -- First register
		end if;
	end if;
end process;
end Behavioral;

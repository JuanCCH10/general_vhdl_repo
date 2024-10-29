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
-- DE UNA SEÑAL DE FERFIL DE RANGO, ESTA SEÑAL FUE MUESTREADA CON EL OSCILOSCOPIO
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

entity ROM_alfa_inv is
    generic(Addrbits		: integer;
			DataBits		: integer
				);
	 Port (	Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end ROM_alfa_inv;

architecture Behavioral of ROM_alfa_inv is

--ROM PARA GUARDAR LOS comandos para el display oled
TYPE ROM_TYPE IS ARRAY (0 TO 2**Addrbits - 1) OF STD_LOGIC_VECTOR(DATA'range);
SIGNAL ROM: ROM_TYPE := (
--0=>"00000",
--1=>"00001",
--2=>"10010",
--3=>"11100",
--4=>"01001",
--5=>"10111",
--6=>"01110",
--7=>"01100",
--8=>"10110",
--9=>"00100",
--10=>"11001",
--11=>"10000",
--12=>"00111",
--13=>"01111",
--14=>"00110",
--15=>"01101",
--16=>"01011",
--17=>"11000",
--18=>"00010",
--19=>"11101",
--20=>"11110",
--21=>"11010",
--22=>"01000",
--23=>"00101",
--24=>"10001",
--25=>"01010",
--26=>"10101",
--27=>"11111",
--28=>"00011",
--29=>"10011",
--30=>"10100",
--31=>"00001"

0  =>"000000",
1  =>"000001",
2  =>"100001",
3  =>"111110",
4  =>"110001",
5  =>"101011",
6  =>"011111",
7  =>"101100",
8  =>"111001",
9  =>"100101",
10 =>"110100",
11 =>"011100",
12 =>"101110",
13 =>"101000",
14 =>"010110",
15 =>"011001",
16 =>"111101",
17 =>"110110",
18 =>"110011",
19 =>"100111",
20 =>"011010",
21 =>"100011",
22 =>"001110",
23 =>"011000",
24 =>"010111",
25 =>"001111",
26 =>"010100",
27 =>"100010",
28 =>"001011",
29 =>"110101",
30 =>"101101",
31 =>"000110",
32 =>"111111",
33 =>"000010",
34 =>"011011",
35 =>"010101",
36 =>"111000",
37 =>"001001",
38 =>"110010",
39 =>"010011",
40 =>"001101",
41 =>"101111",
42 =>"110000",
43 =>"110111",
44 =>"000111",
45 =>"011110",
46 =>"001100",
47 =>"101001",
48 =>"101010",
49 =>"000100",
50 =>"100110",
51 =>"010010",
52 =>"001010",
53 =>"011101",
54 =>"010001",
55 =>"111100",
56 =>"100100",
57 =>"001000",
58 =>"111011",
59 =>"111010",
60 =>"110111",
61 =>"010000",
62 =>"000011",
63 =>"100000"
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


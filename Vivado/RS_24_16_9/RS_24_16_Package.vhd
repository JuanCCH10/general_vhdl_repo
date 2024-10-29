--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--37  3D  25  30  2F  14  06  16

package RS_24_16_Package is
Type Array1 is array (0 to 63) of std_logic_Vector(7 downto 0);
constant gf_37:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"37",x"2D",x"1A",x"19",x"2E",x"34",x"03",x"32",x"05",x"1F",x"28",x"2B",x"1C",x"06",x"31",--16
x"27",x"10",x"0A",x"3D",x"3E",x"09",x"13",x"24",x"15",x"22",x"38",x"0F",x"0C",x"3B",x"21",x"16",--32
x"0D",x"3A",x"20",x"17",x"14",x"23",x"39",x"0E",x"3F",x"08",x"12",x"25",x"26",x"11",x"0B",x"3C",--48
x"2A",x"1D",x"07",x"30",x"33",x"04",x"1E",x"29",x"18",x"2F",x"35",x"02",x"01",x"36",x"2C",x"1B");--64
constant gf_3D:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"3D",x"39",x"04",x"31",x"0C",x"08",x"35",x"21",x"1C",x"18",x"25",x"10",x"2D",x"29",x"14",
x"01",x"3C",x"38",x"05",x"30",x"0D",x"09",x"34",x"20",x"1D",x"19",x"24",x"11",x"2C",x"28",x"15",
x"02",x"3F",x"3B",x"06",x"33",x"0E",x"0A",x"37",x"23",x"1E",x"1A",x"27",x"12",x"2F",x"2B",x"16",
x"03",x"3E",x"3A",x"07",x"32",x"0F",x"0B",x"36",x"22",x"1F",x"1B",x"26",x"13",x"2E",x"2A",x"17");
constant gf_25:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"25",x"09",x"2C",x"12",x"37",x"1B",x"3E",x"24",x"01",x"2D",x"08",x"36",x"13",x"3F",x"1A",
x"0B",x"2E",x"02",x"27",x"19",x"3C",x"10",x"35",x"2F",x"0A",x"26",x"03",x"3D",x"18",x"34",x"11",
x"16",x"33",x"1F",x"3A",x"04",x"21",x"0D",x"28",x"32",x"17",x"3B",x"1E",x"20",x"05",x"29",x"0C",
x"1D",x"38",x"14",x"31",x"0F",x"2A",x"06",x"23",x"39",x"1C",x"30",x"15",x"2B",x"0E",x"22",x"07");
constant gf_30:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"30",x"23",x"13",x"05",x"35",x"26",x"16",x"0A",x"3A",x"29",x"19",x"0F",x"3F",x"2C",x"1C",
x"14",x"24",x"37",x"07",x"11",x"21",x"32",x"02",x"1E",x"2E",x"3D",x"0D",x"1B",x"2B",x"38",x"08",
x"28",x"18",x"0B",x"3B",x"2D",x"1D",x"0E",x"3E",x"22",x"12",x"01",x"31",x"27",x"17",x"04",x"34",
x"3C",x"0C",x"1F",x"2F",x"39",x"09",x"1A",x"2A",x"36",x"06",x"15",x"25",x"33",x"03",x"10",x"20");
constant gf_2F:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"2F",x"1D",x"32",x"3A",x"15",x"27",x"08",x"37",x"18",x"2A",x"05",x"0D",x"22",x"10",x"3F",
x"2D",x"02",x"30",x"1F",x"17",x"38",x"0A",x"25",x"1A",x"35",x"07",x"28",x"20",x"0F",x"3D",x"12",
x"19",x"36",x"04",x"2B",x"23",x"0C",x"3E",x"11",x"2E",x"01",x"33",x"1C",x"14",x"3B",x"09",x"26",
x"34",x"1B",x"29",x"06",x"0E",x"21",x"13",x"3C",x"03",x"2C",x"1E",x"31",x"39",x"16",x"24",x"0B");
constant gf_14:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"14",x"28",x"3C",x"13",x"07",x"3B",x"2F",x"26",x"32",x"0E",x"1A",x"35",x"21",x"1D",x"09",
x"0F",x"1B",x"27",x"33",x"1C",x"08",x"34",x"20",x"29",x"3D",x"01",x"15",x"3A",x"2E",x"12",x"06",
x"1E",x"0A",x"36",x"22",x"0D",x"19",x"25",x"31",x"38",x"2C",x"10",x"04",x"2B",x"3F",x"03",x"17",
x"11",x"05",x"39",x"2D",x"02",x"16",x"2A",x"3E",x"37",x"23",x"1F",x"0B",x"24",x"30",x"0C",x"18");
constant gf_06:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"06",x"0C",x"0A",x"18",x"1E",x"14",x"12",x"30",x"36",x"3C",x"3A",x"28",x"2E",x"24",x"22",
x"23",x"25",x"2F",x"29",x"3B",x"3D",x"37",x"31",x"13",x"15",x"1F",x"19",x"0B",x"0D",x"07",x"01",
x"05",x"03",x"09",x"0F",x"1D",x"1B",x"11",x"17",x"35",x"33",x"39",x"3F",x"2D",x"2B",x"21",x"27",
x"26",x"20",x"2A",x"2C",x"3E",x"38",x"32",x"34",x"16",x"10",x"1A",x"1C",x"0E",x"08",x"02",x"04");
constant gf_16:Array1:=(
--0     1     2     3     4     5     6     7     8     9     a     b     c     d     e     f
x"00",x"16",x"2C",x"3A",x"1B",x"0D",x"37",x"21",x"36",x"20",x"1A",x"0C",x"2D",x"3B",x"01",x"17",
x"2F",x"39",x"03",x"15",x"34",x"22",x"18",x"0E",x"19",x"0F",x"35",x"23",x"02",x"14",x"2E",x"38",
x"1D",x"0B",x"31",x"27",x"06",x"10",x"2A",x"3C",x"2B",x"3D",x"07",x"11",x"30",x"26",x"1C",x"0A",
x"32",x"24",x"1E",x"08",x"29",x"3F",x"05",x"13",x"04",x"12",x"28",x"3E",x"1F",x"09",x"33",x"25");

end RS_24_16_Package;

package body RS_24_16_Package is

end RS_24_16_Package;
 
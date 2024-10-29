----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2023 11:24:45
-- Design Name: 
-- Module Name: Dual_Port_DRAM - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Dual_Port_DRAM is
generic(Nbits_addr : integer := 4;
		Nbits_data : integer := 5);
		
Port ( CLK   : in STD_LOGIC;
	   WE    : in STD_LOGIC;
	   ADDRA : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DIA   : in STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       DOA   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       ADDRB : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DOB   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0));
end Dual_Port_DRAM;

architecture Behavioral of Dual_Port_DRAM is

type MEM_TYPE is array((2**ADDRA'length) - 1 downto 0) of std_logic_vector(DIA'range);
shared variable MEM : MEM_TYPE:=(
	0 => "00000",--0
    1 => "10100",--7
    2 => "11101",--14
    3 => "01001",--29
    4 => "10110",--28
    5 => "00000",--0
    6 => "01011",--27
    7 => "10111",--26
    8 => "11001",--25
    others=>"00000");

begin
process(CLK) begin
	if rising_edge(CLK) then
		if WE = '1' then
			MEM(conv_integer(ADDRA)) := DIA;
		end if;
	end if;
	end process;
DOA <= MEM(conv_integer(ADDRA));
DOB <= MEM(conv_integer(ADDRB));


-----
--component Dual_Port_DRAM is
--generic(Nbits_addr : integer := 4;
--		Nbits_data : integer := 5);
		
--Port ( CLK   : in STD_LOGIC;
--	   WE    : in STD_LOGIC;
--	   ADDRA : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
--       DIA   : in STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
--       DOA   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
--       ADDRB : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
--       DOB   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0));
--end component;

--DPDR:Dual_Port_DRAM 
--generic map(Nbits_addr => Nbits_addr,
--		Nbits_data => Nbits_data)
		
--Port map ( CLK   => Clk,
--	   WE    => WE,
--	   ADDRA => ADDRA,
--       DIA   => DIA,
--       DOA   => DOA,
--       ADDRB => ADDRB,
--       DOB   => DOB);
       
end Behavioral;

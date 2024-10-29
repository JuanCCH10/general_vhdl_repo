----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 12:47:22
-- Design Name: 
-- Module Name: BMA_Tb - Behavioral
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


entity BMA_Tb is
--  Port ( );
end BMA_Tb;

architecture Behavioral of BMA_Tb is
Component BMA is
    Port (	Reset	: in STD_LOGIC;
			Clk		: in STD_LOGIC;
			En		: in STD_LOGIC;
			SK		: in STD_LOGIC_VECTOR(4 downto 0);--sindrome
			SKi		: in STD_LOGIC_VECTOR(4 downto 0);--sindrome i
			Addr_SK	: out STD_LOGIC_VECTOR(3 downto 0);--adress sindrome
			Addr_SKi: out STD_LOGIC_VECTOR(3 downto 0);--addres sindrome i
			Fin		: out STD_LOGIC);  
end Component;
Signal Reset    : std_logic;
Signal Clk		: std_logic;
Signal En		: std_logic;
Signal SK	    : std_logic_vector(4 downto 0);
Signal SKi		: std_logic_vector(4 downto 0);
Signal Addr_SK  : std_logic_vector(3 downto 0);
Signal Addr_SKi : std_logic_vector(3 downto 0);
Signal Fin		: std_logic;
constant clk_periodo: time := 10 ns;



component Dual_Port_DRAM is
generic(Nbits_addr : integer := 4;
		Nbits_data : integer := 5);
		
Port ( CLK   : in STD_LOGIC;
	   WE    : in STD_LOGIC;
	   ADDRA : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DIA   : in STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       DOA   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0);
       ADDRB : in STD_LOGIC_VECTOR (Nbits_addr-1 downto 0);
       DOB   : out STD_LOGIC_VECTOR (Nbits_data-1 downto 0));
end component;
signal DIA: STD_LOGIC_VECTOR (4 downto 0);

begin

process
begin
    Clk <= '1';
    wait for clk_periodo/2;
    Clk <= '0';
    wait for clk_periodo/2;
end process;

process
begin
    Reset <= '1';
    wait for 100 ns;
    Reset <= '0';
    wait for 84 ms;
--     Reset <= '1';
    wait for 100 ns;
    Reset <= '0';
    wait;-- for clk_periodo*2;
end process;

DIA <= "00000";
DPDR:Dual_Port_DRAM 
generic map(Nbits_addr => 4,
		Nbits_data => 5)		
Port map ( CLK   => Clk,
	   WE    => '0',
	   ADDRA => Addr_SK,
       DIA   => DIA,
       DOA   => SK,
       ADDRB => Addr_SKi,
       DOB   => SKi);
       
Test: BMA
Port map 
(	
	Reset	=>Reset,
	Clk		=>Clk,
	En		=>En,
	SK		=>Sk,
	SKi		=>SKi,
	Addr_SK	=>Addr_SK,
	Addr_SKi=>Addr_SKi,
	Fin		=>Fin
	); 

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2021 14:41:56
-- Design Name: 
-- Module Name: Gen_Simbol - Behavioral
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

entity Gen_Simbol is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           PTT : in STD_LOGIC;
           Simbol : out STD_LOGIC_VECTOR (1 downto 0));
end Gen_Simbol;

architecture Behavioral of Gen_Simbol is
component Contador_Lim_En_C is
    Generic(Nbits: integer:=26;
    		Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC );
end Component;
signal sample,sample_P : STD_LOGIC;

component Contador is
    Generic(Nbits: integer:=26);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
           );
end component;
signal Addr:STD_LOGIC_VECTOR(15 downto 0);

component DetectFlancosSincro is
    Port ( clk     :in STD_LOGIC;
	       Entrada : in  STD_LOGIC;
           PulsoB  : out  STD_LOGIC;
		   PulsoS  : out  STD_LOGIC);
end component;

component ROM_Simbolos_Tono is
    generic(Addrbits: integer := 14;
			DataBits: integer := 12
				);
	 Port ( Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end component;
signal rst: std_logic;
---------------------------------------
component ROM_Simbolos_dam_r41 is
    generic(Addrbits		: integer := 6;
				DataBits		: integer := 8
				);
	 Port ( Clk : in  STD_LOGIC;
			  Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
           Rd	: in  STD_LOGIC;
			  Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end component;

begin
Dir:Contador_Lim_En_C
Generic Map(Nbits	=> 15,
    		Limite	=> 10416)
Port Map ( Reset    => Reset,
           Clk      => Clk,
           En       => '1',
           Dout     => open,
           En_Out   => Sample);
           
Detec2: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Sample,
            PulsoB  => open,
            PulsoS  => Sample_P);
rst<= Reset or (not PTT);
Addr_Simbolos: Contador 
Generic Map(Nbits => 16)
Port Map ( Reset=> rst,
           Clk  => Clk,
           En   => Sample_P,---cada
           Dout => Addr);
           
--Voz:ROM_Simbolos_Tono 
--generic Map(Addrbits=> 14,
--			DataBits=> 2)
--Port Map ( Clk => Clk,
--			Addr=> Addr,
--			Rd   => '1',
--			Data => simbol);            
            
Voz_dam:ROM_Simbolos_dam_r41 
generic Map(Addrbits=> 16,
			DataBits=> 2)
Port Map ( Clk => Clk,
			Addr=> Addr,
			Rd   => '1',
			Data => simbol); 
			            
end Behavioral;

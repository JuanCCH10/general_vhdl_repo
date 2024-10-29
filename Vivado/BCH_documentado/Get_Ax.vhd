----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 12:07:55
-- Design Name: 
-- Module Name: Get_Ax - Behavioral
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
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.Modulos_Genericos_Pkg.all;
Use work.Pack_Array.all;

entity Get_Ax is
	Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           En		: in STD_LOGIC;
           d		: in STD_LOGIC_VECTOR(4 downto 0);
           dm		: in STD_LOGIC_VECTOR(4 downto 0);
           Ax		: in Array_Ax;
           Bx		: in Array_Ax;
           j		: in STD_LOGIC_VECTOR(3 downto 0);
           Ax_out	: out Array_Ax;
           Ax_valid	: out STD_LOGIC
           );
end Get_Ax;

architecture Behavioral of Get_Ax is

component ROM_alfa_inv is
    generic(Addrbits		: integer := 10;
			DataBits		: integer := 5
				);
	 Port (	Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end component;
signal dm_1: STD_LOGIC_VECTOR(4 downto 0);
signal Addr_Mult: STD_LOGIC_VECTOR(9 downto 0);
signal d_x_dm_1: STD_LOGIC_VECTOR(4 downto 0);


component ROM_Mult_alfa is
    generic(Addrbits		: integer := 10;
			DataBits		: integer := 5
				);
	 Port (	Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end component;

--signal d_x_dm_1_x_Bx:Array_Ax;
--signal d_x_dm_1_x_Bx1:Array_Ax;

signal Addr_Mult1: STD_LOGIC_VECTOR(9 downto 0);
signal Indice: STD_LOGIC_VECTOR(3 downto 0);
signal Indice_r1: STD_LOGIC_VECTOR(3 downto 0);
signal d_x_dm_1_x_Bxi: STD_LOGIC_VECTOR(4 downto 0);
signal Bx_En,Bx_En_r1: std_logic;
signal Reset1: std_logic;


type Array_Ax1 is array (0 to 7) of std_logic_vector(4 downto 0);
signal d_x_dm_1_x_Bx_x_xj: Array_Ax1;

begin

Rom_Alfa_1:ROM_alfa_inv 
    generic map(Addrbits	=> 5,
				DataBits		=> 5)
	 Port map (	Clk => Clk,
				Addr=> dm,
				Rd	=> '1',
				Data=> dm_1);
Addr_Mult <= d & dm_1;	
			
Rom_Alfa_M:ROM_Mult_alfa 
    generic map(Addrbits	=> 10,
				DataBits		=> 5)
	 Port map (	Clk => Clk,
				Addr=> Addr_Mult,
				Rd	=> '1',
				Data=> d_x_dm_1);

FF01: FF_Add_n
generic map(nFF   => 2,
            nbits=> 1)
Port map(  Clk  => Clk, 
           D(0) => Reset,    
           Q(0) => Reset1);

Reset_Ret:Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset1,
            Clk      => Clk,
           	En       => '1',
           	DIN      => "0100",
           	Dout     => Indice,
           	En_Out   => Bx_En);

				
Addr_Mult1 <=  d_x_dm_1 & Bx(conv_integer(Indice));
Rom_Alfa_M1:ROM_Mult_alfa 
    generic map(Addrbits	=> 10,
				DataBits		=> 5)
	 Port map (	Clk => Clk,
				Addr=> Addr_Mult1,
				Rd	=> '1',
				Data=> d_x_dm_1_x_Bxi);
										
process(clk) is
begin
	if rising_edge(clk) then
		Indice_r1 <= Indice;
		Bx_En_r1 <= Bx_En and (not Reset1);
--		if Bx_En_r1 = '1' then
--			d_x_dm_1_x_Bx(conv_integer(Indice_r1+j)) <= d_x_dm_1_x_Bxi;
----			d_x_dm_1_x_Bx1(conv_integer(Indice_r1 + j)) <= d_x_dm_1_x_Bxi;
--		end if;
	end if;
end process;

process(Reset,clk) is
begin
	if Reset = '1' then
		d_x_dm_1_x_Bx_x_xj <= (others => "00000");
	elsif rising_edge(clk) then
		if Bx_En_r1 = '1' then
			d_x_dm_1_x_Bx_x_xj(conv_integer(Indice_r1 + j)) <= d_x_dm_1_x_Bxi;
		end if;
	end if;
end process;

Ax_out(0) <= d_x_dm_1_x_Bx_x_xj(0) xor Ax(0);
Ax_out(1) <= d_x_dm_1_x_Bx_x_xj(1) xor Ax(1);
Ax_out(2) <= d_x_dm_1_x_Bx_x_xj(2) xor Ax(2);
Ax_out(3) <= d_x_dm_1_x_Bx_x_xj(3) xor Ax(3);
Ax_out(4) <= d_x_dm_1_x_Bx_x_xj(4) xor Ax(4);

Detec2: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Bx_En_r1,
            PulsoB  => Ax_valid,--pulso para inicio de configuracion
            PulsoS  => open);
            
end Behavioral;

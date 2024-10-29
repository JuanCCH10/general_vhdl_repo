----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2023 11:35:35
-- Design Name: 
-- Module Name: BMA - Behavioral
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

Use work.Pack_Array.all;
use work.Modulos_Genericos_Pkg.all;

entity BMA is
    Port (	Reset	: in STD_LOGIC;
			Clk		: in STD_LOGIC;
			En		: in STD_LOGIC;
			SK		: in STD_LOGIC_VECTOR(4 downto 0);--sindrome
			SKi		: in STD_LOGIC_VECTOR(4 downto 0);--sindrome i
			Addr_SK	: out STD_LOGIC_VECTOR(3 downto 0);--adress sindrome
			Addr_SKi: out STD_LOGIC_VECTOR(3 downto 0);--addres sindrome i
			Fin		: out STD_LOGIC);  
end BMA;

architecture Behavioral of BMA is
component Get_d is
    Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           En		: in STD_LOGIC;
           L		: in STD_LOGIC_VECTOR(3 downto 0);
           K		: in STD_LOGIC_VECTOR(3 downto 0);
           SK		: in STD_LOGIC_VECTOR(4 downto 0);
           SKi		: in STD_LOGIC_VECTOR(4 downto 0);
           Ai		: in Array_Ax;
           Addr_SK	: out STD_LOGIC_VECTOR(3 downto 0);
           Addr_SKi	: out STD_LOGIC_VECTOR(3 downto 0);
           d		: out STD_LOGIC_VECTOR(4 downto 0);
           d_valid	: out STD_LOGIC
           );
end component;
signal d	: STD_LOGIC_VECTOR(4 downto 0);
signal dm	: STD_LOGIC_VECTOR(4 downto 0);
signal Rst_d_int:std_logic;
signal Rst_d:std_logic;

signal En_K,Fin_d,Fin_d_PB,Fin_Ax: std_logic;
signal K	: STD_LOGIC_VECTOR(3 downto 0);
signal L	: STD_LOGIC_VECTOR(3 downto 0);
signal Fin_K:std_logic;
signal L2	: STD_LOGIC_VECTOR(3 downto 0);
signal Ax,Ax_Out	: Array_Ax;
signal Bx,tx	: Array_Ax;
signal L2_mayor_k: std_logic;
signal j	: STD_LOGIC_VECTOR(3 downto 0);
signal Rst_Ax: std_logic;
signal Rst_Ax_int: std_logic;
component Get_Ax is
	Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           En		: in STD_LOGIC;
           d		: in STD_LOGIC_VECTOR(4 downto 0);
           dm		: in STD_LOGIC_VECTOR(4 downto 0);
           Ax		: in Array_Ax;
           Bx		: in Array_Ax;
           Ax_out	: out Array_Ax;
           j		: in STD_LOGIC_VECTOR(3 downto 0);
           Ax_valid	: out STD_LOGIC
           );
end component;
signal d_igual_0,Rst_j,Reset_j,En_j:std_logic;
signal d_igual_0_no:std_logic;

begin

Conta_K:Contador_Lim_In_Asc_Ini
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => En_K,--Fin_d_PB,
           	Ini		 =>"0001",
           	DIN      => "1000",
           	Dout     => K,
           	En_Out   => Fin_K);

process(Reset,clk) is
begin
	if Reset = '1' then
		L <= (others => '0');
	elsif rising_edge(clk) then
		if Rst_j = '1' then
			L <= K-L;
		end if;
	end if;
end process;

L2 <= L(2 downto 0) & '0';
L2_mayor_k <= '0' when L2 >= K else '1';

d_igual_0 <= '1' when d = "00000" else '0';
Rst_j <= L2_mayor_k and Fin_Ax;
Reset_j <= Reset or Rst_j;
En_j <= (d_igual_0 and  Fin_d_PB) or ((not L2_mayor_k) and Fin_Ax);

Conta_j:Contador_Lim_In_Asc_Ini
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset_j,
            Clk      => Clk,
           	En       => En_j,--Fin_d_PB,
           	Ini		 =>"0001",
           	DIN      => "1000",
           	Dout     => j,
           	En_Out   => open);


process(Reset,clk) is
begin
	if Reset = '1' then
		Ax(0) <= "00001";
		Ax(1 to 4) <= (others => "00000");
		Bx(0) <= "00001";
		Bx( 1 to 4) <= (others => "00000");
		tx(0) <= "00001";
		tx(1 to 4) <= (others => "00000");
	elsif rising_edge(clk) then
		if Fin_Ax = '1' then
			Ax <= Ax_out;
		end if;
		
		if L2_mayor_k = '1' and Fin_Ax = '1' then
			Bx <= tx;
		end if;
		
		if L2_mayor_k = '1' and d_igual_0_no = '1' then
			tx <= Ax;
		end if;
	end if;
end process;

Rst_d_int<= Reset or En_K;--Fin_Ax;
Get_d_Inst: Get_d 
   Port Map ( Reset	   => Rst_d_int,
           Clk		   => Clk,		
           En		   => '1',	 
           L		   => L,	  
           K		   => K,	  
           SK		   => SK,		 
           SKi		   => SKi,		
           Ai		   => Ax,	 
           Addr_SK	   => Addr_SK,
           Addr_SKi	   => Addr_SKi,
           d		   => d,
           d_valid	   => Fin_d);


Detec0: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Fin_d,
            PulsoB  => Fin_d_PB,--pulso para inicio de configuracion
            PulsoS  => open);
                       
En_K <=  (Fin_d_PB and  d_igual_0) or Fin_Ax;          


process(Reset,clk) is
begin
	if Reset = '1' then
		Rst_Ax <= '1';
		dm <= "00001";

	elsif rising_edge(clk) then
		if Fin_d_PB = '1' then
			Rst_Ax <= '0';
			
		end if;
		if Fin_Ax = '1' then
			dm <= d;
		end if;
		
	end if;
end process;
d_igual_0_no <= (Fin_d_PB and (not d_igual_0));
Rst_Ax_int<= d_igual_0_no or Rst_Ax;           	
GetAx_Inst:Get_Ax 
Port map ( Reset	=> Rst_Ax_int,   
           Clk		=> Clk, 
           En		=> En,  
           d		=> d, 
           dm		=> dm,  
           Ax		=> Ax,  
           Bx		=> Bx,  
           j		=> j,  
           Ax_out	=> Ax_out, 
           Ax_valid	=> Fin_Ax);


Detec1: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Fin_K,
            PulsoB  => Fin,--pulso para inicio de configuracion
            PulsoS  => open);

          
end Behavioral;

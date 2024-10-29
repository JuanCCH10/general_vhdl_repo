----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2023 13:17:30
-- Design Name: 
-- Module Name: Test_Get_Ax - Behavioral
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

entity Test_Get_Ax is
    Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           En		: in STD_LOGIC;
           Fin		: out STD_LOGIC
           );
end Test_Get_Ax;

architecture Behavioral of Test_Get_Ax is
TYPE Array_Type1 IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(3 downto 0);
SIGNAL L_array: Array_Type1:=(
"0000",--0
"0000",--1
"0001",--2
"0001",--3
"0010",--4
"0010",--5
"0011",--6
"0011",--7
"0100",--8
"0000",
others=>"0000");

TYPE Array_Type2 IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(4 downto 0);
SIGNAL d_array: Array_Type2:=(
----------K
"00000",--0
"10100",--1
"00000",--2
"10001",--3
"00000",--4
"10010",--5
"00000",--6
"00001",--7
"00000",--8
"00000",
others=>"00000");

SIGNAL dm_array: Array_Type2:=(
----------K
"00000",--0
"00001",--1
"10100",--2
"10100",--3
"10001",--4
"10001",--5
"10010",--6
"10010",--7
"00001",--8
"00000",
others=>"00000");



--TYPE Array_Type IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(3 downto 0);
SIGNAL j_array: Array_Type1:=(
--------K
"0000",--0
"0001",--1
"0001",--2
"0010",--3
"0001",--4
"0010",--5
"0001",--6
"0010",--7
"0001",--8
"0000",
others=>"0000");

TYPE Array_Type4 IS ARRAY (7 downto 0) OF STD_LOGIC_VECTOR(4 downto 0);
TYPE Array_Type5 IS ARRAY (0 TO 15) OF Array_Type4;
SIGNAL Bx_array: Array_Type5:=(
--7 		6		5			4		3		2		1			0
("00000","00000","00000","00000","00000","00000","00000","00001"),--0
("00000","00000","00000","00000","00000","00000","00000","00001"),--1
("00000","00000","00000","00000","00000","00000","00000","00001"),--2
("00000","00000","00000","00000","00000","00000","00000","00001"),--3
("00000","00000","00000","00000","00000","00000","00000","00001"),--4
("00000","00000","00000","00000","00000","00000","10100","00001"),--5
("00000","00000","00000","00000","00000","00000","10100","00001"),--6
("00000","00000","00000","00000","00000","01000","10100","00001"),--7
("00000","00000","00000","00000","00000","01000","10100","00001"),--8
("00000","00000","00000","10000","00110","00110","10100","00001"),--9
("00000","00000","00000","00000","00000","00000","00000","00001"),--10
("00000","00000","00000","00000","00000","00000","00000","00001"),--11
("00000","00000","00000","00000","00000","00000","00000","00001"),--12
("00000","00000","00000","00000","00000","00000","00000","00001"),--13
("00000","00000","00000","00000","00000","00000","00000","00001"),--14
--("00000","00000","00000","00000","00000","00000","00000","00001"),--13
("00000","00000","00000","00000","00000","00000","00000","00001"));--15

SIGNAL Ax_array: Array_Type5:=(
--7 		6		5			4		3		2		1			0
("00000","00000","00000","00000","00000","00000","00000","00001"),--0
("00000","00000","00000","00000","00000","00000","00000","00001"),--0
("00000","00000","00000","00000","00000","00000","10100","00001"),--1
("00000","00000","00000","00000","00000","00000","10100","00001"),--2
("00000","00000","00000","00000","00000","01000","10100","00001"),--3
("00000","00000","00000","00000","00000","01000","10100","00001"),--4
("00000","00000","00000","00000","01011","00100","10100","00001"),--5
("00000","00000","00000","00000","01011","00100","10100","00001"),--6
("00000","00000","00000","10000","00110","00110","10100","00001"),--7
("00000","00000","00000","10000","00110","00110","10100","00001"),--8
("00000","00000","00000","00000","00000","00000","00000","00001"),--9
("00000","00000","00000","00000","00000","00000","00000","00001"),--10
("00000","00000","00000","00000","00000","00000","00000","00001"),--11
("00000","00000","00000","00000","00000","00000","00000","00001"),--12
("00000","00000","00000","00000","00000","00000","00000","00001"),--13
--("00000","00000","00000","00000","00000","00000","00000","00001"),--13
("00000","00000","00000","00000","00000","00000","00000","00001"));--15

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
signal d		: STD_LOGIC_VECTOR(4 downto 0);      
signal dm		: STD_LOGIC_VECTOR(4 downto 0);
signal Ax		: Array_Ax;                         
signal Bx		: Array_Ax;                         
signal j		: STD_LOGIC_VECTOR(3 downto 0);      
signal Ax_out	: Array_Ax;
signal Ax_valid	: STD_LOGIC;                   


signal Ax_valid_PB	: STD_LOGIC;
signal Rst_Get_Ax_r1	: STD_LOGIC;
signal Rst_Ax	: STD_LOGIC;
signal K		: STD_LOGIC_VECTOR(3 downto 0);  
signal L		: STD_LOGIC_VECTOR(3 downto 0);  
signal Fin_K	: STD_LOGIC;
signal Rst_int	: STD_LOGIC;


begin

Teset_Int:Contador_Lim_In_Asc_Ini
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => Rst_Ax,--Fin_d_PB,
           	Ini		 =>"0001",
           	DIN      => "1000",
           	Dout     => K,
           	En_Out   => Fin_K);

L <= L_array(conv_integer(K));
d <= d_array(conv_integer(K));
j <= j_array(conv_integer(K));      
dm <= dm_array(conv_integer(K)); 

Bx(0) <= Bx_array(conv_integer(K))(0);
Bx(1) <= Bx_array(conv_integer(K))(1);
Bx(2) <= Bx_array(conv_integer(K))(2);
Bx(3) <= Bx_array(conv_integer(K))(3);
Bx(4) <= Bx_array(conv_integer(K))(4);

Ax(0) <= Ax_array(conv_integer(K))(0);
Ax(1) <= Ax_array(conv_integer(K))(1);
Ax(2) <= Ax_array(conv_integer(K))(2);
Ax(3) <= Ax_array(conv_integer(K))(3);
Ax(4) <= Ax_array(conv_integer(K))(4);
     	
Rst_int<= Reset or Rst_Ax;           	
Test:Get_Ax 
Port map ( Reset	=> Rst_int,   
           Clk		=> Clk, 
           En		=> En,  
           d		=> d, 
           dm		=> dm,  
           Ax		=> Ax,  
           Bx		=> Bx,  
           j		=> j,  
           Ax_out	=> Ax_out, 
           Ax_valid	=> Ax_valid);
           
           
Detec0: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Ax_valid,
            PulsoB  => Ax_valid_PB,--pulso para inicio de configuracion
            PulsoS  => open);

Reset_Ret:Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Ax_valid_PB,
            Clk      => Clk,
           	En       => '1',
           	DIN      => "1000",
           	Dout     => open,
           	En_Out   => Rst_Get_Ax_r1);

Detec2: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Rst_Get_Ax_r1,
            PulsoB  => Rst_Ax,--pulso para inicio de configuracion
            PulsoS  => open);


Fin <= Ax_valid;
end Behavioral;

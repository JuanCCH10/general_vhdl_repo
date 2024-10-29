----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2023 13:31:00
-- Design Name: 
-- Module Name: Test_Get_d - Behavioral
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

entity Test_Get_d is
    Port ( Reset	: in STD_LOGIC;
           Clk		: in STD_LOGIC;
           d		: out STD_LOGIC_VECTOR(4 downto 0));
end Test_Get_d;

architecture Behavioral of Test_Get_d is

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
 
--signal		Reset	:  STD_LOGIC;                    
--signal		Clk		:  STD_LOGIC;                     
--signal		En		:  STD_LOGIC;                      
signal		L		:  STD_LOGIC_VECTOR(3 downto 0);    
signal		K		:  STD_LOGIC_VECTOR(3 downto 0);    
signal		SK		:  STD_LOGIC_VECTOR(4 downto 0);   
signal		SKi		:  STD_LOGIC_VECTOR(4 downto 0);  
signal		Addr_Ai	:  STD_LOGIC_VECTOR(3 downto 0);                       
signal		Addr_SK	:  STD_LOGIC_VECTOR(3 downto 0);
signal		Addr_SKi: STD_LOGIC_VECTOR(3 downto 0);
--signal		d		: STD_LOGIC_VECTOR(4 downto 0);   
signal		Fin_d		: STD_LOGIC;   
signal		Fin_d_PB		: STD_LOGIC;                
signal		Fin_K	: STD_LOGIC; 

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


TYPE Array_Type2 IS ARRAY (7 downto 0) OF STD_LOGIC_VECTOR(4 downto 0);
TYPE Array_Type3 IS ARRAY (0 TO 15) OF Array_Type2;
SIGNAL Ax_array1: Array_Type3:=(
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

signal		Ai_int		:  Array_Ax;--Array_Type2;

signal Rst_int, Rst_d:std_logic;
signal Rst_d_r1:std_logic;


begin

Reset_Int:Contador_Lim_In_Asc_Ini
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => Rst_d,--Fin_d_PB,
           	Ini		 =>"0001",
           	DIN      => "1000",
           	Dout     => K,
           	En_Out   => Fin_K);
           	
--Reset_Int:Contador_Lim_In_Asc
--Generic Map(Nbits => 4)
--Port Map ( 
--            Reset    => Reset,
--            Clk      => Clk,
--           	En       => Fin_d_PB,
--           	DIN      => "1000",
--           	Dout     => K,
--           	En_Out   => Fin_K);
         	
L <= L_array(conv_integer(K));

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

--Ai_int(0) <= Ax_array1(conv_integer(Addr_Ai))(0);
--Ai_int(1) <= Ax_array1(conv_integer(Addr_Ai))(1);
--Ai_int(2) <= Ax_array1(conv_integer(Addr_Ai))(2);
--Ai_int(3) <= Ax_array1(conv_integer(Addr_Ai))(3);
--Ai_int(4) <= Ax_array1(conv_integer(Addr_Ai))(4);

Ai_int(0) <= Ax_array1(conv_integer(K))(0);
Ai_int(1) <= Ax_array1(conv_integer(K))(1);
Ai_int(2) <= Ax_array1(conv_integer(K))(2);
Ai_int(3) <= Ax_array1(conv_integer(K))(3);
Ai_int(4) <= Ax_array1(conv_integer(K))(4);


Rst_int<= Reset or Rst_d;
Inst: Get_d 
   Port Map ( Reset	   => Rst_int,
           Clk		   => Clk,		
           En		   => '1',	 
           L		   => L,	  
           K		   => K,	  
           SK		   => SK,		 
           SKi		   => SKi,		
           Ai		   => Ai_Int,	
--           Addr_Ai	   => Addr_Ai,	 
           Addr_SK	   => Addr_SK,
           Addr_SKi	   => Addr_SKi,
           d		   => d,
           d_valid	   => Fin_d);

Detec0: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Fin_d,
            PulsoB  => Fin_d_PB,--pulso para inicio de configuracion
            PulsoS  => open);


Reset_Ret:Contador_Lim_In_Asc
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Fin_d_PB,
            Clk      => Clk,
           	En       => '1',
           	DIN      => "1000",
           	Dout     => open,
           	En_Out   => Rst_d_r1);


Detec2: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => Rst_d_r1,
            PulsoB  => Rst_d,--pulso para inicio de configuracion
            PulsoS  => open);


--FF02: FF_Add_n
--generic map(nFF   => 2,
--            nbits=> 1)
--Port map(  Clk  => Clk, 
--           D(0) => Fin_d_PB,    
--           Q(0) => Rst_d);
           
            
end Behavioral;

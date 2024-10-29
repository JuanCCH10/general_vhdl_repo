----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.01.2023 11:14:45
-- Design Name: 
-- Module Name: Get_d - Behavioral
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

entity Get_d is
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
end Get_d;

architecture Behavioral of Get_d is
signal Ai_x_SKi	: STD_LOGIC_VECTOR(4 downto 0);
signal i_aux	: STD_LOGIC_VECTOR(3 downto 0);
signal i_aux_r1	: STD_LOGIC_VECTOR(3 downto 0);
signal i		: STD_LOGIC_VECTOR(3 downto 0);
signal Ki		: STD_LOGIC_VECTOR(3 downto 0);
signal Ai_int	: STD_LOGIC_VECTOR(4 downto 0);
signal Addr_Mult: STD_LOGIC_VECTOR(9 downto 0);

component ROM_Mult_alfa is
    generic(Addrbits		: integer := 10;
			DataBits		: integer := 5
				);
	 Port (	Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0));
end component;

TYPE Array_Type1 IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(4 downto 0);
SIGNAL Ai_SKi: Array_Type1;
SIGNAL Ai_SKi_xor: Array_Type1;

Signal En_d: std_logic;
Signal En_d_r1,En_d_r1_PB: std_logic;
Signal Fin: std_logic;
signal SK_r1:STD_LOGIC_VECTOR(4 downto 0);
signal d_Int:STD_LOGIC_VECTOR(4 downto 0);

begin
Reset_Int:Contador_Lim_In_Asc_Ini
Generic Map(Nbits => 4)
Port Map ( 
            Reset    => Reset,
            Clk      => Clk,
           	En       => '1',
           	Ini		 =>"0001",
           	DIN      => L,
           	Dout     => i_Aux,
           	En_Out   => Fin);
           	
i <= i_aux;-- + 1;
Ki<= K-i;

--Addr_Ai <= i when K > 1 else "0000";

Ai_int <= Ai(conv_integer(i));
Addr_SK <= K;
Addr_SKi<= Ki;

Addr_Mult <= Ai_int & SKi;
           	
Rom_Alfa:ROM_Mult_alfa 
    generic map(Addrbits	=> 10,
				DataBits		=> 5)
	 Port map (	Clk => Clk,
				Addr=> Addr_Mult,
				Rd	=> '1',
				Data=> Ai_x_SKi);
				
Process(clk) is
begin
	if rising_edge(clk) then
		i_aux_r1 <= i_aux;
		En_d_r1 <= En_d;
	end if;
end process;
Detec0: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => En_d_r1,
            PulsoB  => En_d_r1_PB,--pulso para inicio de configuracion
            PulsoS  => open);

Process(Reset, Clk) is
begin
	if Reset = '1' then
		Ai_SKi <= (others=> "00000");
	elsif rising_edge(clk) then
		if En_d_r1 = '1' then
			Ai_SKi(conv_integer(i_Aux_r1)) <= 	Ai_x_SKi;
		end if;
		SK_r1 <= SK;
	end if;
end process;

Ai_SKi_xor(0) <= Ai_SKi(0) xor Ai_SKi(1);
Generate_xor: for i in 0 to 8 generate
    Ai_SKi_xor(i+1) <= Ai_SKi_xor(i) xor Ai_SKi(i+2);
  end generate Generate_xor;

d_Int <= Ai_SKi_xor(9) xor SK_r1;
Process(Reset, Clk) is
begin
	if Reset = '1' then
--		d <= (others=> '0');
	elsif rising_edge(clk) then
		if En_d_r1_PB = '1' then
			d <= d_Int;		
		end if;
		d_valid <= En_d_r1_PB;
	end if;
end process;
  
En_d <= fin and (not Reset);

--d_valid <= 	Fin;

end Behavioral;

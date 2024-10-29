library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
use work.RS_24_16_Package.all;

entity RS_24_16_Enc is
    Port (	Reset	: in STD_LOGIC;
			Clk	: in STD_LOGIC;
			En	: in STD_LOGIC;
			D	: in STD_LOGIC_VECTOR(5 DOWNTO 0);
			Q	: out STD_LOGIC_VECTOR(5 DOWNTO 0));
end RS_24_16_Enc;

architecture Behavioral of RS_24_16_Enc is

component FF_Add_n_Rst is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 2);
    Port ( Reset	: in STD_LOGIC;
    	   Clk  : in STD_LOGIC;
    	   En	: in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end component;

TYPE Array_Type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(5 downto 0);
signal FF_Out : Array_Type;
signal par_line : Array_Type;
signal FF_In : Array_Type;
signal GF_in : std_logic_vector(5 downto 0);
signal GF_out : std_logic_vector(5 downto 0);  

--37	3D	25	30	2F	14	06	16
signal gf37: std_logic_vector(7 downto 0); 
signal gf3D: std_logic_vector(7 downto 0);
signal gf25: std_logic_vector(7 downto 0);
signal gf30: std_logic_vector(7 downto 0);
signal gf2F: std_logic_vector(7 downto 0);
signal gf14: std_logic_vector(7 downto 0);
signal gf06: std_logic_vector(7 downto 0);
signal gf16: std_logic_vector(7 downto 0);

begin
    GF_in <= FF_Out(7) xor D;
    
    gf37 <= gf_37(conv_integer(GF_in));
    gf3D <= gf_3D(conv_integer(GF_in));
    gf25 <= gf_25(conv_integer(GF_in));
    gf30 <= gf_30(conv_integer(GF_in));
    gf2F <= gf_2F(conv_integer(GF_in));
    gf14 <= gf_14(conv_integer(GF_in));
    gf06 <= gf_06(conv_integer(GF_in));
    gf16 <= gf_16(conv_integer(GF_in));
    
    --37	3D	25	30	2F	14	06	16
    FF_In(0)<= GF16(5 downto 0);
    FF_In(1)<= GF06(5 downto 0) xor FF_Out(0);
    FF_In(2)<= GF14(5 downto 0) xor FF_Out(1);
    FF_In(3)<= GF2F(5 downto 0) xor FF_Out(2);
    FF_In(4)<= GF30(5 downto 0) xor FF_Out(3);
    FF_In(5)<= GF25(5 downto 0) xor FF_Out(4);
    FF_In(6)<= GF3D(5 downto 0) xor FF_Out(5);
    FF_In(7)<= GF37(5 downto 0) xor FF_Out(6);  
    
    Reg_Cor: for I in 0 to 7 generate  
    	FF: FF_Add_n_Rst
    	generic map(nFF    => 1,
    				nbits  => 6)
    	Port map( Reset	=> Reset,
    			  Clk	=> Clk, 
    			  En	=> En,
    			  D		=> FF_In(I),    
    			  Q		=> FF_Out(I)); 
    end generate Reg_Cor;
    
    par_line(0) <= "000000" when En = '1' else FF_Out(0);
    par_line(1) <= "000000" when En = '1' else FF_Out(1);
    par_line(2) <= "000000" when En = '1' else FF_Out(2);
    par_line(3) <= "000000" when En = '1' else FF_Out(3);
    par_line(4) <= "000000" when En = '1' else FF_Out(4);
    par_line(5) <= "000000" when En = '1' else FF_Out(5);
    par_line(6) <= "000000" when En = '1' else FF_Out(6);
    par_line(7) <= "000000" when En = '1' else FF_Out(7);

    Q <= FF_Out(7);
    
end Behavioral;

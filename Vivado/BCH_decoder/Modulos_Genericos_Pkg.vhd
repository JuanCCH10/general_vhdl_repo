--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Modulos_Genericos_Pkg is

component DetectFlancosSincro is
    Port ( clk     :in STD_LOGIC;
	       Entrada : in  STD_LOGIC;
           PulsoB  : out  STD_LOGIC;
		   PulsoS  : out  STD_LOGIC);
end component;

component Contador_Lim_En_C is
    Generic(Nbits: integer:=26;
    		Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC );
end Component;

component Contador_Lim_In_Asc is
    Generic(Nbits: integer:=9);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC; 
           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC);
end component;

component Contador_Lim_In_Asc_Ini is
    Generic(Nbits: integer:=9);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Ini      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC);
end component;

component Contador_Lim_In_Asc_0 is
    Generic(Nbits: integer:=9);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC);
end component;

component Contador is
    Generic(Nbits: integer:=26);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)     );
end component;


component Ctrl_SPI is
    generic(Nbits: integer:=24;
            NbitsC: integer:=6);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           Clk_SPI  : in STD_LOGIC;--tren de pulsos
           En_Wr    : in STD_LOGIC;
           Limite   : in std_logic_vector(NbitsC-1 downto 0);
           Data_In  : in std_logic_vector(Nbits-1 downto 0);
           CS       : out STD_LOGIC;
           SCLK     : out STD_LOGIC;
           SDIN     : out STD_LOGIC;
           Tx_End   : out STD_LOGIC
           );
end component;

component FF_Add_n is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 2);
    Port ( Clk  : in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end component;

component Contador_Lim_En is
    Generic(Nbits: integer:=26;
    	     Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC
           );
end Component;

component Ctrl_SPI_Rd is
    generic(Nbits: integer:=8;
            NbitsC: integer:=6);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           Clk_SPI  : in STD_LOGIC;--tren de pulsos
           En_Wr    : in STD_LOGIC;
           Limite   : in std_logic_vector(NbitsC-1 downto 0);
           Data_In  : in std_logic_vector(Nbits-1 downto 0);
           CS       : out STD_LOGIC;
           SCLK     : out STD_LOGIC;
           CDATA    : out STD_LOGIC;
           RDATA    : in STD_LOGIC;
           Rx_Byte  : out std_logic_vector(15 downto 0);
           Tx_End   : out STD_LOGIC;
           Busy     : out STD_LOGIC);
end component;
component Antirebotes is
    generic (Nciclos	: integer := 50);
	 Port ( reset	: in STD_LOGIC;
			  clk 	: in  STD_LOGIC;
           boton 	: in  STD_LOGIC;
           salida : inout  STD_LOGIC);
end component;

component SPI_Tx_Stream is
    generic(Nbits: integer:=8;
            NbitsC: integer:=12);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           Clk_SPI  : in STD_LOGIC;--tren de pulsos
           En_Wr    : in STD_LOGIC;
           Limite   : in std_logic_vector(NbitsC-1 downto 0);
           Dir_Data : in std_logic_vector(Nbits-1 downto 0);--byte a trasmitir
           Data_In  : in std_logic_vector(Nbits-1 downto 0);
           CS       : out STD_LOGIC;
           SCLK     : out STD_LOGIC;
           SDIN     : out STD_LOGIC;
           Byte_Tx  : out STD_LOGIC;
           Tx_End   : out STD_LOGIC
           );
end component;

component TX_RS_232 is
    generic(DIVIDE : integer := 7813);
    Port ( reset	: in  STD_LOGIC; 
           clk	: in  STD_LOGIC; 
           envia_dato: in  STD_LOGIC; 
           Byte_Tx	: in  STD_LOGIC_VECTOR (7 downto 0);
           dato_enviado: out  STD_LOGIC; 
           TXD	: out  STD_LOGIC); 
end component;

component RX_RS_232 is
    generic(DIVIDE : integer := 7813);
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RXD : in  STD_LOGIC;
           dato_valido : out  STD_LOGIC;
           Byte_Rx : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

--***********************************************
component Contador_Asc_Des is
    Generic(Nbits: integer:=6);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Limite	: In STD_LOGIC_VECTOR(Nbits-1 downto 0);
           Up       : in STD_LOGIC;
           Down     : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0));
end component;

--Ux:Contador_Asc_Des 
--Generic Map(Nbits => 4)
--Port Map ( Reset    =>Reset,
--           Clk      =>Clk,
--           En       =>En,
--           Limite	=>Limite,
--           Up       =>Up,
--           Down     =>Down,
--           Dout     =>Dout);
--**********************************************

--component Contador_Lim_In_Asc_Ini is
--    Generic(Nbits	: integer:=26;
--    		Ini		: std_logic:='0');
--    Port ( Reset    : in STD_LOGIC;
--           Clk      : in STD_LOGIC;
--           En       : in STD_LOGIC;
--           DIN      : in STD_LOGIC_VECTOR(Nbits-1 downto 0);
--           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
--           En_Out   : out STD_LOGIC--indica que esta en estado activo
--           );
--end component;
--Ceunta_Estados:Contador_Lim_In_Asc_Ini
--Generic Map(Nbits	=> 4,
--			Ini		=>'0')
--Port Map ( 
--			Reset    => Reset,
--			Clk      => Clk,
--           	En       => En,
--           	DIN      => DIN,
--           	Dout     => Dout,--cuenta de estados
--           	En_Out   => En_Out);--1=contando, 0=termio cuenta
--***********************************************

component Btn_Adapt is
generic (Nciclos :integer:=100);--80 ms
    Port ( Reset: in STD_LOGIC;
           Clk	: in STD_LOGIC;
           BTN	: in STD_LOGIC;
           BTN_out	: out STD_LOGIC;
           BTN_PS	: out STD_LOGIC;
           BTN_PB	: out STD_LOGIC
           );
end component;

end Modulos_Genericos_Pkg;

package body Modulos_Genericos_Pkg is

end Modulos_Genericos_Pkg;
 
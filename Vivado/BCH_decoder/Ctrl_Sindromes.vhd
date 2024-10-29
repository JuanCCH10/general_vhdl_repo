
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.Modulos_Genericos_Pkg.all;

entity Ctrl_Sindromes is
Generic( BitSyn : integer:=6);
Port
(
    Reset          : in std_logic;
    Clk            : in std_logic;
    En             : in std_logic;
    Syndroms_Valid : in std_logic;
    S1             : in std_logic_vector(BitSyn-1 downto 0);  
    S2             : in std_logic_vector(BitSyn-1 downto 0);  
    S3             : in std_logic_vector(BitSyn-1 downto 0);  
    S4             : in std_logic_vector(BitSyn-1 downto 0);  
    S5             : in std_logic_vector(BitSyn-1 downto 0);  
    S6             : in std_logic_vector(BitSyn-1 downto 0);  
    S7             : in std_logic_vector(BitSyn-1 downto 0);  
    S8             : in std_logic_vector(BitSyn-1 downto 0);  
    S9             : in std_logic_vector(BitSyn-1 downto 0);
    S10            : in std_logic_vector(BitSyn-1 downto 0);    
    S11            : in std_logic_vector(BitSyn-1 downto 0);  
    S12            : in std_logic_vector(BitSyn-1 downto 0);  
    S13            : in std_logic_vector(BitSyn-1 downto 0);  
    S14            : in std_logic_vector(BitSyn-1 downto 0);  
    S15            : in std_logic_vector(BitSyn-1 downto 0);  
    S16            : in std_logic_vector(BitSyn-1 downto 0);  
    S17            : in std_logic_vector(BitSyn-1 downto 0);  
    S18            : in std_logic_vector(BitSyn-1 downto 0);  
    S19            : in std_logic_vector(BitSyn-1 downto 0);
    S20            : in std_logic_vector(BitSyn-1 downto 0);
    S21            : in std_logic_vector(BitSyn-1 downto 0);
    S22            : in std_logic_vector(BitSyn-1 downto 0);
    Addr_SK        : in std_logic_vector(4 downto 0);
    Addr_SKi       : in std_logic_vector(4 downto 0);
    Busy           : out std_logic;
    SK             : out std_logic_vector(5 downto 0);
    SKi            : out std_logic_vector(5 downto 0)
);

end Ctrl_Sindromes;

architecture Behavioral of Ctrl_Sindromes is
--COMPONENTES*********************************************************
component Ram_Syndroms is
generic
(
    Nbits    : integer:=6;
    AddrBits : integer:=5
);
Port
(
    Clk   : in std_logic;
    En    : in std_logic;
    WR    : in std_logic;
    Addr1 : in std_logic_vector(AddrBits-1 downto 0);
    Addr2 : in std_logic_vector(AddrBits-1 downto 0);
    Din   : in std_logic_vector(Nbits-1 downto 0);
    Dout1 : out std_logic_vector(Nbits-1 downto 0);
    Dout2 : out std_logic_vector(Nbits-1 downto 0)
);
end component;
signal WR_Ram     : std_logic;
signal Addr1_Ram  : std_logic_vector(4 downto 0);
signal Addr2_Ram  : std_logic_vector(4 downto 0);
signal Addr_aux1  : std_logic_vector(4 downto 0);
signal Addr_aux2  : std_logic_vector(4 downto 0);
signal Din_Ram    : std_logic_vector(5 downto 0);
signal Dout1_Ram  : std_logic_vector(5 downto 0);
signal Dout2_Ram  : std_logic_vector(5 downto 0);
--*********************************************************************
signal Sindromes             : std_logic_vector(131 downto 0);
signal Cont_bits_sindrome    : std_logic_vector(2 downto 0);
signal Cont_132bits_sindrome : std_logic_vector(7 downto 0); 
signal Dato_Sindrome         : std_logic_vector(5 downto 0);
signal Cont_bloque_sindrome  : std_logic_vector(4 downto 0);
signal Carga_sindromes       : std_logic;
signal En_Cont_bloques       : std_logic;
signal En_cont_bits          : std_logic;
signal En_cont_132bits       : std_logic;
signal Reset_cont_bits       : std_logic;
signal Reset_cont_132bits    : std_logic;
signal Reset_cont_bloque     : std_logic;
signal Cont_Done_bits        : std_logic; 
signal Cont_Done_132bits     : std_logic;
signal Cont_Done_132bits1    : std_logic;
signal Cont_Done_bloque      : std_logic;
signal Cont_Done_bits1       : std_logic;
signal Cont_Done_bloque_b    : std_logic;
signal Boleano_aux           : std_logic;
signal Get_Syn_Done_aux      : std_logic;
begin

U0_Contador_132bits_Sindromes: Contador_Lim_In_Asc_0
Generic map
(
    Nbits  =>8
)
Port map
(
    Reset    =>Reset_cont_132bits,
    Clk      =>Clk,
    En       =>En_cont_132bits,
    DIN      =>"10000011",--132
    Dout     =>Cont_132bits_sindrome,
    En_Out   =>Cont_Done_132bits
);

U1_Contador_6bits_Sindromes: Contador_Lim_In_Asc
Generic map
(
    Nbits  =>3
)
Port map
(
    Reset    =>Reset_cont_bits,
    Clk      =>Clk,
    En       =>En_cont_bits,
    DIN      =>"101",
    Dout     =>Cont_bits_sindrome,
    En_Out   =>open --Cont_Done_bits
);
U2_Contador_Asc_bloque_sindromes: Contador_Lim_In_Asc_0
Generic map
(
    Nbits => 5
)
Port map
(
    Reset    =>Reset_cont_bloque,
    Clk      =>Clk,
    En       =>En_Cont_bloques,
    DIN      =>"10110",
    Dout     =>Cont_bloque_sindrome,
    En_Out   =>Cont_Done_bloque
);

U4_DetectorFlanco_bloque : DetectFlancosSincro
Port map
(
    clk     =>Clk,
	Entrada =>Cont_Done_bloque,
    PulsoB  =>Cont_Done_bloque_b,
	PulsoS  =>open
);
U5_FF_bits: FF_Add_n
generic map
(
    nFF   => 1,
    nbits => 1
)
Port map
(
    Clk  => Clk, 
    D(0) => Cont_Done_bits,    
    Q(0) => Cont_Done_bits1
);
       
U6_RAM_Sindromes: Ram_Syndroms
generic map
(
    Nbits    =>6,
    AddrBits =>5
)
Port map
(
    Clk   =>Clk,
    En    =>En,
    WR    =>WR_Ram,
    Addr1 =>Addr1_Ram,
    Addr2 =>Addr2_Ram,
    Din   =>Din_Ram,
    Dout1 =>Dout1_Ram,
    Dout2 =>Dout2_Ram
);
          
process(Reset,Clk) is
begin
    if Reset='1'then
        Sindromes        <=(others=>'0');
        Dato_Sindrome    <= (others=>'0');
        Boleano_aux      <='0';
        Get_Syn_Done_aux <= '1';
    elsif rising_edge(Clk)then
        if Carga_sindromes='1' then
            Sindromes <= S22 & S21 & S20 & S19 & S18 & S17 & S16 & S15 & S14 & S13 & S12 & S11 & S10 & S9
            & S8 & S7 & S6 & S5 & S4 & S3 & S2 & S1;
            Boleano_aux <='1';
        end if;
        if Cont_Done_bloque_b='1'then
            Boleano_aux      <='0';
            Get_Syn_Done_aux <='0';
        end if;
        if En='1' then
            Dato_Sindrome <=Sindromes(CONV_INTEGER(Cont_132bits_sindrome)) & Dato_Sindrome(5 downto 1);
        end if;
    end if;
end process;

Carga_sindromes      <= En and Syndroms_Valid;
En_Cont_bloques      <= En and Cont_Done_bits;
En_cont_bits         <= En and Boleano_aux;
Reset_cont_bits      <= Reset or Not(Boleano_aux) or Syndroms_Valid or Cont_Done_bits1 ;
Reset_cont_132bits   <= Reset or Not(Boleano_aux) or Syndroms_Valid;
Reset_cont_bloque    <= Reset or Not(Boleano_aux) or Syndroms_Valid;
Cont_Done_bits       <= Cont_bits_sindrome(2) and Cont_bits_sindrome(0);
En_cont_132bits      <= En and Not(Cont_Done_bits1) and Boleano_aux;
WR_Ram               <= En and Cont_Done_bloque and Cont_Done_bits1;
Addr_aux1            <= Cont_bloque_sindrome;
Addr_aux2            <= (others=>'0');
Addr1_Ram            <= Addr_SK when Cont_Done_bloque='0' else Addr_aux1;
Addr2_Ram            <= Addr_SKi when Cont_Done_bloque='0' else (others=>'0');
Din_Ram              <= Dato_Sindrome;
SK                   <= Dout1_Ram when Cont_Done_bloque='0' else (others=>'0');
SKi                  <= Dout2_Ram when Cont_Done_bloque='0' else (others=>'0');
Busy                 <= Get_Syn_Done_aux;
end Behavioral;


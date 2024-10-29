----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2022 15:11:37
-- Design Name: 
-- Module Name: Codigo_Trellis_V1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Codigo_Trellis_V1 is
    Port ( Rst      : in STD_LOGIC;
           Clk      : in STD_LOGIC;         
           Hab      : in STD_LOGIC;
           AN       : in STD_LOGIC;
           Addr_RAM : in STD_LOGIC_VECTOR (7 downto 0);
           Rd_RAM   : in STD_LOGIC;
           D_in     : in STD_LOGIC_VECTOR (143 downto 0);
           Trellis  : out STD_LOGIC_VECTOR (1 downto 0);
           End_Wr   : out STD_LOGIC
           );
end Codigo_Trellis_V1;

architecture Behavioral of Codigo_Trellis_V1 is

component Contador_Lim_Rst is
    Generic(Nbits: integer:=26;
    		Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC
           );
end Component;

signal Hab_12: std_logic;
signal Hab_34: std_logic;

component Serializador is
    Generic(Nbits  : integer;
            Cbits  : integer; 
            Limite : integer);
            
    Port(Rst   : in STD_LOGIC;
        Clk    : in  STD_LOGIC;                         --reloj general del sistema
        Load    : in  STD_LOGIC;                         --habilitador de carga un ciclo de reloj
        D_In    : in  STD_LOGIC_VECTOR(Nbits-1 downto 0);--Dato de entrada
        En_Rd   : out STD_LOGIC;
        Q       : out STD_LOGIC);                        --Salida serial
end component;

signal Aux_An: std_logic;

component Ctrol_Trellis_v1 is
    Port ( Rst    : in STD_LOGIC;
           Clk    : in STD_LOGIC;
           --En     : in STD_LOGIC;
           wr_bits: in STD_LOGIC;
           Bits   : in STD_LOGIC;
           Sel    : in STD_LOGIC;
           Dibits : out STD_LOGIC_VECTOR (1 downto 0);
           Tr_dib : out STD_LOGIC;
           Flag_12: out STD_LOGIC;
           Tribits: out STD_LOGIC_VECTOR (2 downto 0);
           Tr_trib: out STD_LOGIC;
           Flag_34   : out STD_LOGIC
           );
end Component;

component Contador_Lim_En is
    Generic(Nbits: integer:=26;
    		Limite: integer:=49999999);
    Port ( Reset    : in STD_LOGIC;
           Clk      : in STD_LOGIC;
           En       : in STD_LOGIC;
           Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           En_Out   : out STD_LOGIC
           );
end component;


signal T_96: std_logic;
signal T_144: std_logic;

signal bits: std_logic;

component Detec_flancos is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
		  PulsoS : out  STD_LOGIC);
end component;


component Trellis_12 is
    Port (
    rst : in std_logic;
    en : in std_logic;
    clk : in std_logic;
    dib_in : in std_logic_vector(1 downto 0);
    dibs_out : out std_logic_vector(3 downto 0);
    Valido: out std_logic
     );
end component;

component Trellis_34 is
    Port (
    rst : in std_logic;
    en : in std_logic;
    clk : in std_logic;
    trib_in : in std_logic_vector(2 downto 0);
    dibs_out : out std_logic_vector(3 downto 0);
    Valido: out std_logic
     );
end component;

component interf_out_trellis is
    Port (
        Rst : in std_logic;
        clk : in std_logic;
        True_L : in std_logic;
        Wr_12 : in std_logic;
        Wr_34 : in std_logic;
        Addr_RAM: in std_logic_vector (7 downto 0);
        Rd_RAM: in std_logic; 
        Sw_addr: in std_logic;
        din : in std_logic_vector(3 downto 0);
        dout : out std_logic_vector(1 downto 0);
        End_Wr: out std_logic
    );
end component;

signal Dibits: STD_LOGIC_VECTOR (1 downto 0);


signal Tribits: STD_LOGIC_VECTOR (2 downto 0);


signal data_12 : std_logic_vector(3 downto 0);
signal data_34 : std_logic_vector(3 downto 0);
signal data_interface : std_logic_vector(3 downto 0);

component FF_Add_n is
    generic(nFF     : integer:= 2;
            nbits   : integer:= 1);
    Port ( Clk  : in STD_LOGIC;
           D    : in STD_LOGIC_VECTOR(nbits-1 DOWNTO 0);
           Q    : out STD_LOGIC_VECTOR(nbits-1 DOWNTO 0));
end component;


signal En_12: std_logic;
signal En_34: std_logic;
signal Val_dibits: std_logic;
signal Val_tribits: std_logic;
signal PS_96: std_logic;
signal PS_144: std_logic;
signal Data_96 : std_logic_vector(95 downto 0);
signal Data_144 : std_logic_vector(143 downto 0);

signal Wr_bits: std_logic;
signal Tr_96: std_logic;
signal Tr_144: std_logic;

signal serie_96: std_logic;
signal serie_144: std_logic;

signal T_12: std_logic;
signal T_34: std_logic;
signal T_All: std_logic;
signal T_All_1: std_logic;
begin

habilitador_12: Contador_Lim_Rst
 generic map (Nbits => 7,
              Limite => 96
                )
    port map (Reset => Hab_12,
              Clk   => Clk,
              Dout  => open,
              En_Out=> T_96
              );
              
habilitador_34: Contador_Lim_Rst
 generic map (Nbits => 8,
              Limite => 144
                )
    port map (Reset => Hab_34,
              Clk   => Clk,
              Dout  => open,
              En_Out=> T_144
              );
                           
Hab_12 <= Hab when An = '0' else '0';
Hab_34 <= Hab when An = '1' else '0';

Detector2: Detec_flancos
    port map(clk => clk,
            Entrada => T_96,
            PulsoB => open,
            PulsoS=> PS_96
            );
            
Detector3: Detec_flancos
    port map(clk => clk,
            Entrada => T_144,
            PulsoB => open,
            PulsoS=> PS_144
            );                            

vector_96: Serializador
    Generic map (Nbits  => 96,
                 Cbits  => 7,
                 Limite => 96
                )
    Port map    (Rst   => Rst,
                Clk    => Clk,
                Load   => PS_96,
                D_In   => Data_96,
                En_Rd  => tr_96,
                Q      => serie_96
                );

Data_96 <= D_in(95 downto 0) when T_96 = '1' else (others => '0');
Data_144 <= D_in when T_144 = '1' else (others => '0');

vector_144: Serializador
    Generic map (Nbits  => 144,
                 Cbits  => 8,
                 Limite => 144
                )
    Port map    (Rst   => Rst,
                 Clk   => Clk,
                 Load  => PS_144,
                 D_In  => Data_144,
                 En_Rd => tr_144,
                 Q     => serie_144
                 );

Wr_bits <= Tr_96 or Tr_144;

bits <= serie_96 or serie_144;

process (clk, Rst)
begin
 if rising_edge (clk) then
    if Rst = '1' then
        Aux_An <= '0';
        else
        if Hab = '1' then
         Aux_An <= AN;
        end if;
    end if;
 end if;
end process;

ctrol_trellis: Ctrol_Trellis_v1 
    Port map ( Rst     => Rst,
               Clk     => Clk,
               --En      => En,
               wr_bits => Wr_bits,--Timer,
               Bits    => bits,
               Sel     => Aux_An,--AN,
               Dibits  => Dibits,
               Tr_dib  => T_12,
               Flag_12 => En_12,
               Tribits => Tribits,
               Tr_trib => T_34,
               Flag_34 => En_34
           );
           
T_All_1 <= T_12 OR T_34;          

FF0: FF_Add_n
generic map(nFF  => 2,
            nbits=> 1)
Port map   (Clk  => Clk, 
            D(0) => T_All_1,    
            Q(0) => T_All);
            
Trellis_UnMedio: Trellis_12 
    Port map(
             rst      => Rst,
             en       => En_12,
             clk      => Clk,
             dib_in   => Dibits,
             dibs_out => data_12,
             Valido   => Val_dibits
          );

Trellis_TresCuartos: Trellis_34 
    Port map (
                rst       => Rst,
                en        => En_34,
                clk       => Clk,
                trib_in   => Tribits,
                dibs_out  => data_34,
                Valido    => Val_tribits
             );
          
data_interface <= data_12 when Aux_An = '0' else data_34;
          
interface_trellis: interf_out_trellis
    Port map (
                Rst      => Rst,
                clk      => Clk,
                True_L   => T_All,
                Wr_12    => Val_dibits,
                Wr_34    => Val_tribits,
                Addr_RAM => Addr_RAM,
                Rd_RAM   => Rd_RAM,
                Sw_addr  => Hab,
                din      => data_interface,
                dout     => Trellis,
                End_Wr   => End_Wr 
              );
    
end Behavioral;

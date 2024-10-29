


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Ctrol_Trellis_v1 is
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
end Ctrol_Trellis_v1;

architecture Behavioral of Ctrol_Trellis_v1 is

component serie_paralelo is
    Port ( clk : in STD_LOGIC;
           datos: in STD_LOGIC;
           enable: in STD_LOGIC; 
           reset: in STD_LOGIC;
           dibits: out STD_LOGIC_VECTOR (1 downto 0);
           valido: out std_logic;
           Flag_48: out STD_LOGIC
           );
end component;

component Conv_Tribits is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           En  : in STD_LOGIC;
           D   : in STD_LOGIC;
           Tribits: out STD_LOGIC_VECTOR (2 downto 0);
           Val : out STD_LOGIC;
           Trib_48: out STD_LOGIC;
           Flag : out STD_LOGIC
           );
end Component;

signal X0: std_logic;
signal X1: std_logic;
signal Y0: std_logic;
signal Y1: std_logic;

signal Z_0: std_logic;
signal A_0: std_logic;


begin

bits_dibits: serie_paralelo
    port map (clk => Clk,
              datos => X0,
              enable => Y0,
              reset => Rst,
              dibits => Dibits,--Dibits_1,
              valido => Tr_dib,--val_dib,
              Flag_48 => Flag_12
              );
              
Bits_tri: Conv_Tribits
     port map (Rst => Rst,
               Clk => Clk,
                 D => X1,
                En => Y1,
                Tribits => Tribits,
                Val => Tr_trib,
                Trib_48 => A_0,
                Flag => Flag_34
                 );
                 
X0 <= Bits when Sel = '0' ELSE '0';
X1 <= Bits when Sel = '1' ELSE '0';

Y0 <= Wr_bits when Sel = '0' ELSE '0';
Y1 <= Wr_bits when Sel = '1' ELSE '0';


end Behavioral;

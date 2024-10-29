library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCH_DECODER is
port
(
    Reset_decoder : in std_logic;
    Clk           : in std_logic;
    En_decoder    : in std_logic;
    Code_Word     : in std_logic_vector(62 downto 0)
);
end BCH_DECODER;

architecture Behavioral of BCH_DECODER is
component Sindromes is
Generic
    (Nbits  :integer:=63;
     BitSyn : integer:=6); 
port
(
    Clk     : in STD_LOGIC;--reloj general del sistema                     
    Reset   : in STD_LOGIC;--reset                                         
    En      : in std_logic;--En general                                 
    Din     : in STD_LOGIC_VECTOR (Nbits-1 downto 0);--dato de entrada 
    S1      : out std_logic_vector(BitSyn-1 downto 0);  
    S2      : out std_logic_vector(BitSyn-1 downto 0);  
    S3      : out std_logic_vector(BitSyn-1 downto 0);  
    S4      : out std_logic_vector(BitSyn-1 downto 0);  
    S5      : out std_logic_vector(BitSyn-1 downto 0);  
    S6      : out std_logic_vector(BitSyn-1 downto 0);  
    S7      : out std_logic_vector(BitSyn-1 downto 0);  
    S8      : out std_logic_vector(BitSyn-1 downto 0);  
    S9      : out std_logic_vector(BitSyn-1 downto 0);
    S10     : out std_logic_vector(BitSyn-1 downto 0);    
    S11     : out std_logic_vector(BitSyn-1 downto 0);  
    S12     : out std_logic_vector(BitSyn-1 downto 0);  
    S13     : out std_logic_vector(BitSyn-1 downto 0);  
    S14     : out std_logic_vector(BitSyn-1 downto 0);  
    S15     : out std_logic_vector(BitSyn-1 downto 0);  
    S16     : out std_logic_vector(BitSyn-1 downto 0);  
    S17     : out std_logic_vector(BitSyn-1 downto 0);  
    S18     : out std_logic_vector(BitSyn-1 downto 0);  
    S19     : out std_logic_vector(BitSyn-1 downto 0);
    S20     : out std_logic_vector(BitSyn-1 downto 0);
    S21     : out std_logic_vector(BitSyn-1 downto 0);
    S22     : out std_logic_vector(BitSyn-1 downto 0);    
    Done    : out std_logic
);--Bandera que indica el termino del CRC       
end component;
signal S1            : std_logic_vector(5 downto 0);
signal S2            : std_logic_vector(5 downto 0);
signal S3            : std_logic_vector(5 downto 0);
signal S4            : std_logic_vector(5 downto 0);
signal S5            : std_logic_vector(5 downto 0);
signal S6            : std_logic_vector(5 downto 0);
signal S7            : std_logic_vector(5 downto 0);
signal S8            : std_logic_vector(5 downto 0);
signal S9            : std_logic_vector(5 downto 0);
signal S10           : std_logic_vector(5 downto 0);
signal S11           : std_logic_vector(5 downto 0);
signal S12           : std_logic_vector(5 downto 0);
signal S13           : std_logic_vector(5 downto 0);
signal S14           : std_logic_vector(5 downto 0);
signal S15           : std_logic_vector(5 downto 0);
signal S16           : std_logic_vector(5 downto 0);
signal S17           : std_logic_vector(5 downto 0);
signal S18           : std_logic_vector(5 downto 0);
signal S19           : std_logic_vector(5 downto 0);
signal S20           : std_logic_vector(5 downto 0);
signal S21           : std_logic_vector(5 downto 0);
signal S22           : std_logic_vector(5 downto 0);
signal Syndroms_Done : std_logic;

Component Ctrl_Sindromes is
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
end component;
signal Busy_Ctrl_Sindromes : std_logic;
----------------------------------------------------------------------------------
component BMA is
Port (	
    Reset	        : in STD_LOGIC;
	Clk		        : in STD_LOGIC;
	En		        : in STD_LOGIC;
	SK		        : in STD_LOGIC_VECTOR(5 downto 0);--sindrome
	SKi		        : in STD_LOGIC_VECTOR(5 downto 0);--sindrome i
	Addr_SK	        : out STD_LOGIC_VECTOR(4 downto 0);--adress sindrome
	Addr_SKi        : out STD_LOGIC_VECTOR(4 downto 0);--addres sindrome i
	Fin		        : out STD_LOGIC);  
end component;

signal SK           : std_logic_vector(5 downto 0);
signal SKi          : std_logic_vector(5 downto 0);
signal Addr_SK      : std_logic_vector(4 downto 0);
signal Addr_SKi     : std_logic_vector(4 downto 0);
signal BMA_End      : std_logic;
signal Reset_BMA    : std_logic;
begin

M1_Sindromes: Sindromes
Generic map
    (Nbits  =>63,
     BitSyn =>6)
port map
(
    Clk     =>Clk,     
    Reset   =>Reset_decoder,     
    En      =>En_Decoder,  
    Din     =>Code_Word, 
    S1      =>S1,
    S2      =>S2,
    S3      =>S3,
    S4      =>S4,
    S5      =>S5,
    S6      =>S6,
    S7      =>S7,
    S8      =>S8,
    S9      =>S9,
    S10     =>S10,
    S11     =>S11,
    S12     =>S12,
    S13     =>S13,
    S14     =>S14,
    S15     =>S15,
    S16     =>S16,
    S17     =>S17,
    S18     =>S18,
    S19     =>S19,
    S20     =>S20,
    S21     =>S21,
    S22     =>S22,
    Done    =>Syndroms_Done
);

M2_Ctrl_Sindromes : Ctrl_Sindromes
Generic map( BitSyn =>6)
Port map
(
    Reset          =>Reset_decoder,
    Clk            =>Clk,
    En             =>En_decoder,
    Syndroms_Valid =>Syndroms_Done,
    S1             =>S1, 
    S2             =>S2, 
    S3             =>S3, 
    S4             =>S4, 
    S5             =>S5, 
    S6             =>S6, 
    S7             =>S7, 
    S8             =>S8, 
    S9             =>S9,
    S10            =>S10,   
    S11            =>S11, 
    S12            =>S12, 
    S13            =>S13, 
    S14            =>S14, 
    S15            =>S15, 
    S16            =>S16, 
    S17            =>S17, 
    S18            =>S18, 
    S19            =>S19,
    S20            =>S20,
    S21            =>S21,
    S22            =>S22,
    Addr_SK        =>Addr_SK,
    Addr_SKi       =>Addr_SKi,
    Busy           =>Busy_Ctrl_Sindromes,
    SK             =>SK,
    SKi            =>SKi
);

M3_BMA : BMA 
Port map
(	
    Reset	 => Reset_BMA,
	Clk		 => Clk,
	En		 => En_decoder,
	SK		 => SK,
	SKi		 => SKi,
	Addr_SK	 => Addr_SK,
	Addr_SKi => Addr_SKi,
	Fin		 => BMA_End
);  

Reset_BMA <= Reset_decoder or Busy_Ctrl_Sindromes;
end Behavioral;
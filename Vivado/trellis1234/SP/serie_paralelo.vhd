----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2021 15:10:55
-- Design Name: 
-- Module Name: serie_paralelo - Behavioral
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


entity serie_paralelo is
    Port ( clk : in STD_LOGIC;
           datos: in STD_LOGIC;
           enable: in STD_LOGIC; 
           reset: in STD_LOGIC;
           dibits: out STD_LOGIC_VECTOR (1 downto 0);
           valido: out std_logic;
           Flag_48: out STD_LOGIC
           );
end serie_paralelo;

architecture Behavioral of serie_paralelo is

component convertidorsp is
    Port ( rst : in STD_LOGIC;
            CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           en: in STD_LOGIC;
           Qp : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component FFD_EN is
Port ( rst : in STD_LOGIC;
        en : in STD_LOGIC;
       clk : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR (1 downto 0);
       Q : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component divisor_limit is
generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           dout : out STD_LOGIC);
end component; 

component Detec_flancos is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
		  PulsoS : out  STD_LOGIC);
end component;

component FFF_CONT is
Port ( 
           D : in STD_LOGIC;
           clk: in STD_LOGIC;
           rst : in std_logic;
           --EN : in STD_LOGIC;
           C: out STD_LOGIC);
end component; 

signal QD: std_logic_vector (1 downto 0);
signal T_EN: std_logic;
signal T: std_logic;
signal T1: std_logic;
signal T2: std_logic;
signal T3: std_logic;
signal T4: std_logic;
--signal T5: std_logic;

signal D1: std_logic;
signal aux: std_logic;
constant Limit: integer := 1;
constant Nbits: integer := 0;

constant Limit1: integer := 48;
constant Nbits1: integer := 6;

component contador_limit_in is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           BusOut	: out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           dout : out STD_LOGIC);
end component;  

signal cuenta1: std_logic_vector (Nbits1-1 downto 0); 
signal Z_0: std_logic;
signal Z_1: std_logic;
signal Z_2: std_logic; 
signal dibits1: std_logic_vector (1 downto 0); 

signal rst_all: std_logic; 
signal Tr_data: std_logic;
signal PB: std_logic;
--signal Flag: std_logic;
--signal enable1: std_logic;
------- conexiones
begin

uconvertidorsp: convertidorsp
    port map ( rst => rst_all,
                CLK => clk,
               D => datos,
               en => enable,
               Qp => QD
               );
               
UFFD_EN: FFD_EN
    port map ( rst => rst_all,
                en => T,
               clk => clk,
               D => QD,
               Q => dibits1
               );
              
divisor1: divisor_limit
    generic map (Nbits => Nbits,
                Limit => Limit
                )
    port map (rst => rst_all,
               en => enable,
               clk => clk,
               dout => D1
               );
               
Detector1: Detec_flancos
    port map(clk => clk,
            Entrada => D1,
            PulsoB => T,
            PulsoS=> open
            );
            
contador1: contador_limit_in
    generic map (Nbits => Nbits1,
                Limit => Limit1
                )
    port map (rst => rst_all,
               en => T_EN,
               clk => clk,
               BusOut => cuenta1,
               dout => Tr_data
               );
 
 Detector2: Detec_flancos
    port map(clk => clk,
            Entrada => Tr_data,
            PulsoB => PB,
            PulsoS=> open
            );
                          
 Z_0 <= '1' when cuenta1 = "110000" ELSE '0';
                   
process(Reset, Clk) is
begin
if reset = '1' then
    T1 <= '0';
    T2 <= '0';	
    T3 <= '0';	
    T4 <= '0';	 
	elsif rising_edge(Clk) then
		T1 <= T;
		T2 <= T1;
		T3 <= T2;
		T4 <= T3;
	end if;
end process;

--Flag_48 <= T2 or T4;
Flag_48 <= T1 or T3;
--Flag <= T2 or T4;

--enable1 <= enable;

--Flag_48 <= Flag and enable1;

T_EN <= T2 or T;
--Flag_48 <= Z_0;

process(Clk) is
begin
	if rising_edge(Clk) then
		Z_1 <= Z_0;
		Z_2 <= Z_1;
	end if;
end process;

dibits <= dibits1 when Z_2 = '0' else "00";

rst_all <= PB or reset;

Valido <= Tr_data or Z_2;
            
end Behavioral;

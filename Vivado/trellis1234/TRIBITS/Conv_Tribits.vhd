----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2021 15:44:34
-- Design Name: 
-- Module Name: Conv_Tribits - Behavioral
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


entity Conv_Tribits is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           En  : in STD_LOGIC;
           D   : in STD_LOGIC;
           Tribits: out STD_LOGIC_VECTOR (2 downto 0);
           Val : out STD_LOGIC;
           Trib_48: out STD_LOGIC;
           Flag: out STD_LOGIC
           );
end Conv_Tribits;

architecture Behavioral of Conv_Tribits is

component Bits_Tribits is
    Port ( Rst : in STD_LOGIC;
          Clk : in STD_LOGIC;
          D   : in STD_LOGIC;
          En  : in STD_LOGIC;
          Qp  : out STD_LOGIC_VECTOR (2 downto 0));
end component;

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

component contador_en is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           BusOut	: out STD_LOGIC_VECTOR(Nbits-1 downto 0));
           --dout : out STD_LOGIC);
end component;
constant Limit: integer := 2;
constant Nbits: integer := 2;  
  
signal BusOut: std_logic_vector (Nbits-1 downto 0);
signal aux1: std_logic;
signal aux: std_logic;
signal Qp: std_logic_vector (2 downto 0);

signal ff1: std_logic;
signal ff2: std_logic;
signal ff3: std_logic;
signal ff4: std_logic;
signal ff5: std_logic;
signal ff6: std_logic;

signal f_conta: std_logic;

component Detec_flancos is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
		  PulsoS : out  STD_LOGIC);
end component;

constant Nbits1: integer := 6;
constant Limit1: integer := 48;
signal cuenta2: std_logic_vector (Nbits1-1 downto 0);
signal Tribits1: std_logic_vector (2 downto 0);
signal A_0: std_logic;
signal A_1: std_logic;
signal A_2: std_logic;
signal A_3: std_logic;

signal Val_1: std_logic;
signal Val_pb: std_logic;
signal Rst_all: std_logic;

begin

Bits_tri: Bits_Tribits
     port map (Rst => Rst_all,--Rst,
               Clk => Clk,
                 D => D,
                En => En,
                Qp => Qp
                 );

contador: contador_en
    generic map (Nbits => Nbits,
                Limit => Limit
                )
    port map (rst => Rst_all,--Rst,
               en => En,
               clk => Clk,
               BusOut => BusOut
               );

contador2: contador_limit_in
    generic map (Nbits => Nbits1,
                Limit => Limit1
                )
    port map (rst => Rst_all,--Rst,
               en => f_conta,
               clk => Clk,
               BusOut => cuenta2,
               dout => Val_1
               );  
                            
aux1 <= '1' when BusOut = "00" else
         '0';

Detector: Detec_flancos
    port map(clk => Clk,
            Entrada => aux1,
            PulsoB => open,
            PulsoS=> aux
            ); 

Detector1: Detec_flancos
    port map(clk => Clk,
            Entrada => Val_1,
            PulsoB => Val_pb ,
            PulsoS=> open         
            ); 
                       
process (clk, Rst_all) IS
   begin
   if Rst_all = '1' then
     Tribits1 <= "000";
   elsif rising_edge (clk) then
    if aux = '1' then
        Tribits1 <= Qp;
    end if;
  end if;
end process;

process(Rst, Clk) is
begin
 if Rst = '1' then
 ff1 <= '0';
 ff2 <= '0';
 ff3 <= '0';
 ff4 <= '0';
 ff5 <= '0';
 ff6 <= '0';
	elsif rising_edge(Clk) then
		ff1 <= aux;
		ff2 <= ff1;
		ff3 <= ff2;
		ff4 <= ff3;
		ff5 <= ff4;
		ff6 <= ff5;
	end if;
end process;

A_0 <= '1' when cuenta2 = "110000" ELSE '0'; 
f_conta <= ff3 or aux;
Trib_48 <= A_0;

--Val <= ff3 and aux;

 
process(Clk) is
begin
	if rising_edge(Clk) then
		A_1 <= A_0;
		A_2 <= A_1;
		A_3 <= A_2;
	end if;
end process;

Tribits <= Tribits1 when A_3 = '0' else "000";

Val <= Val_1 or A_3;

Rst_all <= Rst or Val_pb;

--Flag <= ff3 or ff6;
Flag <= ff1 or ff4;
                                               
end Behavioral;



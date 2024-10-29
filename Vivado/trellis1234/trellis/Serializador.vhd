----------------------------------------------------------------------------------
-- Company: UNINDETEC
-- Engineer: Guillermo Vicencio Gutierrez
-- 
-- Create Date: 03.12.2020 15:16:33
-- Design Name: 
-- Module Name: Serializador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: vivado 19.1 
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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity Serializador is
    Generic(Nbits  : integer;
            Cbits  : integer; 
            Limite : integer);
            
    Port(Rst   : in STD_LOGIC;
        Clk    : in  STD_LOGIC;                         --reloj general del sistema
        Load    : in  STD_LOGIC;                         --habilitador de carga un ciclo de reloj
        D_In    : in  STD_LOGIC_VECTOR(Nbits-1 downto 0);--Dato de entrada
        En_Rd   : out STD_LOGIC;
        Q       : out STD_LOGIC);                        --Salida serial
end Serializador;

architecture Behavioral of Serializador is
--************************************************
--************************************************
component Contador_Lim is
    Generic(Nbits  : integer;            
    		Limite : integer);
    		
    Port ( Reset   : in  STD_LOGIC;
           Clk     : in  STD_LOGIC;
           Dout    : out STD_LOGIC_VECTOR(Nbits-1 downto 0));
end component;

signal Addr  : STD_LOGIC_VECTOR(Cbits-1 downto 0);
signal En_Rd1: std_logic;
signal En_Rd2: std_logic;
signal En_SR : STD_LOGIC;
--************************************************
component SRLPS is
    Generic(Nbits: integer);
    
    Port ( Rst  : in STD_LOGIC;
           Clk	: in  STD_LOGIC;
           Load	: in  STD_LOGIC;
           En	: in  STD_LOGIC;
           D	: in  STD_LOGIC_VECTOR (Nbits-1 downto 0);
           Q	: out STD_LOGIC);
end component;
--************************************************
begin
--************************************************
U_Addr_Reg:Contador_Lim
Generic map(Nbits  => Cbits,
    		Limite => Limite)
    		
Port Map  ( Reset  => Load,
            Clk    => Clk,
            Dout   => Addr);
                   
En_Rd1<= '1' when  Addr < Limite else '0';
En_SR <= En_Rd1 and (not Load);
En_Rd <= En_SR;
--********************************************
U_Serial:SRLPS
Generic map(Nbits=> Nbits) 

Port Map   (Rst  => Rst,
            Clk	 => Clk,
            Load => Load,
            En	 => En_SR,
            D	 => D_In,
            Q	 => Q);

end Behavioral;
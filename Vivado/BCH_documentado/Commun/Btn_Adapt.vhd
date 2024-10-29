----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.06.2022 15:26:08
-- Design Name: 
-- Module Name: Btn_Adapt - Behavioral
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
use work.Modulos_Genericos_Pkg.all;

entity Btn_Adapt is
generic (Nciclos :integer:=100);--80 ms
    Port ( Reset: in STD_LOGIC;
           Clk	: in STD_LOGIC;
           BTN	: in STD_LOGIC;
           BTN_out	: out STD_LOGIC;
           BTN_PS	: out STD_LOGIC;
           BTN_PB	: out STD_LOGIC
           );
end Btn_Adapt;

architecture Behavioral of Btn_Adapt is

signal BTN_Reb: std_logic;

begin

Rebotes3:Antirebotes
generic map (Nciclos => Nciclos)--80 ms
Port Map ( reset	=> Reset,
			clk 	=> Clk,
            boton 	=> BTN,
            salida  => BTN_Reb);

Detec_03: DetectFlancosSincro
Port Map (  clk     => Clk,
            Entrada => BTN_Reb,
            PulsoB  => BTN_PB,
            PulsoS  => BTN_PS);  --reset del modulador 
            

end Behavioral;

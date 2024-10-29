----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 16:29:49
-- Design Name: 
-- Module Name: stat_regre_cond - Behavioral
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

entity stat_regre_cond is
    Port (
        rst, clk, ce : in std_logic;
        d : in std_logic_vector(7 downto 0);
        q0 : out std_logic_vector(7 downto 0);
        q1 : out std_logic_vector(7 downto 0);
        q2 : out std_logic_vector(7 downto 0)
    );
end stat_regre_cond;

architecture Behavioral of stat_regre_cond is

    component Shift_Register_n is
        Generic(long_Reg: integer := 1;
            DataBits: integer := 8
        );
        Port (  Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
        );
    end component;
    signal out0 : std_logic_vector(7 downto 0);
    signal out1 : std_logic_vector(7 downto 0);
    signal out2 : std_logic_vector(7 downto 0);

begin

    reg1 : Shift_Register_n
    port map(
        Reset => rst,
        D => d,
        CE => ce,
        CLK => clk,
        Q => out0
    );
    
    reg2 : Shift_Register_n
    port map(
        Reset => rst,
        D => out0,
        CE => ce,
        CLK => clk,
        Q => out1
    );
    
    reg3 : Shift_Register_n
    port map(
        Reset => rst,
        D => out1,
        CE => ce,
        CLK => clk,
        Q => out2
    );
    
    q0 <= out0;
    q1 <= out1;
    q2 <= out2;
end Behavioral;

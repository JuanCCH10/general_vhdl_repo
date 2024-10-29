----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Guillermo Vicencio Gutierrez 
-- 
-- Create Date: 12.08.2019 11:41:30
-- Design Name: 
-- Module Name: SRL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Pruebas de uso de componentes primitivos para procesamiento de señales
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity Shift_Register_n is
    Generic(long_Reg: integer := 1;
            DataBits: integer := 8
    );
    Port (  Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
    );
end Shift_Register_n;

architecture Behavioral of Shift_Register_n is

--constant SRL_longitud: std_logic_vector(3 downto 0):= conv_std_logic_vector(long_Reg,4);
type RegArray1 is array(0 to long_Reg-1) of std_logic_vector(D'range);
signal Qx: RegArray1;
constant Dato: std_logic_vector(DataBits-1 downto 0):= (others => '0');
begin

process(CLK) is
begin
    if Reset= '1' then
        Qx <= (others=>Dato);
    elsif rising_edge(CLK) then
        if CE = '1' then
            Qx <= D & Qx(0 to long_Reg-2);
        end if;
    end if;
end process;

Q <= Qx(Qx'high);
---*******************************************************************
--Pruebas SRL16E y SRL32E
-- SRL16E: 16-Bit Shift Register Look-Up Table (LUT)
-- UltraScale
-- Xilinx HDL Libraries Guide, version 2014.1
--SRL16E_inst : SRL16E
--    generic map (
--        INIT => X"0000", -- Initial contents of shift register
--        IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--    )
--    port map (
--        Q => Q, -- 1-bit output: SRL Data
--        CE => CE, -- 1-bit input: Clock enable
--        CLK => CLK, -- 1-bit input: Clock
--        D => D, -- 1-bit input: SRL Data
--        -- Depth Selection: 1-bit (each) input: A0-A3 select SRL depth
--        A0 => A1(0),
--        A1 => A1(1),
--        A2 => A1(2),
--        A3 => A1(3)
--    );
---- End of SRL16E_inst instantiation

--SRLC32E_inst : SRLC32E
--    generic map (
--        INIT => X"00000000", -- Initial contents of shift register
--        IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--    )
--    port map (
--        Q => open,--Q1, -- 1-bit output: SRL Data
--        Q31 => Q31, -- 1-bit output: SRL Cascade Data
--        A => A2, -- 5-bit input: Selects SRL depth
--        CE => CE, -- 1-bit input: Clock enable
--        CLK => CLK, -- 1-bit input: Clock
--        D => D -- 1-bit input: SRL Data
--    );
---*******************************************************************
--Pruebas SRL16E y SRL32E en cascada
--SRL16E_inst : SRL16E
--    generic map (
--        INIT => X"0000", -- Initial contents of shift register
--        IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--    )
--    port map (
--        Q => Q, -- 1-bit output: SRL Data
--        CE => CE, -- 1-bit input: Clock enable
--        CLK => CLK, -- 1-bit input: Clock
--        D => Q2, -- 1-bit input: SRL Data
--        -- Depth Selection: 1-bit (each) input: A0-A3 select SRL depth
--        A0 => A1(0),
--        A1 => A1(1),
--        A2 => A1(2),
--        A3 => A1(3)
--    );
---- End of SRL16E_inst instantiation

--SRLC32E_inst : SRLC32E
--    generic map (
--        INIT => X"00000000", -- Initial contents of shift register
--        IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--    )
--    port map (
--        Q => open,--Q1, -- 1-bit output: SRL Data
--        Q31 => Q2, -- 1-bit output: SRL Cascade Data
--        A => A2, -- 5-bit input: Selects SRL depth
--        CE => CE, -- 1-bit input: Clock enable
--        CLK => CLK, -- 1-bit input: Clock
--        D => D -- 1-bit input: SRL Data
--    );


-----*******************************************************************
--SRLC32E_inst : SRLC32E
--generic map (
--    INIT => X"00000000", -- Initial contents of shift register
--    IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--)
--port map (
--    Q => open,--Q1, -- 1-bit output: SRL Data
--    Q31 => Q3(1), -- 1-bit output: SRL Cascade Data
--    A => A2, -- 5-bit input: Selects SRL depth
--    CE => CE, -- 1-bit input: Clock enable
--    CLK => CLK, -- 1-bit input: Clock
--    D => D -- 1-bit input: SRL Data
--);

--SRL_X : for i in 1 to (Q3'high)-1 generate
--    SRLC32E_inst : SRLC32E
--    generic map (
--        INIT => X"00000000", -- Initial contents of shift register
--        IS_CLK_INVERTED => '0' -- Optional inversion for CLK
--    )
--    port map (
--        Q => open,--Q1, -- 1-bit output: SRL Data
--        Q31 => Q3(i+1), -- 1-bit output: SRL Cascade Data
--        A => A2, -- 5-bit input: Selects SRL depth
--        CE => CE, -- 1-bit input: Clock enable
--        CLK => CLK, -- 1-bit input: Clock
--        D => Q3(i) -- 1-bit input: SRL Data
--    );
--end generate;
--Q31 <= Q3(Q3'high);
-----*******************************************************************
end Behavioral;

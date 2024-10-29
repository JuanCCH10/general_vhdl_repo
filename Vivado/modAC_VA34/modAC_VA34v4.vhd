----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2022 10:41:57
-- Design Name: 
-- Module Name: modAC_VA34v4 - Behavioral
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

entity modAC_VA34v4 is
    Port (
        clk, rst, ce : in std_logic;
        dibits_rx : in std_logic_vector(3 downto 0);
        est_r : out std_logic_vector(2 downto 0)
    );
end modAC_VA34v4;

architecture Behavioral of modAC_VA34v4 is
    component modulo_A_VA is
        generic(num_bits : integer := 9);
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(num_bits downto 0);
            peso_ai : out std_logic_vector(num_bits downto 0)
        );
    end component;
    
    component Shift_Register_n is
        Generic(long_Reg: integer := 1;
            DataBits: integer := 10);
        Port (
            Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
        );
    end component;
    
    component mod_CestVA34 is
        generic(num_bits : integer := 10);
        Port (
            A, B, C, D, E, F, G, H : in std_logic_vector(num_bits-1 downto 0);
            acc_value : out std_logic_vector(num_bits-1 downto 0);
            est_value : out std_logic_vector(2 downto 0)
        );
    end component;
    
    constant num_bits : integer := 10;
    constant eval_num : integer := 64;
    
    signal ce_d, ce_d1 : std_logic;
    signal val_est_reg, est_value : std_logic_vector(2 downto 0);
    signal val_acc : std_logic_vector(num_bits-1 downto 0);
    signal acc_value : std_logic_vector(num_bits-1 downto 0);
    
    type array_val_est is array (0 to 7) of std_logic_vector(3 downto 0);
    signal val_est : array_val_est;
    
    type array_val_ai is array (0 to 7) of std_logic_vector(num_bits-1 downto 0);
    signal val_ai : array_val_ai;
    
    type state_values is array (0 to eval_num-1) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
    "0000", --0 est0
    "0100", --4
    "0001", --1
    "0101", --5
    "0011", --3
    "0111", --7
    "0010", --2
    "0110", --6
    "1000", --8 est0
    "1100", --12
    "1001", --9
    "1101", --13
    "1011", --11
    "1111", --15
    "1010", --10
    "1110", --14
    "0100", --4 est0
    "0010", --2
    "0101", --5
    "0011", --3
    "0111", --7
    "0001", --1
    "0110", --6
    "0000", --0
    "1100", --12 est0
    "1010", --10
    "1101", --13
    "1011", --11
    "1111", --15
    "1001", --9
    "1110", --14
    "1000", --8
    "0010", --2 est0
    "0110", --6
    "0011", --3
    "0111", --7
    "0001", --1
    "0101", --5
    "0000", --0
    "0100", --4
    "1010", --10 est0
    "1110", --14
    "1011", --11
    "1111", --15
    "1001", --9
    "1101", --13
    "1000", --8
    "1100", --12
    "0110", --6 est0
    "0000", --0
    "0111", --7
    "0001", --1
    "0101", --5
    "0011", --3
    "0100", --4
    "0010", --2
    "1110", --14 est0
    "1000", --8
    "1111", --15
    "1001", --9
    "1101", --13
    "1011", --11
    "1100", --12
    "1010" --10
    );

begin

    process (clk) is begin
        if rst = '1' then
            ce_d <= '0';
        elsif rising_edge(clk) then
            ce_d <= ce;
        end if;
    end process;
    
    process (clk) is begin
        if rst = '1' then
            ce_d1 <= '0';
        elsif rising_edge(clk) then
            ce_d1 <= ce_d;
        end if;
    end process;
        
    est_register : Shift_Register_n generic map(long_reg => 2, DataBits => 3)
    port map(
        Reset => rst,
        D => est_value,
        CE => ce, 
        CLK => clk,
        Q => val_est_reg
    );
    
    -- Alimentador de modulos A
    val_est(0) <= const_point(0) when (val_est_reg = "000") else 
                const_point(1) when (val_est_reg = "001") else
                const_point(2) when (val_est_reg = "010") else
                const_point(3) when (val_est_reg = "011") else
                const_point(4) when (val_est_reg = "100") else
                const_point(5) when (val_est_reg = "101") else
                const_point(6) when (val_est_reg = "110") else
                const_point(7);
    val_est(1) <= const_point(8) when (val_est_reg = "000") else 
                const_point(9) when (val_est_reg = "001") else
                const_point(10) when (val_est_reg = "010") else
                const_point(11) when (val_est_reg = "011") else
                const_point(12) when (val_est_reg = "100") else
                const_point(13) when (val_est_reg = "101") else
                const_point(14) when (val_est_reg = "110") else
                const_point(15);
    val_est(2) <= const_point(16) when (val_est_reg = "000") else 
                const_point(17) when (val_est_reg = "001") else
                const_point(18) when (val_est_reg = "010") else
                const_point(19) when (val_est_reg = "011") else
                const_point(20) when (val_est_reg = "100") else
                const_point(21) when (val_est_reg = "101") else
                const_point(22) when (val_est_reg = "110") else
                const_point(23);
    val_est(3) <= const_point(24) when (val_est_reg = "000") else 
                const_point(25) when (val_est_reg = "001") else
                const_point(26) when (val_est_reg = "010") else
                const_point(27) when (val_est_reg = "011") else
                const_point(28) when (val_est_reg = "100") else
                const_point(29) when (val_est_reg = "101") else
                const_point(30) when (val_est_reg = "110") else
                const_point(31);
    val_est(4) <= const_point(32) when (val_est_reg = "000") else 
                const_point(33) when (val_est_reg = "001") else
                const_point(34) when (val_est_reg = "010") else
                const_point(35) when (val_est_reg = "011") else
                const_point(36) when (val_est_reg = "100") else
                const_point(37) when (val_est_reg = "101") else
                const_point(38) when (val_est_reg = "110") else
                const_point(39);
    val_est(5) <= const_point(40) when (val_est_reg = "000") else 
                const_point(41) when (val_est_reg = "001") else
                const_point(42) when (val_est_reg = "010") else
                const_point(43) when (val_est_reg = "011") else
                const_point(44) when (val_est_reg = "100") else
                const_point(45) when (val_est_reg = "101") else
                const_point(46) when (val_est_reg = "110") else
                const_point(47);  
    val_est(6) <= const_point(48) when (val_est_reg = "000") else 
                const_point(49) when (val_est_reg = "001") else
                const_point(50) when (val_est_reg = "010") else
                const_point(51) when (val_est_reg = "011") else
                const_point(52) when (val_est_reg = "100") else
                const_point(53) when (val_est_reg = "101") else
                const_point(54) when (val_est_reg = "110") else
                const_point(55);
    val_est(7) <= const_point(56) when (val_est_reg = "000") else 
                const_point(57) when (val_est_reg = "001") else
                const_point(58) when (val_est_reg = "010") else
                const_point(59) when (val_est_reg = "011") else
                const_point(60) when (val_est_reg = "100") else
                const_point(61) when (val_est_reg = "101") else
                const_point(62) when (val_est_reg = "110") else
                const_point(63);
                
    acc_register : Shift_Register_n generic map(long_reg => 1, DataBits => 10)
    port map(
        Reset => rst,
        D => acc_value,
        CE => ce_d1,
        CLK => clk,
        Q => val_acc
    );
    
    modulos_A : for I in 0 to 7 generate
        modulo_A : modulo_A_VA
        port map(
            dato_rx => dibits_rx,
            dato_est => val_est(I),
            peso_acc => val_acc,
            peso_ai => val_ai(I)
        );
    end generate;
    
    comparador : mod_CestVA34
    port map(
        A => val_ai(0),
        B => val_ai(1),
        C => val_ai(2),
        D => val_ai(3),
        E => val_ai(4),
        F => val_ai(5),
        G => val_ai(6),
        H => val_ai(7),
        acc_value => acc_value,
        est_value => est_value
    );           
    
    est_r <= est_value; 
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2022 08:44:28
-- Design Name: 
-- Module Name: modAC_VA34v3 - Behavioral
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

entity modAC_VA34v3 is
    Port (
        clk, rst, ce : in std_logic;
        dibits_rx : in std_logic_vector(3 downto 0);
        est_r : out std_logic_vector(2 downto 0)
    );
end modAC_VA34v3;

architecture Behavioral of modAC_VA34v3 is
    component modulo_A_VA is
        generic(num_bits : integer := 9);
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(num_bits downto 0);
            peso_ai : out std_logic_vector(num_bits downto 0)
        );
    end component;
    
    component mod_C4 is
        generic(num_bits : integer := 10);
        Port (
            A, B, C, D, E, F, G, H : in std_logic_vector(num_bits-1 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0)
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
    
    component Contador_Lim_En is
        Generic(Nbits: integer := 6;
    		Limite: integer := 49);
        Port (
            Reset    : in STD_LOGIC;
            Clk      : in STD_LOGIC;
            En       : in STD_LOGIC;
            Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0);
            En_Out   : out STD_LOGIC
        );
    end component;
    
    component DetectFlancosSincro is
        Port (
            clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
            PulsoB : out  STD_LOGIC;
			PulsoS : out  STD_LOGIC);
    end component;
    
    constant num_bits : integer := 10;
    constant eval_num : integer := 64;
    
    type val_est_arr is array (0 to eval_num-1) of std_logic_vector(num_bits-1 downto 0);
    signal val_est : val_est_arr;
    
    type val_est_modC is array (0 to 7) of std_logic_vector(num_bits-1 downto 0);
    signal est_val : val_est_modC;
    
    type state_values is array (0 to eval_num-1) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
--    "0000", --0 est0
--    "0100", --4
--    "0001", --1
--    "0101", --5
--    "0011", --3
--    "0111", --7
--    "0010", --2
--    "0110", --6
--    "1000", --8 est0
--    "1100", --12
--    "1001", --9
--    "1101", --13
--    "1011", --11
--    "1111", --15
--    "1010", --10
--    "1110", --14
--    "0100", --4 est0
--    "0010", --2
--    "0101", --5
--    "0011", --3
--    "0111", --7
--    "0001", --1
--    "0110", --6
--    "0000", --0
--    "1100", --12 est0
--    "1010", --10
--    "1101", --13
--    "1011", --11
--    "1111", --15
--    "1001", --9
--    "1110", --14
--    "1000", --8
--    "0010", --2 est0
--    "0110", --6
--    "0011", --3
--    "0111", --7
--    "0001", --1
--    "0101", --5
--    "0000", --0
--    "0100", --4
--    "1010", --10 est0
--    "1110", --14
--    "1011", --11
--    "1111", --15
--    "1001", --9
--    "1101", --13
--    "1000", --8
--    "1100", --12
--    "0110", --6 est0
--    "0000", --0
--    "0111", --7
--    "0001", --1
--    "0101", --5
--    "0011", --3
--    "0100", --4
--    "0010", --2
--    "1110", --14 est0
--    "1000", --8
--    "1111", --15
--    "1001", --9
--    "1101", --13
--    "1011", --11
--    "1100", --12
--    "1010" --10
    -- re-orden
    "0000", --0 est0
    "1000", --8
    "0100", --4
    "1100", --12
    "0010", --2
    "1010", --10
    "0110", --6
    "1110", --14
    "0100", --4 est1
    "1100", --12
    "0010", --2
    "1010", --10
    "0110", --6
    "1110", --14
    "0000", --0
    "1000", --8
    "0001", --1 est2
    "1001", --9
    "0101", --5
    "1101", --13
    "0011", --3
    "1011", --11
    "0111", --7
    "1111", --15
    "0101", --5 est3
    "1101", --13
    "0011", --3
    "1011", --11
    "0111", --7
    "1111", --15
    "0001", --1
    "1001", --9
    "0011", --3 est4
    "1011", --11
    "0111", --7
    "1111", --15
    "0001", --1
    "1001", --9
    "0101", --5
    "1101", --13
    "0111", --7 est5
    "1111", --15
    "0001", --1
    "1001", --9
    "0101", --5
    "1101", --13
    "0011", --3
    "1011", --11
    "0010", --2 est6
    "1010", --10
    "0110", --6
    "1110", --14
    "0000", --0
    "1000", --8
    "0100", --4
    "1100", --12
    "0110", --6 est7
    "1110", --14
    "0000", --0
    "1000", --8
    "0100", --4
    "1100", --12
    "0010", --2
    "1010"  --10
    );
    signal val_acc : std_logic_vector(num_bits-1 downto 0);
    signal acc_value_init : std_logic_vector(num_bits-1 downto 0);
    signal acc_value_proc : std_logic_vector(num_bits-1 downto 0); 
    signal est_proc : std_logic_vector(2 downto 0); 
    signal est_init : std_logic_vector(2 downto 0);
    signal acc_value : std_logic_vector(num_bits-1 downto 0);
    signal Dout : std_logic_vector(5 downto 0);
    signal muxb1, muxb0, acc_habil : std_logic;

begin
    Inst_moduloA : for I in 0 to eval_num-1 generate
        modulo_A : modulo_A_VA
        Port map(
            dato_rx => dibits_rx,
            dato_est => const_point(I),
            peso_acc => val_acc,
            peso_ai => val_est(I)
        );
    end generate;
    
    Inst_modC_weight0 : mod_C4
    port map(
        A => val_est(0),
        B => val_est(1),
        C => val_est(2),
        D => val_est(3),
        E => val_est(4),
        F => val_est(5),
        G => val_est(6),
        H => val_est(7),
        val_out => est_val(0)
    );
    
    Inst_modC_weight1 : mod_C4
    port map(
        A => val_est(8),
        B => val_est(9),
        C => val_est(10),
        D => val_est(11),
        E => val_est(12),
        F => val_est(13),
        G => val_est(14),
        H => val_est(15),
        val_out => est_val(1)
    );
    
    Inst_modC_weight2 : mod_C4
    port map(
        A => val_est(16),
        B => val_est(17),
        C => val_est(18),
        D => val_est(19),
        E => val_est(20),
        F => val_est(21),
        G => val_est(22),
        H => val_est(23),
        val_out => est_val(2)
    );
    
    Inst_modC_weight3 : mod_C4
    port map(
        A => val_est(24),
        B => val_est(25),
        C => val_est(26),
        D => val_est(27),
        E => val_est(28),
        F => val_est(29),
        G => val_est(30),
        H => val_est(31),
        val_out => est_val(3)
    );
    
    Inst_modC_weight4 : mod_C4
    port map(
        A => val_est(32),
        B => val_est(33),
        C => val_est(34),
        D => val_est(35),
        E => val_est(36),
        F => val_est(37),
        G => val_est(38),
        H => val_est(39),
        val_out => est_val(4)
    );
    
    Inst_modC_weight5 : mod_C4
    port map(
        A => val_est(40),
        B => val_est(41),
        C => val_est(42),
        D => val_est(43),
        E => val_est(44),
        F => val_est(45),
        G => val_est(46),
        H => val_est(47),
        val_out => est_val(5)
    );
    
    Inst_modC_weight6 : mod_C4
    port map(
        A => val_est(48),
        B => val_est(49),
        C => val_est(50),
        D => val_est(51),
        E => val_est(52),
        F => val_est(53),
        G => val_est(54),
        H => val_est(55),
        val_out => est_val(6)
    );
    
    Inst_modC_weight7 : mod_C4
    port map(
        A => val_est(56),
        B => val_est(57),
        C => val_est(58),
        D => val_est(59),
        E => val_est(60),
        F => val_est(61),
        G => val_est(62),
        H => val_est(63),
        val_out => est_val(7)
    );
    
    Int_modC_est : mod_CestVA34
    port map(
        A => est_val(0),
        B => est_val(1),
        C => est_val(2),
        D => est_val(3),
        E => est_val(4),
        F => est_val(5),
        G => est_val(6),
        H => est_val(7),
        acc_value => acc_value_proc,
        est_value => est_proc
    );
    
    acc_register : Shift_Register_n
    port map(
        Reset => rst,
        D => acc_value_proc,
        CE => ce,
        CLK => clk,
        Q => val_acc
    );
    
    --MUX1 acc_value
--    acc_value <= acc_value_init when (muxb0 = '0') else acc_value_proc;  
    acc_value <= acc_value_proc;
    
    --MUX2 est_value
--    est_r <= est_init when (muxb0 = '0') else est_proc;
    est_r <= est_proc;


end Behavioral;

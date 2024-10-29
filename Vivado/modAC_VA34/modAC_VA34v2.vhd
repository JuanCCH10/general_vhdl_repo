----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2022 10:32:30
-- Design Name: 
-- Module Name: modAC_VA34v2 - Behavioral
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

entity modAC_VA34v2 is
    Port (
        clk, rst, ce : in std_logic;
        dibits_rx : in std_logic_vector(3 downto 0);
        est_r : out std_logic_vector(2 downto 0)
    );
end modAC_VA34v2;

architecture Behavioral of modAC_VA34v2 is
    
    component modulo_A_VA is
        generic(num_bits : integer := 9);
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(num_bits downto 0);
            peso_ai : out std_logic_vector(num_bits downto 0)
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
    
    component mod_mux_est is
        Port (
            caso : in std_logic;
            sel_mux : in std_logic_vector(2 downto 0);
            out_mux_est0, out_mux_est1, out_mux_est2, out_mux_est3, out_mux_est4, out_mux_est5, out_mux_est6, out_mux_est7 : out std_logic_vector(3 downto 0)
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
    
    component delay is
        generic(num_cycle : integer := 1; num_bits : integer := 1);
        Port(
            clk : in std_logic;
            rst : in std_logic;
            D   : in std_logic_vector(num_bits-1 downto 0);
            Q   : out std_logic_vector(num_bits-1 downto 0)
        );
    end component;
    
    constant num_bits : integer := 10;
    constant estados : integer := 8;
    
    type val_est_arr is array (0 to estados-1) of std_logic_vector(num_bits-1 downto 0);
    signal val_est : val_est_arr;
    
    type mux_fed is array (0 to estados-1) of std_logic_vector(3 downto 0);
    signal est_opt : mux_fed;
    
    signal val_acc : std_logic_vector(num_bits-1 downto 0); 
    signal habilB, habilS, ce_f : std_logic;
    signal retardo_s, sel_init_proc : std_logic_vector(0 downto 0);
    signal acc_value : std_logic_vector(num_bits-1 downto 0);
    signal val_est_reg, est_value : std_logic_vector(2 downto 0);
    signal dibitsrx : std_logic_vector(3 downto 0);
    signal Dout : std_logic_vector(5 downto 0);

begin
--    reg_1L_2b : Shift_Register_n generic map(long_Reg => 1, DataBits => 10) port map();
--  caso 0 inicio, caso 1 proceso
--  sel_mux debe ir condicionado al valor de estado actual
    selector_estados : mod_mux_est
    port map(
        caso => '1',--sel_init_proc(0),
        sel_mux => val_est_reg,
        out_mux_est0 => est_opt(0),
        out_mux_est1 => est_opt(1),
        out_mux_est2 => est_opt(2),
        out_mux_est3 => est_opt(3),
        out_mux_est4 => est_opt(4),
        out_mux_est5 => est_opt(5),
        out_mux_est6 => est_opt(6),
        out_mux_est7 => est_opt(7)
    );
            
    modulos_A : for I in 0 to estados-1 generate
        modulo_A : modulo_A_VA
        port map(
            dato_rx => dibits_rx,
            dato_est => est_opt(I),
            peso_acc => val_acc,
            peso_ai => val_est(I)
        );
    end generate;
   
    comparador : mod_CestVA34
    port map(
        A => val_est(0),
        B => val_est(1),
        C => val_est(2),
        D => val_est(3),
        E => val_est(4),
        F => val_est(5),
        G => val_est(6),
        H => val_est(7),
        acc_value => acc_value,
        est_value => est_value
    );
   
--   cont_cond_init_proc : Contador_Lim_En
--   port map(
--            Reset => rst,
--            Clk => clk,
--            En => ce,
--            Dout => Dout,
--            En_Out => open --retardo_s(0)
--   );
   
--   retardo_parametrizable : delay
--        generic map(num_cycle => 1, num_bits => 1)
--        Port map(
--            clk => clk,
--            rst => rst,
--            D   => retardo_s,
--            Q   => sel_init_proc
--        );
   
--   process (clk) is begin
--    if rising_edge (clk) then
--        ce_f <= ce;
--    end if;
--   end process;
--   process (clk) is begin
--    if rising_edge (clk) then
--        dibitsrx <= dibits_rx;
--    end if;
--   end process;
   
--   cond_registros : DetectFlancosSincro
--    port map(
--        clk => clk,
--	    Entrada => ce_f,
--        PulsoB => habilB,
--		PulsoS => habilS
--    );
    
   -- el CE con acc_habil, se activa un dato si y un dato no. Se sustituye por ce directo para que actualice 
   est_register : Shift_Register_n generic map(long_reg => 2, DataBits => 3)
   port map(
        Reset => rst,
        D => est_value,
        CE => ce, 
        CLK => clk,
        Q => val_est_reg
   );
   
   acc_register : Shift_Register_n
   port map(
        Reset => rst,
        D => acc_value,
        CE => ce,
        CLK => clk,
        Q => val_acc
   );
    
   est_r <= est_value;
   
end Behavioral;

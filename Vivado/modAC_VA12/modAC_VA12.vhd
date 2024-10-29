----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 15:29:00
-- Design Name: 
-- Module Name: modAC_VA12 - Behavioral
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
-- Conexión de módulos A y modulo C para Viterbi 1/2

--    type state_values is array (0 to eval_num-1) of std_logic_vector(3 downto 0);
--    signal const_point : state_values :=
--    (
----    "0000", --0 est0
----    "1111", --15 est0
----    "1100", --12 est0
----    "0011", --3 est0
----    "0100", --4
----    "1011", --11
----    "1000", --8
----    "0111", --7
----    "1101", --13
----    "0010", --2
----    "0001", --1
----    "1110", --14
----    "1001", --9
----    "0110", --6
----    "0101", --5
----    "1010" --10
--    "0000", --0 est0
--    "0100", --4
--    "1101", --13
--    "1001", --9
--    "1111", --15 est0
--    "1011", --11
--    "0010", --2
--    "0110", --6
--    "1100", --12 est0
--    "1000", --8
--    "0001", --1
--    "0101", --5
--    "0011", --3 est0
--    "0111", --7
--    "1110", --14
--    "1010" --10
--    );

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modAC_VA12 is
    Port (
        clk, rst, ce, en_rd : in std_logic;
        dibits_rx   : in std_logic_vector(3 downto 0);
        addr_rd     : in std_logic_vector(5 downto 0);
        est_r       : out std_logic_vector(1 downto 0);
        fin         : out std_logic
    );
end modAC_VA12;

architecture Behavioral of modAC_VA12 is

    component modulo_A_VA is
        generic(num_bits : integer := 9);
        Port (
            dato_rx : in std_logic_vector(3 downto 0);
            dato_est : in std_logic_vector(3 downto 0);
            peso_acc : in std_logic_vector(num_bits downto 0);
            peso_ai : out std_logic_vector(num_bits downto 0)
        );
    end component;
  
    component mod_C2 is
        generic(num_bits : integer := 10);
        Port (
            A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0)
        );
    end component;
    
    component mod_CestVA12v2 is
        generic(num_bits : integer := 10);
        Port (
            A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
            acc_value : out std_logic_vector(num_bits-1 downto 0);
            est_value : out std_logic_vector(1 downto 0)
        );
    end component;
    
    component DetectFlancosSincro is
        Port (
            clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
            PulsoB : out  STD_LOGIC;
			PulsoS : out  STD_LOGIC);
    end component;
    
    component single_port_RAM is
        generic(Data_bits : integer := 12;
                Loc : integer := 49;
                Addr_bits : integer := 6);
        Port (
            din : in std_logic_vector(Data_bits-1 downto 0);
            dout : out std_logic_vector(Data_bits-1 downto 0);
            addr : in std_logic_vector(Addr_bits-1 downto 0);
            clk, rw, en : std_logic -- read := 0, write := 1
        );
    end component;   
    
    component Contador_Asc_Des is
        Generic (Nbits : integer := 6);
        Port (  Reset    : in STD_LOGIC;
                Clk      : in STD_LOGIC;
                En       : in STD_LOGIC;
                Limite	 : In STD_LOGIC_VECTOR(Nbits-1 downto 0);
                Up       : in STD_LOGIC;
                Down     : in STD_LOGIC;
                Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0));
    end component; 
    
    component Contador is
        Generic(Nbits : integer := 6);
        Port ( Reset    : in STD_LOGIC;
               Clk      : in STD_LOGIC;
               En       : in STD_LOGIC;
               Dout     : out STD_LOGIC_VECTOR(Nbits-1 downto 0)
           );
    end component;
    
    component mod_CestAB is
        generic(num_bits : integer := 10);
        Port (
            A, B : in std_logic_vector(num_bits-1 downto 0);
            Av, Bv : in std_logic_vector(2 downto 0);
            val_out : out std_logic_vector(num_bits-1 downto 0);
            est_out : out std_logic_vector(2 downto 0)
        );
    end component;
    
    --Número de evaluaciones = 4 evaluaciones por estado X 4 estados = 16
    constant eval_num : integer := 16;
    constant num_bits : integer := 10;
    constant limiteA : std_logic_vector(5 downto 0) := "110001";
    constant limiteD : std_logic_vector(5 downto 0) := "110000";
    
    type state_values is array (0 to eval_num-1) of std_logic_vector(3 downto 0);
    signal const_point : state_values :=
    (
    "0000", --0 est0
    "0100", --4
    "1101", --13
    "1001", --9
    "1111", --15 est0
    "1011", --11
    "0010", --2
    "0110", --6
    "1100", --12 est0
    "1000", --8
    "0001", --1
    "0101", --5
    "0011", --3 est0
    "0111", --7
    "1110", --14
    "1010" --10
    );
    
    type pesos_array is array (0 to eval_num-1) of std_logic_vector(num_bits-1 downto 0);
    signal peso_acc, peso_ai : pesos_array;
    
    type est_peso_array is array (0 to 3) of std_logic_vector(num_bits-1 downto 0);
    signal peso_acc_comp, peso_acc_mux : est_peso_array;
    
    type estado_result is array (0 to 3) of std_logic_vector(1 downto 0);
    signal est_result : estado_result;
    
    signal val_AB, val_CD, valA_D : std_logic_vector(num_bits-1 downto 0);
    signal est_AB, est_CD, estA_D : std_logic_vector(2 downto 0); 
    signal r_acc0, r_acc1, r_acc2, r_acc3 : std_logic_vector(num_bits-1 downto 0);
    signal r0in, r1in, r2in, r3in, r0out, r1out, r2out, r3out : std_logic_vector(11 downto 0);
    signal addr_asc, addr_des, d_addr_des, d_addr_des2, d_addr_des3, addr_mux, cont_free_out, d_addr_reg, d_addr_reg2, addr_decod, addr_ram_decod, addr_adit : std_logic_vector(5 downto 0);
    signal ce_delay, ce_reg, ce_reg2, ce_reg3, memo_s, memo_sn, ce_des, enable_cont, reg_en_reg, reg_en_ce, reg_en_out, en_decod, enable_ram_decod, rw_decod, en_decod_int_ext, fin_aux1, fin_aux2, fin_flag, delay_fin_flag, delay_fin_flag2 : std_logic;
    
    type ff_long is array (0 to 3) of std_logic_vector(num_bits-1 downto 0);
    signal reg_acc0, reg_acc1, reg_acc2 : ff_long;
    
    signal mux_ram, mux_ram_s, mux_sel_reg, mux_sel_reg2 : std_logic_vector(1 downto 0);
    
begin 
    contador_libre : Contador
    port map(
        Reset => rst,
        Clk => clk,
        En => enable_cont,
        Dout => cont_free_out
    );
    
    enable_cont <= not rst;
    
    delay_acc_value : process(clk,rst) is begin
        if rst = '1' then
            reg_acc0(0) <= (others => '0');
            reg_acc0(1) <= (others => '0');
            reg_acc0(2) <= (others => '0');
            reg_acc0(3) <= (others => '0');
            
            reg_acc1(0) <= (others => '0');
            reg_acc1(1) <= (others => '0');
            reg_acc1(2) <= (others => '0');
            reg_acc1(3) <= (others => '0');
            
        elsif rising_edge(clk) then
            reg_acc1(0) <= peso_acc_mux(0);
            reg_acc1(1) <= peso_acc_mux(1);
            reg_acc1(2) <= peso_acc_mux(2);
            reg_acc1(3) <= peso_acc_mux(3);
            
            reg_acc0(0) <= reg_acc1(0);
            reg_acc0(1) <= reg_acc1(1);
            reg_acc0(2) <= reg_acc1(2);
            reg_acc0(3) <= reg_acc1(3);
            end if;
    end process;
    r_acc0 <= reg_acc0(0);
    r_acc1 <= reg_acc0(1);
    r_acc2 <= reg_acc0(2);
    r_acc3 <= reg_acc0(3);
    
    Inst_moduloA : for I in 0 to eval_num-1 generate
        modulo_A : modulo_A_VA
        Port map(
            dato_rx => dibits_rx,
            dato_est => const_point(I),
            peso_acc => peso_acc(I),
            peso_ai => peso_ai(I)
        );
    end generate;
    
    peso_acc(0) <= r_acc0;
    peso_acc(1) <= r_acc1;
    peso_acc(2) <= r_acc2;
    peso_acc(3) <= r_acc3;
    
    peso_acc(4) <= r_acc0;
    peso_acc(5) <= r_acc1;
    peso_acc(6) <= r_acc2;
    peso_acc(7) <= r_acc3;
    
    peso_acc(8) <= r_acc0;
    peso_acc(9) <= r_acc1;
    peso_acc(10) <= r_acc2;
    peso_acc(11) <= r_acc3;
    
    peso_acc(12) <= r_acc0;
    peso_acc(13) <= r_acc1;
    peso_acc(14) <= r_acc2;
    peso_acc(15) <= r_acc3;
    
    from_any_to_0 : mod_CestVA12v2
    port map(
        A => peso_ai(0),
        B => peso_ai(1),
        C => peso_ai(2),
        D => peso_ai(3),
        acc_value => peso_acc_comp(0),
        est_value => est_result(0)
    );
    
    from_any_to_1 : mod_CestVA12v2
    port map(
        A => peso_ai(4),
        B => peso_ai(5),
        C => peso_ai(6),
        D => peso_ai(7),
        acc_value => peso_acc_comp(1),
        est_value => est_result(1)
    );
    
    from_any_to_2 : mod_CestVA12v2
    port map(
        A => peso_ai(8),
        B => peso_ai(9),
        C => peso_ai(10),
        D => peso_ai(11),
        acc_value => peso_acc_comp(2),
        est_value => est_result(2)
    );
    
    from_any_to_3 : mod_CestVA12v2
    port map(
        A => peso_ai(12),
        B => peso_ai(13),
        C => peso_ai(14),
        D => peso_ai(15),
        acc_value => peso_acc_comp(3),
        est_value => est_result(3)
    );
    
    peso_acc_mux(0) <= peso_acc_comp(0) when ce = '1' else (others => '0');
    peso_acc_mux(1) <= peso_acc_comp(1) when ce = '1' else (others => '0');
    peso_acc_mux(2) <= peso_acc_comp(2) when ce = '1' else (others => '0');
    peso_acc_mux(3) <= peso_acc_comp(3) when ce = '1' else (others => '0');
    
    r0in <= est_result(0) & peso_acc_comp(0);
    r1in <= est_result(1) & peso_acc_comp(1);
    r2in <= est_result(2) & peso_acc_comp(2);
    r3in <= est_result(3) & peso_acc_comp(3);
    
    RAM_0 : single_port_RAM
    Port map (
        din => r0in,
        dout => r0out,
        addr => addr_mux,
        clk => clk,
        rw => memo_s,
        en => ce_des
    );
    
    RAM_1 : single_port_RAM
    Port map (
        din => r1in,
        dout => r1out,
        addr => addr_mux,
        clk => clk,
        rw => memo_s,
        en => ce_des
    );
    
    RAM_2 : single_port_RAM
    Port map (
        din => r2in,
        dout => r2out,
        addr => addr_mux,
        clk => clk,
        rw => memo_s,
        en => ce_des
    );
    
    RAM_3 : single_port_RAM
    Port map (
        din => r3in,
        dout => r3out,
        addr => addr_mux,
        clk => clk,
        rw => memo_s,
        en => ce_des
    );
    
    ----------------------------------------------------------------------REVISAR
--    addr_adit <= addr_asc when memo_s = '1' else addr_rd;
        
--    RAM_decod_forward : single_port_RAM
--    generic map(Data_bits => 2,
--            Loc => 49,
--            Addr_bits => 6)
--    Port map (
--        din => estA_D(1 downto 0),
--        dout => open,
--        addr => addr_mux,
--        clk => clk,
--        rw => memo_s,
--        en => ce_des
--    );
    
    AB : mod_CestAB
    port map(
        A => peso_acc_comp(0),
        B => peso_acc_comp(1),
        Av => '0' & est_result(0),
        Bv => '0' & est_result(1),
        val_out => val_AB,
        est_out => est_AB
    );
    
    CD : mod_CestAB
    port map(
        A => peso_acc_comp(2),
        B => peso_acc_comp(3),
        Av => '0' & est_result(2),
        Bv => '0' & est_result(3),
        val_out => val_CD,
        est_out => est_CD
    );
    
    A_D : mod_CestAB
    port map(
        A => val_AB,
        B => val_CD,
        Av => est_AB,
        Bv => est_CD,
        val_out => valA_D,
        est_out => estA_D
    );
    
    delay_mux_ram_sel : process(clk,rst) is begin
        if rst = '1' then
            mux_sel_reg <= "00";
            mux_sel_reg2 <= "00";
        elsif rising_edge(clk) then
            mux_sel_reg2 <= mux_ram;
            mux_sel_reg <= mux_sel_reg2;
        end if;
    end process;
    
    mux_ram <= r0out(11 downto 10) when mux_sel_reg = "00" else
                r1out(11 downto 10) when mux_sel_reg = "01" else
                r2out(11 downto 10) when mux_sel_reg = "10" else
                r3out(11 downto 10);
                
    delay_addr_ram_decod : process(clk, rst) is begin
        if rst = '1' then
            d_addr_reg <= (others => '0');
            d_addr_reg2 <= (others => '0');
        elsif rising_edge(clk) then
            d_addr_reg2 <= addr_mux;
            d_addr_reg <= d_addr_reg2;
        end if;
    end process;
    
    RAM_decod : single_port_RAM
    generic map(Data_bits => 2,
            Loc => 49,
            Addr_bits => 6)
    Port map (
        din => mux_ram,
        dout => est_r,
        addr => addr_ram_decod,
        clk => clk,
        rw => rw_decod,
        en => en_decod_int_ext
    );
    
    enable_ram_decod <= '0' when memo_s = '1' else cont_free_out(0);
    
    rw_decod <= '0' when d_addr_des = "000000" else '1';
    
    fin_aux1 <= '1' when addr_asc = limiteA else '0';
    fin_aux2 <= not rw_decod;
    fin_flag <= fin_aux1 and fin_aux2;
    delay_fin : process(clk,rst) is begin
        if rst = '1' then
            delay_fin_flag <= '0';
            delay_fin_flag2 <= '0';
        else
            delay_fin_flag2 <= fin_flag;
            delay_fin_flag <= delay_fin_flag2;
        end if;
    end process;
    fin <= delay_fin_flag;
    
    addr_ram_decod <= addr_rd when delay_fin_flag = '1' else addr_decod;
    
    en_decod_int_ext <= en_rd when delay_fin_flag = '1' else enable_ram_decod; 
    
    delay_addr_decod : process(clk,rst) is begin
        if rst = '1' then
            addr_decod <= (others => '0');
        elsif rising_edge(clk) then
            addr_decod <= addr_des;
        end if;
    end process;
    
    delay_en_decod : process(clk,rst) is begin
        if rst = '1' then
            en_decod <= '0';
        elsif rising_edge(clk) then
            en_decod <= cont_free_out(0);
        end if;
    end process;
    
    reg_enable : process(clk,rst) is begin
        if rst = '1' then
            reg_en_reg <= '0';
        elsif rising_edge(clk) then
                reg_en_reg <= cont_free_out(0);
        end if;
    end process;
    reg_en_out <= reg_en_reg;
    
    ce_des <= ce_delay when memo_s = '1' else en_decod;
    
    addr_mux <= addr_asc when memo_s = '1' else addr_des;
    
    memo_s <= '0' when addr_asc = limiteA else '1';
    
    contador_Asc : Contador_Asc_Des
    port map(
        Reset => rst,
        Clk => clk,
        En => ce_delay,
        Limite => limiteA, --49
        Up => memo_s,
        Down => memo_sn,
        Dout => addr_asc
    );
    memo_sn <= not memo_s;
    
    contador_Des : Contador_Asc_Des
    port map(
        Reset => rst,
        Clk => clk,
        En => ce_des,
        Limite => limiteD, --48
        Up => memo_s,
        Down => memo_sn,
        Dout => addr_des
    );
    
    delay_ce : process(clk,rst) is begin
        if rst = '1' then
            ce_reg <= '0';
            ce_reg2 <= '0';
            ce_reg3 <= '0';
        elsif rising_edge(clk) then
            ce_reg3 <= ce;
            ce_reg2 <= ce_reg3;
            ce_reg <= ce_reg2;
        end if;
    end process;
    ce_delay <= ce_reg;
    
    --retardar 3 pulsos de reloj addr_des
    delay_addr_des : process(clk,rst) is begin
        if rst = '1' then
            d_addr_des <= (others => '0');
            d_addr_des2 <= (others => '0');
            d_addr_des3 <= (others => '0');
        elsif rising_edge(clk) then
            d_addr_des3 <= addr_des;
            d_addr_des2 <= d_addr_des3;
            d_addr_des <= d_addr_des2;
        end if;
    end process;

end Behavioral;

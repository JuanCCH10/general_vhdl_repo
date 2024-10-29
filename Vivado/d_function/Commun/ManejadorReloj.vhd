----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.07.2016 12:00:01
-- Design Name: 
-- Module Name: ManejadorReloj - Behavioral
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
-- Fout = Fclkin * M/D*0
--        CLKIN1_PERIOD: real := 10.0;
--        CLKFBOUT_MULT_F: real := 8.0;     => M 
--        DIVCLK_DIVIDE: integer := 1;      => D
--con los valores anteriores se obtiene las sigueintes frecuencia de salida
          --valores de O----
--        CLKOUT1_DIVIDE: integer:= 4;  200 MHz.
--        CLKOUT2_DIVIDE: integer:= 8;  100 MHz.
--        CLKOUT3_DIVIDE: integer:= 16; 50 MHz.
--        CLKOUT4_DIVIDE: integer:= 32; 25 MHz.
--        CLKOUT5_DIVIDE: integer:= 64; 12.5 MHz.
--        CLKOUT6_DIVIDE: integer:= 128;6.25 MHz.
--        CLKOUT0_DIVIDE_F: real := 4.0 3.125 MHz
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ManejadorReloj is
    Generic(CLKIN1_PERIOD: real := 10.0;
            CLKFBOUT_MULT_F: real := 8.0;
            DIVCLK_DIVIDE: integer := 1;
            CLKOUT1_DIVIDE: integer:= 4;
            CLKOUT2_DIVIDE: integer:= 8;
            CLKOUT3_DIVIDE: integer:= 16;
            CLKOUT4_DIVIDE: integer:= 32;
            CLKOUT5_DIVIDE: integer:= 64;
            CLKOUT6_DIVIDE: integer:= 128;
            CLKOUT0_DIVIDE_F: real := 4.0
            );
    Port ( CLKIN  : in STD_LOGIC;
           Reset  : in STD_LOGIC;
           CLKOUT0: out std_logic;
           CLKOUT1: out std_logic;
           CLKOUT2: out std_logic;
           CLKOUT3: out std_logic;
           CLKOUT4: out std_logic;
           CLKOUT5: out std_logic;    
           CLKOUT6: out std_logic;
           LOCKED : out STD_LOGIC
           );
end ManejadorReloj;

architecture Behavioral of ManejadorReloj is
constant cero: std_logic:= '0';
constant uno: std_logic:= '1';
signal CLKINa: std_logic;
signal CLKFBOUT: std_logic;
signal CLKOUT0aux: std_logic;
signal CLKOUT1aux: std_logic;
signal CLKOUT2aux: std_logic;
signal CLKOUT3aux: std_logic;
signal CLKOUT4aux: std_logic;
signal CLKOUT5aux: std_logic;
signal CLKOUT6aux: std_logic;
signal CLKFBOUTaux: std_logic;


signal CLK0 : STD_LOGIC;
signal CLK1 : STD_LOGIC;
signal CLK2 : STD_LOGIC;
signal CLK3 : STD_LOGIC;
signal CLK4 : STD_LOGIC;
signal CLK5 : STD_LOGIC;
signal CLK6 : STD_LOGIC;
--debug
signal count0,count1,count2: std_logic_vector(7 downto 0);
signal count3,count4,count5: std_logic_vector(7 downto 0);
signal count6: std_logic_vector(7 downto 0);
begin
IBUF_inst1 : IBUF
port map (
    O => CLKINa, -- Buffer output
    I => ClkIn-- Buffer input (connect directly to top-level port)
);
MMCME2_BASE_inst : MMCME2_BASE
    generic map (
        BANDWIDTH => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
        CLKFBOUT_MULT_F => CLKFBOUT_MULT_F, -- Multiply value for all CLKOUT (2.000-64.000).
        CLKFBOUT_PHASE => 0.0, -- Phase offset in degrees of CLKFB (-360.000-360.000).
        CLKIN1_PERIOD => CLKIN1_PERIOD, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
        CLKOUT1_DIVIDE => CLKOUT1_DIVIDE,
        CLKOUT2_DIVIDE => CLKOUT2_DIVIDE,
        CLKOUT3_DIVIDE => CLKOUT3_DIVIDE,
        CLKOUT4_DIVIDE => CLKOUT4_DIVIDE,
        CLKOUT5_DIVIDE => CLKOUT5_DIVIDE,
        CLKOUT6_DIVIDE => CLKOUT6_DIVIDE,
        CLKOUT0_DIVIDE_F => CLKOUT0_DIVIDE_F, -- Divide amount for CLKOUT0 (1.000-128.000).
        -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
        CLKOUT0_DUTY_CYCLE => 0.5,
        CLKOUT1_DUTY_CYCLE => 0.5,
        CLKOUT2_DUTY_CYCLE => 0.5,
        CLKOUT3_DUTY_CYCLE => 0.5,
        CLKOUT4_DUTY_CYCLE => 0.5,
        CLKOUT5_DUTY_CYCLE => 0.5,
        CLKOUT6_DUTY_CYCLE => 0.5,
        -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
        CLKOUT0_PHASE => 0.0,
        CLKOUT1_PHASE => 0.0,
        CLKOUT2_PHASE => 0.0,
        CLKOUT3_PHASE => 0.0,
        CLKOUT4_PHASE => 0.0,
        CLKOUT5_PHASE => 0.0,
        CLKOUT6_PHASE => 0.0,
        CLKOUT4_CASCADE => FALSE, -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
        DIVCLK_DIVIDE => 1, -- Master division value (1-106)
        REF_JITTER1 => 0.0, -- Reference input jitter in UI (0.000-0.999).
        STARTUP_WAIT => FALSE -- Delays DONE until MMCM is locked (FALSE, TRUE)
    )
    port map (
        CLKOUT0 => CLKOUT0aux, -- 1-bit output: CLKOUT0
        CLKOUT0B => open,--CLKOUT0B, -- 1-bit output: Inverted CLKOUT0
        CLKOUT1 => CLKOUT1aux, -- 1-bit output: CLKOUT1
        CLKOUT1B => open,--CLKOUT1B, -- 1-bit output: Inverted CLKOUT1
        CLKOUT2 => CLKOUT2aux, -- 1-bit output: CLKOUT2
        CLKOUT2B => open,--CLKOUT2B, -- 1-bit output: Inverted CLKOUT2
        CLKOUT3 => CLKOUT3aux, -- 1-bit output: CLKOUT3
        CLKOUT3B => open,--CLKOUT3B, -- 1-bit output: Inverted CLKOUT3
        CLKOUT4 => CLKOUT4aux, -- 1-bit output: CLKOUT4
        CLKOUT5 => CLKOUT5aux, -- 1-bit output: CLKOUT5
        CLKOUT6 => CLKOUT6aux, -- 1-bit output: CLKOUT6
        -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
        CLKFBOUT => CLKFBOUTaux, -- 1-bit output: Feedback clock
        CLKFBOUTB => OPEN, -- 1-bit output: Inverted CLKFBOUT
        -- Status Ports: 1-bit (each) output: MMCM status ports
        LOCKED => LOCKED, -- 1-bit output: LOCK
        -- Clock Inputs: 1-bit (each) input: Clock input
        CLKIN1 => CLKINa, -- 1-bit input: Clock
        -- Control Ports: 1-bit (each) input: MMCM control ports
        PWRDWN => cero,--PWRDWN, -- 1-bit input: Power-down--En nivel bajo trabaja
        RST => cero,--reset, -- 1-bit input: Reset; se resetea con 1
        -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
        CLKFBIN => CLKFBOUT -- 1-bit input: Feedback clock
    );
    
 BUFG_inst : BUFG --Realimentacion del reloj
        port map (
        O => CLKFBOUT, -- 1-bit output: Clock output
        I => CLKFBOUTaux -- 1-bit input: Clock input
        ); 
---------CLKOUT0---------------      
BUFG_inst0 : BUFG--CLKOUT0
    port map (
        O => CLK0, -- 1-bit output: Clock output
        I => CLKOUT0aux -- 1-bit input: Clock input
    );
--OBUF_inst0 : OBUF----CLKOUT0
--    port map (
--        O => CLKOUT0, -- Buffer output (connect directly to top-level port)
--        I => CLK0 -- Buffer input
--    );  
---------CLKOUT1---------------
BUFG_inst1 : BUFG --CLKOUT1
          port map (
                O => CLK1, -- 1-bit output: Clock output
                I => CLKOUT1aux -- 1-bit input: Clock input
                );
--OBUF_inst1 : OBUF--CLKOUT1
--    port map (
--        O => CLKOUT1, -- Buffer output (connect directly to top-level port)
--        I => CLK1 -- Buffer input
--    );
 ---------CLKOUT2---------------  
BUFG_inst2 : BUFG
    port map (
        O => CLK2, -- 1-bit output: Clock output
        I => CLKOUT2aux -- 1-bit input: Clock input
        );
--OBUF_inst2 : OBUF
--    port map (
--        O => CLKOUT2, -- Buffer output (connect directly to top-level port)
--        I => CLK2 -- Buffer input
--    ); 
 ---------CLKOUT3---------------             
BUFG_inst3 : BUFG
            port map (
                O => CLK3, -- 1-bit output: Clock output
                I => CLKOUT3aux -- 1-bit input: Clock input
                ); 
--OBUF_inst3 : OBUF
--    port map (
--        O => CLKOUT3, -- Buffer output (connect directly to top-level port)
--        I => CLK3 -- Buffer input
--    );
---------CLKOUT4---------------      
BUFG_inst4 : BUFG
    port map (
        O => CLK4, -- 1-bit output: Clock output
        I => CLKOUT4aux -- 1-bit input: Clock input
    );
--OBUF_inst4 : OBUF
--        port map (
--            O => CLKOUT4, -- Buffer output (connect directly to top-level port)
--            I => CLK4 -- Buffer input
--        ); 
---------CLKOUT5---------------           
BUFG_inst5 : BUFG
    port map (
        O => CLK5, -- 1-bit output: Clock output
        I => CLKOUT5aux -- 1-bit input: Clock input
    );
--OBUF_inst5 : OBUF
--        port map (
--            O => CLKOUT5, -- Buffer output (connect directly to top-level port)
--            I => CLK5 -- Buffer input
--        ); 
---------CLKOUT6---------------      
BUFG_inst6 : BUFG
    port map (
        O => CLK6, -- 1-bit output: Clock output
        I => CLKOUT6aux -- 1-bit input: Clock input
    ); 
--OBUF_inst6 : OBUF
--        port map (
--            O => CLKOUT6, -- Buffer output (connect directly to top-level port)
--            I => CLK6 -- Buffer input
--        );  

CLKOUT0 <= CLK0; 
CLKOUT1 <= CLK1;
CLKOUT2 <= CLK2;
CLKOUT3 <= CLK3;
CLKOUT4 <= CLK4;
CLKOUT5 <= CLK5;
CLKOUT6 <= CLK6;

----DEBUG
--PROCESS(Reset,CLK0) is
--begin
--    if reset = '1' then
--        count0 <= (others => '0');
--    elsif rising_edge(CLK0) then
--        count0 <= count0 + 1;
--    end if;
--end process;
--CLKOUT0 <= count0(7);

--PROCESS(Reset,CLK1) is
--begin
--    if reset = '1' then
--        count1 <= (others => '0');
--    elsif rising_edge(CLK1) then
--        count1 <= count1 + 1;
--    end if;
--end process;
--CLKOUT1 <= count1(7);

--PROCESS(Reset,CLK2) is
--begin
--    if reset = '1' then
--        count2 <= (others => '0');
--    elsif rising_edge(CLK2) then
--        count2 <= count2 + 1;
--    end if;
--end process;
--CLKOUT2 <= count2(7);

--PROCESS(Reset,CLK3) is
--begin
--    if reset = '1' then
--        count3 <= (others => '0');
--    elsif rising_edge(CLK3) then
--        count3 <= count3 + 1;
--    end if;
--end process;
--CLKOUT3 <= count3(7);

--PROCESS(Reset,CLK4) is
--begin
--    if reset = '1' then
--        count4 <= (others => '0');
--    elsif rising_edge(CLK4) then
--        count4 <= count4 + 1;
--    end if;
--end process;
--CLKOUT4 <= count4(7);

--PROCESS(Reset,CLK5) is
--begin
--    if reset = '1' then
--        count5 <= (others => '0');
--    elsif rising_edge(CLK5) then
--        count5 <= count5 + 1;
--    end if;
--end process;
--CLKOUT5 <= count5(7);

--PROCESS(Reset,CLK6) is
--begin
--    if reset = '1' then
--        count6 <= (others => '0');
--    elsif rising_edge(CLK6) then
--        count6 <= count6 + 1;
--    end if;
--end process;
--CLKOUT6 <= count6(7);
end Behavioral;

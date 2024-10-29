----------------------------------------------------------------------------------
--Configura la frecuencia de reloj, la divide o la multiplica, mediante MMCM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ClockManager_MMCM is
generic (Mult_F   : real:=50.0;
         DivideC1 : integer:=6);
Port
(
    Clk     : in std_logic;
    Reset   : in std_logic;
    RstSys  : out std_logic;
    Clk100M : out std_logic
);
end ClockManager_MMCM;

architecture Behavioral of ClockManager_MMCM is


signal CLKFBOUT   : std_logic;
signal LOCKED     : std_logic;

begin
MMCME2_BASE_inst : MMCME2_BASE
generic map (
BANDWIDTH => "OPTIMIZED", -- Jitter programming (OPTIMIZED, HIGH, LOW)
CLKFBOUT_MULT_F => Mult_F,--50.0, -- Multiply value for all CLKOUT (2.000-64.000).
CLKFBOUT_PHASE => 0.0, -- Phase offset in degrees of CLKFB (-360.000-360.000).
CLKIN1_PERIOD => 0.0, -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
-- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
CLKOUT1_DIVIDE => DivideC1,--6,
CLKOUT2_DIVIDE => 1,
CLKOUT3_DIVIDE => 1,
CLKOUT4_DIVIDE => 1,
CLKOUT5_DIVIDE => 1,
CLKOUT6_DIVIDE => 1,
CLKOUT0_DIVIDE_F => 1.0, -- Divide amount for CLKOUT0 (1.000-128.000).
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
CLKOUT4_CASCADE => FALSE, -- Cascase CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
DIVCLK_DIVIDE => 1, -- Master division value (1-106)
REF_JITTER1 => 0.0, -- Reference input jitter in UI (0.000-0.999).
STARTUP_WAIT => FALSE -- Delays DONE until MMCM is locked (FALSE, TRUE)
)
port map (
-- Clock Outputs: 1-bit (each) output: User configurable clock outputs
CLKOUT0 => OPEN, -- 1-bit output: CLKOUT0
CLKOUT0B => OPEN, -- 1-bit output: Inverted CLKOUT0
CLKOUT1 => Clk100M,-- 1-bit output: CLKOUT1
CLKOUT1B =>OPEN, -- 1-bit output: Inverted CLKOUT1
CLKOUT2 => OPEN,-- 1-bit output: CLKOUT2
CLKOUT2B =>OPEN, -- 1-bit output: Inverted CLKOUT2
CLKOUT3 => OPEN,-- 1-bit output: CLKOUT3
CLKOUT3B =>OPEN, -- 1-bit output: Inverted CLKOUT3
CLKOUT4 => OPEN,-- 1-bit output: CLKOUT4
CLKOUT5 => OPEN,-- 1-bit output: CLKOUT5
CLKOUT6 => OPEN,-- 1-bit output: CLKOUT6
-- Feedback Clocks: 1-bit (each) output: Clock feedback ports
CLKFBOUT => CLKFBOUT, -- 1-bit output: Feedback clock
CLKFBOUTB => open, -- 1-bit output: Inverted CLKFBOUT
-- Status Ports: 1-bit (each) output: MMCM status ports
LOCKED => LOCKED, -- 1-bit output: LOCK
-- Clock Inputs: 1-bit (each) input: Clock input
CLKIN1 => Clk, -- 1-bit input: Clock
-- Control Ports: 1-bit (each) input: MMCM control ports
PWRDWN => '0', -- 1-bit input: Power-down
RST => Reset, -- 1-bit input: Reset
-- Feedback Clocks: 1-bit (each) input: Clock feedback ports
CLKFBIN => CLKFBOUT -- 1-bit input: Feedback clock
);

RstSys <= not(Locked);
end Behavioral;

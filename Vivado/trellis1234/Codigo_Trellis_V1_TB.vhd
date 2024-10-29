----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 09:12:22
-- Design Name: 
-- Module Name: Codigo_Trellis_V1_TB - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Codigo_Trellis_V1_TB is
--  Port ( );
end Codigo_Trellis_V1_TB;

architecture Behavioral of Codigo_Trellis_V1_TB is

component Codigo_Trellis_V1 is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Hab : in STD_LOGIC;
           AN  : in STD_LOGIC;
           Addr_RAM : in STD_LOGIC_VECTOR (7 downto 0);
           Rd_RAM   : in STD_LOGIC;
           D_in: in STD_LOGIC_VECTOR (143 downto 0);
           Trellis: out STD_LOGIC_VECTOR (1 downto 0);
           End_Wr: out STD_LOGIC
           );
end Component;

signal Rst: std_logic;
signal Clk: std_logic;
--signal En: std_logic;
signal Hab: std_logic;
signal End_Wr: std_logic;
signal AN: std_logic;
signal D_in: STD_LOGIC_VECTOR (143 downto 0);
signal Trellis: std_logic_vector (1 downto 0);
signal Addr_RAM: std_logic_vector (7 downto 0);
signal Rd_RAM: std_logic;

constant clk100Mhz_period : time := 10 ns;

begin
Trellis_code_v1: Codigo_Trellis_V1
     port map (Rst  => Rst,
               Clk  => Clk,
               Hab  => Hab,
               AN   => AN,
               Addr_RAM => Addr_RAM,
               Rd_RAM => Rd_RAM,
               D_in => D_in,
               End_Wr => End_Wr,
               Trellis => Trellis              
               );

clk_process: process
        begin
             Clk <= '0';
             wait for clk100Mhz_period/2;
             Clk <= '1';
             wait for clk100Mhz_period/2;     
        end process;
        
Rst_proc: process
    begin        
     Rst <= '1';
     wait for 100 ns;    
     Rst <= '0';
     wait;
    end process;
       
--en_proc: process
--    begin        
--     En <= '0';
--     wait for 100 ns;    
--     EN <= '1';
--     wait;
----     wait for 100 ns;
--    end process;
        
    
 Hab_proc: process
    begin        
     Hab <= '0';
     wait for 100 ns;    
     Hab <= '1';
     wait for 10 ns;
     Hab <= '0';
     wait for 2070 ns;
     Hab <= '1';
     wait for 10 ns;
     Hab <= '0';
     wait for 2570 ns;
     Hab <= '1';
     wait for 10 ns;
     Hab <= '0';
     wait;
--     wait for 100 ns;
    end process;
    
 Sel_proc: process
    begin        
     AN <= '0';
     wait for 100 ns;
     AN <= '0';
     wait for 1730 ns;--1060 ns;
--     AN <= '0';
--     wait for 15 ns;--1060 ns;    
     AN <= '1';
     wait for 1440 ns; 
     AN <= '0';
     wait;
--     AN <= '1';
--     wait for 30 ns;
----     wait for 100 ns;
    end process;

data_proc: process
    begin        
     D_in <= (others =>'0');
     wait for 100 ns;
     --D_in <= x"000000000000FFEEFFAFAEAAFFEEFFAFAEAA";
     D_in <= x"000000000000222120191817161514131211";
     wait for 1730 ns;--1060 ns;
     --D_in <= x"FFEEFFAFAEAAFFEEFFAFAEAAFFEEFFAFAEAA";
     D_in <= x"282726252423222120191817161514131211";
     wait for 2220 ns;
     --D_in <= x"000000000000FFEEFFAFAEAAFFEEFFAFAEAA";
     D_in <= x"000000000000222120191817161514131211";
     wait for 1730 ns;--1060 ns;
     D_in <= (others =>'0');
     wait;
    end process;
 
 process
    begin
        Rd_RAM <= '0';
        for i in 0 to 117 loop
            Addr_RAM <= conv_std_logic_vector(i, 8);
            wait for 10ns;
        end loop;

        Rd_RAM <= '1';
        for i in 0 to 97 loop
            Addr_RAM <= conv_std_logic_vector(i, 8);
            --din <= conv_std_logic_vector(i + 45, 8);
            wait for 10ns;
        end loop;

        Rd_RAM <= '0';
        for i in 0 to 159 loop
            Addr_RAM <= conv_std_logic_vector(i, 8);
            wait for 10ns;
        end loop;           
        
        Rd_RAM <= '1';
        for i in 0 to 97 loop
            Addr_RAM <= conv_std_logic_vector(i, 8);
            --din <= conv_std_logic_vector(i + 45, 8);
            wait for 10ns;
        end loop;
        
--        we <= '1';
--        for i in 0 to 15 loop
--            address <= conv_std_logic_vector(i, 4);
--            din <= conv_std_logic_vector(i + 90, 8);
--            wait for 10ns;
--        end loop;

--        we <= '0';
--        for i in 0 to 15 loop
--            address <= conv_std_logic_vector(i, 4);
--            wait for 10ns;
--        end loop;             
   
    end process;
                           
end Behavioral;

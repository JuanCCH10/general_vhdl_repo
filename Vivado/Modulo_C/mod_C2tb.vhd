----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.08.2022 10:09:33
-- Design Name: 
-- Module Name: mod_C2tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_C2tb is
end mod_C2tb;

architecture Behavioral of mod_C2tb is

component mod_C2 is
    generic(num_bits : integer := 10);
    Port (
        A, B, C, D : in std_logic_vector(num_bits-1 downto 0);
        val_out : out std_logic_vector(num_bits-1 downto 0)
    );
end component;

constant num_bits : integer := 10;
signal A : std_logic_vector(num_bits-1 downto 0);
signal B : std_logic_vector(num_bits-1 downto 0);
signal C : std_logic_vector(num_bits-1 downto 0);
signal D : std_logic_vector(num_bits-1 downto 0);
signal val_out : std_logic_vector(num_bits-1 downto 0);
signal per : time := 10 ns;
signal clk : std_logic;

begin
    clk_gen : process begin
        clk <= '1';
        wait for per/2;
        clk <= '0';
        wait for per/2;
    end process;
    
    conexiones : mod_C2
    port map(
        A => A,
        B => B,
        C => C,
        D => D,
        val_out => val_out
    );
    
    estimulos : process begin
        A <= "0000000000";
        B <= "0000000000";
        C <= "0000000000";
        D <= "0000000000";
        wait for per;
        A <= "0000000000";
        B <= "0000000001";
        C <= "0000000001";
        D <= "0000000001";
        wait for per;
        A <= "0000000001";
        B <= "0000000000";
        C <= "0000000001";
        D <= "0000000001";
        wait for per;
        A <= "0000000001";
        B <= "0000000001";
        C <= "0000000000";
        D <= "0000000001";
        wait for per;
        A <= "0000000001";
        B <= "0000000001";
        C <= "0000000001";
        D <= "0000000000";
        wait for per;
        A <= "0000000100";
        B <= "0000000100";
        C <= "0000000010";
        D <= "0000000001";
        wait for per;
        A <= "0000000001";
        B <= "0000000010";
        C <= "0000000100";
        D <= "0000000100";
        wait for per;
        A <= "0000000000";
        B <= "0000000000";
        C <= "0000000000";
        D <= "0000000000";
        wait;
    end process;

end Behavioral;

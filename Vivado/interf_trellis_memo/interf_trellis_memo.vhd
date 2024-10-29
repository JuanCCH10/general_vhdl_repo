----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2022 14:40:34
-- Design Name: 
-- Module Name: interf_trellis_memo - Behavioral
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

entity interf_trellis_memo is
    Port (
        din_ent : in std_logic_vector(3 downto 0);
        dout_ent : out std_logic_vector(3 downto 0);
        addr_ent : in std_logic_vector(6 downto 0);
        clk : in std_logic;
        en : in std_logic
    );
end interf_trellis_memo;

architecture Behavioral of interf_trellis_memo is

    component single_port_RAM
        port(
            ram_addr : in std_logic_vector(6 downto 0);
            ram_data_in : in std_logic_vector(3 downto 0);
            ram_wr : in std_logic;
            ram_clk : in std_logic;
            ram_data_out : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component ROM_interl_trellis
        generic(
               Addrbits: integer := 7;
	           DataBits: integer := 8
		);
	   Port(
	       Clk : in STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (Addrbits-1 downto 0);
		   Rd : in STD_LOGIC;
		   Data : out STD_LOGIC_VECTOR (DataBits-1 downto 0)
	   );
    end component;
    signal bus_addr : std_logic_vector(7 downto 0);
    signal simb1 : std_logic_vector(1 downto 0);
    signal simb0 : std_logic_vector(1 downto 0);

begin
        
    con_ROM_RAM : ROM_interl_trellis
    port map(
        Clk => clk,
        Addr => addr_ent,
        Rd => en,
        Data => bus_addr
    );
    
    con_RAM_ROM : single_port_RAM
    port map(
        ram_addr => bus_addr(6 downto 0),
        ram_data_in => din_ent,
        ram_wr => en,
        ram_clk => clk,
        ram_data_out => dout_ent
    );
    
    

end Behavioral;

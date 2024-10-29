----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2022 15:29:12
-- Design Name: 
-- Module Name: interf_out_trellis - Behavioral
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

entity interf_out_trellis is
    Port (
        din : in std_logic_vector(3 downto 0);
        dout : out std_logic_vector(1 downto 0);
        clk : in std_logic;
        en : in std_logic
    );
end interf_out_trellis;

architecture Behavioral of interf_out_trellis is
    component dualin_port_ram
        port(
            dina : in std_logic_vector(1 downto 0);
            dinb : in std_logic_vector(1 downto 0);
            addra : in std_logic_vector(5 downto 0);
            addrb : in std_logic_vector(5 downto 0);
            clk : in std_logic;
            rw : in std_logic;
            dout : out std_logic_vector(1 downto 0)
        );
    end component;
    
    component ROM_dib0
        generic(
            Addrbits: integer := 6;
			DataBits: integer := 8
		);
        port(
            Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0)
        );
    end component;
    
    component ROM_dib1
        generic(
            Addrbits: integer := 6;
			DataBits: integer := 8
		);
        port(
            Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0)
        );
    end component;
    signal datos : std_logic_vector(3 downto 0);
    signal contador : std_logic_vector(5 downto 0);
    signal addr_a : std_logic_vector(7 downto 0);
    signal addr_b : std_logic_vector(7 downto 0);

begin

    ROMdib0 : ROM_dib0
    port map(
        Clk => clk,
        Rd => en,
        Addr => contador,
        Data => addr_a
    );
    
    ROMdib1 : ROM_dib1
    port map(
        Clk => clk,
        Rd => en,
        Addr => contador,
        Data => addr_b
    );
    
    RAMcon : dualin_port_ram
    port map(
        dina => datos(3 downto 2),
        dinb => datos(1 downto 0),
        addra => addr_a(5 downto 0),
        addrb => addr_b(5 downto 0),
        clk => clk,
        rw => en,
        dout => dout
    );
    
    datos <= din;


end Behavioral;

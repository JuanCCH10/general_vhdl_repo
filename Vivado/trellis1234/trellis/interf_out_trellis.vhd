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
        Rst : in std_logic;
        clk : in std_logic;
        True_L : in std_logic;
        Wr_12: in std_logic;
        Wr_34: in std_logic;
        Addr_RAM: in std_logic_vector (7 downto 0);
        Rd_RAM: in std_logic;
        Sw_addr: in std_logic; 
        din : in std_logic_vector(3 downto 0);
        dout : out std_logic_vector(1 downto 0);
        End_Wr: out std_logic
    );
end interf_out_trellis;

architecture Behavioral of interf_out_trellis is
    component dualin_port_ram
        port(
            dina : in std_logic_vector(1 downto 0);
            dinb : in std_logic_vector(1 downto 0);
            addra : in std_logic_vector(7 downto 0);
            addrb : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            rw : in std_logic;
            rd : in std_logic;
            dout : out std_logic_vector(1 downto 0)
        );
    end component;
    
    component ROM_dib0
        generic(
            Addrbits: integer := 6;
			DataBits: integer := 8
		);
        port(
            Rst : in  STD_LOGIC;
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
            Rst : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
			Addr: in  STD_LOGIC_VECTOR (Addrbits-1 downto 0);
			Rd	: in  STD_LOGIC;
			Data: out  STD_LOGIC_VECTOR (DataBits-1 downto 0)
        );
    end component;
    
    signal datos : std_logic_vector(3 downto 0);   
    signal contador : std_logic_vector(5 downto 0);
    signal contador1 : std_logic_vector(5 downto 0);
    
    signal addr_a : std_logic_vector(7 downto 0);
    signal addr_b : std_logic_vector(7 downto 0);
    
component contador_limit_in is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           BusOut	: out STD_LOGIC_VECTOR(Nbits-1 downto 0);
           dout : out STD_LOGIC);
end component;

component divisor_limit is
generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           dout : out STD_LOGIC);
end component;

component Detec_flancos is
    Port ( clk:in STD_LOGIC;
	        Entrada : in  STD_LOGIC;
           PulsoB : out  STD_LOGIC;
		  PulsoS : out  STD_LOGIC);
end component;

component contador_en is
    generic (Nbits : integer := 10;
            Limit : integer := 650
            ); 
    Port ( rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           BusOut	: out STD_LOGIC_VECTOR(Nbits-1 downto 0));
           --dout : out STD_LOGIC);
end component;

signal BusOut: std_logic_vector (1 downto 0);
signal D1: std_logic;
signal Wr_RAM: std_logic_vector (0 downto 0);
signal Wr_RAM_TR: std_logic_vector (0 downto 0);
signal Flag_end: std_logic;
signal M_Rst: std_logic;
signal Aux: std_logic;
signal On_addr: std_logic;
signal Addr_RAM_Tr: std_logic_vector (7 downto 0);
--signal Addr_RAM_b: std_logic_vector (6 downto 0);

component Shift_Register_n is
    Generic(long_Reg: integer := 100;
            DataBits: integer := 18
    );
    Port (  Reset : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0);
            CE    : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR(DataBits-1 DOWNTO 0)
    );
end component;

begin

    ROMdib0 : ROM_dib0
    port map(
        Rst => Rst,
        Clk => clk,
        Rd => Wr_RAM (0),
        Addr => contador,
        Data => addr_a
    );
    
    ROMdib1 : ROM_dib1
    port map(
        Rst => Rst,
        Clk => clk,
        Rd => Wr_RAM (0),
        Addr => contador,
        Data => addr_b
    );
    
    RAMcon : dualin_port_ram
    port map(
        dina => datos(3 downto 2),
        dinb => datos(1 downto 0),
        addra => Addr_RAM_Tr ,
        addrb => addr_b,--Addr_RAM_b,--addr_b(5 downto 0),
        clk => clk,
        rw => Wr_RAM_TR (0),
        rd => Rd_RAM, 
        dout => dout
    );
 
Addr_RAM_Tr <= Addr_RAM when Aux = '0' else addr_a;--'0' & addr_a(5 downto 0);
--Addr_RAM_b  <= '0' &  addr_b(5 downto 0);
  
  Wr_RAM (0) <= Wr_12 or Wr_34;
     
process (clk, M_Rst)
begin
 if rising_edge (clk) then
    if M_Rst = '1' then
        Aux <= '0';
        else
        if On_addr = '1' then
         Aux <= '1';
        end if;
    end if;
 end if;
end process;

       
contador_12: contador_limit_in
    generic map (Nbits => 6,
                Limit => 48
                )
    port map (rst => Rst,--M_rst,
               en => Wr_RAM (0),
               clk => clk,
               BusOut => contador1,
               dout => open
               );

Ret_conta: Shift_Register_n
Generic map(long_Reg=> 1,
            DataBits=> 6)
Port map (  Reset => Rst,
            D     => contador1,
            CE    => '1',
            CLK   => Clk,
            Q     => contador
             );
               
Ret_WR: Shift_Register_n
Generic map(long_Reg=> 1,
            DataBits=> 1)
Port map (  Reset => Rst,
            D     => Wr_RAM,
            CE    => '1',
            CLK   => Clk,
            Q     => Wr_RAM_TR);
            
Ret_data: Shift_Register_n
Generic map(long_Reg=> 1,
            DataBits=> 4)
Port map (  Reset => Rst,
            D     => din,
            CE    => '1',
            CLK   => Clk,
            Q     => datos); 
                                                 

Detector2: Detec_flancos
    port map(clk => clk,
            Entrada => True_L,
            PulsoB => Flag_end,
            PulsoS=> open
            );

End_Wr <= Flag_end;
M_Rst <= Rst or Flag_end;
On_addr <= Sw_addr;
                      
end Behavioral;

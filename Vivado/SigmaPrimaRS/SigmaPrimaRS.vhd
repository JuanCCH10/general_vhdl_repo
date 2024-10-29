library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Arrays_Forney.all;

entity SigmaPrimaRS is
port
(
    Reset      : in std_logic;
    Clk        : in std_logic;
    En         : in std_logic;
    d_in       : in Array_d;
    Symbols_Bk : out Array_d;
    Done       : out std_logic
);
end SigmaPrimaRS;

architecture Behavioral of SigmaPrimaRS is
component symb_shift_reg_RS_en is
Port 
(
    rst     : in std_logic;
    clk     : in std_logic;
    load    : in std_logic;
    shift   : in std_logic;
    d_in    : in Array_d;
    q_out   : out std_logic_vector(5 downto 0);
    q_valid : out std_logic;
    fin     : out std_logic
);
end component;

component Build_Bk_RS is
Port
(
    Reset       : in std_logic;
    Clk         : in std_logic;
    En          : in std_logic;
    B_valid     : in std_logic;
    B_in        : in std_logic_vector(5 downto 0);
    Load_out    : out std_logic;
    Shift_out   : out std_logic;
    IndexBk_out : out Array_Ik;
    Bk_out      : out Array_Bk;
    Bk_valid    : out std_logic
);
end component;

component SigmaP_RS is
Port
(
    Reset       : in std_logic;
    Clk         : in std_logic;
    En          : in std_logic;
    Bk_in       : in Array_Bk;
    Sigma_out   : out Array_Bk;
    Sigma_valid : out std_logic
);
end component;

component Build_Symbols_RS is
Port
(
    Reset        : in std_logic;
    Clk          : in std_logic;
    En           : in std_logic;
    En_index     : in std_logic;
    En_Sigma     : in std_logic;
    Index        : in Array_Ik;
    Sigma        : in Array_Bk;
    Symbol_valid : out std_logic;
    Symbol_Data  : out Array_d
);
end component;

signal load               : std_logic;
signal shift              : std_logic;
signal qOut               : std_logic_vector(5 downto 0);
signal qValid             : std_logic;
signal SymbShiftRegRSDone : std_logic;
signal SymbShRegRSDoneFF1 : std_logic; 
signal EnFF1              : std_logic;
signal EnFF2              : std_logic;
signal Bvalid             : std_logic;
signal ResetBk            : std_logic;
signal Bin                : std_logic_vector(5 downto 0);
signal IndexBk            : Array_Ik;
signal BkBuild            : Array_Bk;
signal BkValid            : std_logic;
signal SigmaData          : Array_Bk;
signal SigmaValid         : std_logic;
begin

F0: symb_shift_reg_RS_en
Port map
(
    rst     => Reset,
    clk     => Clk,
    load    => load,
    shift   => shift,
    d_in    => d_in,
    q_out   => qOut,
    q_valid => qValid,
    fin     => SymbShiftRegRSDone
);

F1: Build_Bk_RS
Port map
(
    Reset       =>Reset,
    Clk         =>Clk,
    En          =>En,
    B_valid     =>Bvalid,
    B_in        =>Bin,
    Load_out    =>load,
    Shift_out   =>shift,
    IndexBk_out =>IndexBk,
    Bk_out      =>BkBuild,
    Bk_valid    =>BkValid
);

F2 : SigmaP_RS
Port map
(
    Reset       =>Reset,
    Clk         =>Clk,
    En          =>BkValid,
    Bk_in       =>BkBuild,
    Sigma_out   =>SigmaData,
    Sigma_valid =>SigmaValid
);

F3 : Build_Symbols_RS
Port map
(
    Reset        =>Reset,
    Clk          =>Clk,
    En           =>En,
    En_index     =>BkValid,
    En_Sigma     =>SigmaValid,
    Index        =>IndexBk,
    Sigma        =>SigmaData,
    Symbol_valid =>Done,
    Symbol_Data  =>Symbols_Bk
);

Bin    <= qOut;
Bvalid <= qValid;
end Behavioral;

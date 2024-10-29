

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


Package Arrays_Forney is
    constant Length_Symbols : integer:=36;
    constant Length_Bk      : integer:=8;
    constant Length_a0BiBk  : integer:=8;
    
    constant Bits_IndexBk   : integer:=6;
    constant Bits_Symbols   : integer:=6;
    
    type Array_d      is array (0 to Length_symbols-1) of std_logic_vector(Bits_Symbols-1 downto 0);
    type Array_Bk     is array (0 to  Length_Bk-1) of std_logic_vector(Bits_Symbols-1 downto 0);
    type Array_Ik     is array (0 to  Length_Bk-1) of std_logic_vector(Bits_IndexBk-1 downto 0);
    type Array_a0BiBk is array (0 to Length_a0BiBk-1) of std_logic_vector(Bits_Symbols-1 downto 0);
    
    signal value : Array_d:=
    (
        others=>"000000"
    );
    signal value3 : Array_Bk:=
    (
        others=>"000000"
    );
    signal value5 : Array_Ik:=
    (
        others=>"000000"
    );
--    signal value6 : Array_Ik2:=
--    (
--        others=>"00000"
--    );
    signal value7 : Array_a0BiBk:=
    (
        others=>"000000"
    );

end Arrays_Forney;

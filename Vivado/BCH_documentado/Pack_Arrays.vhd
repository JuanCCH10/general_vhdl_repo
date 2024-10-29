----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 

----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


package Pack_Array is
    Constant Length_Array_Ax : integer:=5;
    Constant Bits_Array_Ax   : integer:=5;
    
    type Array_Ax is array (0 to Length_Array_Ax-1) of std_logic_vector(Bits_Array_Ax-1 downto 0);
----------------------------------------------------------------------------------    
    Constant Val_Init : Array_Ax:=
    (
       "00001",
       "10100",
       "00110",
       "00110",
       "10000" 
    );
----------------------------------------------------------------------------------
end Pack_Array;

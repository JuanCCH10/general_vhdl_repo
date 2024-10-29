----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Use work.Pack_Array.all;

entity BMA is
Generic( BitsSyndrome : integer :=5;
         AddrSyndrome : integer :=4);
Port
(
    Reset   : in std_logic;
    Clk     : in std_logic;
    En      : in std_logic;
    Sk      : in std_logic_vector(BitsSyndrome-1 downto 0);--sindrome
    Ski     : in std_logic_vector(BitsSyndrome-1 downto 0);--sindrome - 1
    Addr_K  : out std_logic_vector(AddrSyndrome-1 downto 0);
    Addr_Ki : out std_logic_vector(AddrSyndrome-1 downto 0);
      
);
end BMA;

architecture Behavioral of BMA is
--COMPONENTES-------------------------------------------------------------------
component Dec_To_GF is
Generic(Bits5 : integer:=5);
Port
(
    G1_d   : in std_logic_vector(Bits5-1 downto 0);
    G1_Ax  : in std_logic_vector(Bits5-1 downto 0);
    Exp_d  : out std_logic_vector(Bits5-1 downto 0);
    Exp_Ax : out std_logic_vector(Bits5-1 downto 0)
);
end component;

component GaloisField_Add_5 is
generic( Bits5    : integer:=5;
         AddrBits : integer:=5);
Port
(
    Clk      : in std_logic;
    En       : in std_logic;
    RowAddr  : in std_logic_vector(AddrBits-1 downto 0);
    ColAddr  : in std_logic_vector(addrBits-1 downto 0);
    Dout     : out std_logic_vector(Bits5-1 downto 0)
);
end component;
--MAQUINA DE ESTADOS------------------------------------------------------------
Type BMA_State is (Verify,Init,dk,dk1,dk2,d0,wait1,done);
signal State     : BMA_State;
--ARREGLOS----------------------------------------------------------------------
Signal tx        : Array_Ax;
Signal Bx        : Array_Ax;
Signal Ax        : Array_Ax;
Signal d2        : Array_Ax:=(others=>(others=>'0'));     --Arreglo que guarda a los sindromes S(K-i)
Signal d2_aux    : Array_Ax;
Signal x         : Array_Ax:=(others=>(others=>'0'));
Signal xBx       : Array_Ax:=(others=>(others=>'0'));
--CONSTANTES--------------------------------------------------------------------
Constant N       : integer:=8;
Constant Bits5   : integer:=5;
Constant SZero   : std_logic:='1';                        --Señal de prueba (Si los sindromes son ceros no hay error)
--SEÑALES-----------------------------------------------------------------------
Signal K         : integer range 1 to 9;                  --K es la señal que va a ir incrmentandose para realizar las iteraciones
Signal j         : integer range 1 to 4;                  --J es la señal que indica el grado de la multiplicación de la variable x y el grado será la posición
Signal L         : integer range 0 to 4;                  --L es la señal que va a incrementarse siempre y cuando 2L<K
Signal d         : std_logic_vector(Bits5-1 downto 0);    --d guarda la operación que se realiza con Sk y S(k-i)
Signal d1        : std_logic_vector(Bits5-1 downto 0);    --d1 guarda el sindrome Sk
Signal d3        : std_logic_vector(Bits5-1 downto 0);    
Signal dm        : std_logic_vector(Bits5-1 downto 0);    --dm guarda a d
Signal dm_Inv    : std_logic_vector(Bits5-1 downto 0);    --
Signal d_dmInv   : std_logic_vector(Bits5-1 downto 0);

Signal G1_Ax     : std_logic_vector(Bits5-1 downto 0);
Signal G1_d      : std_logic_vector(Bits5-1 downto 0);
Signal Exp_d     : std_logic_vector(Bits5-1 downto 0);
Signal Exp_Ax    : std_logic_vector(Bits5-1 downto 0);
Signal DoutGF    : std_logic_vector(Bits5-1 downto 0);

Signal ContAux   : integer;
--CONTADORES---------------------------------------------------------------------
Signal Grado     : integer;
Signal ContGrado : integer;
Signal Cont_i    : integer;                                 --Contador de las iteraciones de i
---------------------------------------------------------------------------------
begin

--INSTANCIACIÓN------------------------------------------------------------------
U1_0_Dec_To_GF : Dec_To_GF
Generic map
(
Bits5 =>5
)
Port map
(
    G1_d   =>G1_d,
    G1_Ax  =>G1_Ax,
    Exp_d  =>Exp_d,
    Exp_Ax =>Exp_Ax
);
U1_1_GaloisField_Add_5 : GaloisField_Add_5
generic map
(
    Bits5    =>5,
    AddrBits =>5
)
Port map
(
    Clk      =>Clk,
    En       =>En,
    RowAddr  =>Exp_d,
    ColAddr  =>Exp_Ax,
    Dout     =>DoutGF
);

process(Reset,Clk)is
begin
    if Reset='1' then
        tx        <= Val_Init;
        Bx        <= Val_Init;
        Ax        <= Val_Init;
        d2        <= (others=>(others=>'0'));
        x         <= (others=>(others=>'0')); 
        xBx       <= (others=>(others=>'0'));
        K         <= 1;
        j         <= 1; 
        L         <= 0;
        Grado     <= 0;
        ContGrado <= 0;
        Cont_i    <= 1;
        d         <= (others=>'0');
        d1        <= (others=>'0');
        d3        <= (others=>'0');
        dm        <= "00001";
        dm_Inv    <= (others=>'0');
        d_dmInv   <= (others=>'0');
        G1_Ax     <= (others=>'0');
        G1_d      <= (others=>'0');
        d2_aux    <= (others=>(others=>'0'));
    elsif rising_edge(Clk) then
        if En = '1' then
            Case State is
                When Verify =>
                    if SZero = '1' then
                        State <= Init;
                    end if;
                When Init =>
                    tx        <= Val_Init;
                    Ax        <= Val_Init;
                    Bx        <= Val_Init;
                    j         <= 1;
                    K         <= 1;--cantidad de errores
                    L         <= 0;--                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     variable iteracion
                    Grado     <= 0;
                    ContGrado <= 0;
                    Cont_i    <= 1;
                    dm        <= "00001"; 
                    d2        <= (others=>(others=>'0')); 
                    d2_aux    <= (others=>(others=>'0'));
                    State     <= dk;
                When dk =>
                    if K <= N then
                        d1 <= Sk; 
                        State <= dk1;                 
                    else
                        State <= done;
                    end if;
                When dk1 =>
                    if L=0 then
                        d2 <= (others=>(others=>'0'));
                        State <= dk2;
                    else
                        if Cont_i<=L then                          
                            d2(Cont_i-1)<=Ski;
                            Cont_i<=Cont_i+1;                           
                        else
                            State <= dk2;
                            Cont_i<=1;
                        end if;
                    end if;
                When dk2 =>
                       if Cont_i < 5 then
                            if d2(Cont_i-1) ="00000" or Ax(Cont_i)="00000" then
                                d2_aux(Cont_i-1)<=(others=>'0');
                            else
                                G1_Ax <= Ax(Cont_i);
                                G1_d  <= d2(Cont_i-1);
                                State <= wait1;
                                d2_aux(Cont_i-1)<=DoutGF;
                            end if;
                            Cont_i<=Cont_i+1;
                       else
                            State <= done;
                       end if;
                When wait1 =>
--                    d2_aux(Cont_i-1)<=DoutGF;
                    State <= dk2;
                When d0 =>
                    j<=j+1;
                    K<=K+1;
                    State <= dk;       
                When done =>
                    State <= Init;
            end Case;
        end if;
    end if;
end process;

Addr_K  <= conv_std_logic_vector(K,AddrSyndrome);
Addr_Ki <= CONV_STD_LOGIC_VECTOR(K-Cont_i,AddrSyndrome);
ContAux <= Cont_i;
end Behavioral;

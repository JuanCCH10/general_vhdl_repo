library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use work.Modulos_Genericos_Pkg.all;

entity Ax_evaluator_RS is
    Port (
        rst, clk, hab : in std_logic;
        j : in std_logic_vector(5 downto 0);
        d : in std_logic_vector(5 downto 0);
        dm : in std_logic_vector(5 downto 0);
        Ax0  : in std_logic_vector(5 downto 0);
        Ax1  : in std_logic_vector(5 downto 0);
        Ax2  : in std_logic_vector(5 downto 0);
        Ax3  : in std_logic_vector(5 downto 0);
        Ax4  : in std_logic_vector(5 downto 0);
        Ax5  : in std_logic_vector(5 downto 0);
        Ax6  : in std_logic_vector(5 downto 0);
        Ax7  : in std_logic_vector(5 downto 0);
        Ax8  : in std_logic_vector(5 downto 0);
        Ax9  : in std_logic_vector(5 downto 0);
        Ax10 : in std_logic_vector(5 downto 0);
        Ax11 : in std_logic_vector(5 downto 0);
        Ax12 : in std_logic_vector(5 downto 0);
        Ax13 : in std_logic_vector(5 downto 0);
        Ax14 : in std_logic_vector(5 downto 0);
        Ax15 : in std_logic_vector(5 downto 0);
        Bx0  : in std_logic_vector(5 downto 0);
        Bx1  : in std_logic_vector(5 downto 0);
        Bx2  : in std_logic_vector(5 downto 0);
        Bx3  : in std_logic_vector(5 downto 0);
        Bx4  : in std_logic_vector(5 downto 0);
        Bx5  : in std_logic_vector(5 downto 0);
        Bx6  : in std_logic_vector(5 downto 0);
        Bx7  : in std_logic_vector(5 downto 0);
        Bx8  : in std_logic_vector(5 downto 0);
        Bx9  : in std_logic_vector(5 downto 0);
        Bx10 : in std_logic_vector(5 downto 0);
        Bx11 : in std_logic_vector(5 downto 0);
        Bx12 : in std_logic_vector(5 downto 0);
        Bx13 : in std_logic_vector(5 downto 0);
        Bx14 : in std_logic_vector(5 downto 0);
        Bx15 : in std_logic_vector(5 downto 0);
        A0 : out std_logic_vector(5 downto 0);
        A1 : out std_logic_vector(5 downto 0);
        A2 : out std_logic_vector(5 downto 0);
        A3 : out std_logic_vector(5 downto 0);
        A4 : out std_logic_vector(5 downto 0);
        A5 : out std_logic_vector(5 downto 0);
        A6 : out std_logic_vector(5 downto 0);
        A7 : out std_logic_vector(5 downto 0);
        A8 : out std_logic_vector(5 downto 0);
        A9 : out std_logic_vector(5 downto 0);
        A10 : out std_logic_vector(5 downto 0);
        A11 : out std_logic_vector(5 downto 0);
        A12 : out std_logic_vector(5 downto 0);
        A13 : out std_logic_vector(5 downto 0);
        A14 : out std_logic_vector(5 downto 0);
        A15 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
end Ax_evaluator_RS;

architecture Behavioral of Ax_evaluator_RS is
    
    component mux_bits2alpha is
        Port (
            pointer : in std_logic_vector(5 downto 0); --dir 0 -> 63
            value : out std_logic_vector(5 downto 0)
        );
    end component;
    
    component d_dm_1 is
    Port (
        d :  in std_logic_vector(5 downto 0);
        dm : in std_logic_vector(5 downto 0);
        ddm1 : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component prod_alpha is
        Port (
            alphaA : in std_logic_vector(5 downto 0);
            alphaB : in std_logic_vector(5 downto 0);
            alphaR : out std_logic_vector(5 downto 0)
        );
    end component;
    
    component sumador_nbits is
    generic(nbits : integer := 10);
    Port (
        A : in std_logic_vector(nbits-1 downto 0);
        B : in std_logic_vector(nbits-1 downto 0);
        S : out std_logic_vector(nbits downto 0)
    );
    end component;
    
    component symbol_shift_reg is
    Port (
        clk, rst, hab : in std_logic;
        shift : in std_logic_vector(5 downto 0);
        d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15 : in std_logic_vector(5 downto 0);
        q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15 : out std_logic_vector(5 downto 0);
        fin : out std_logic
    );
    end component;
    
    signal dm_aux, dm_pot, d_pot, menos1 : std_logic_vector(5 downto 0);
    signal C1 : std_logic_vector(6 downto 0);
    signal C2 : std_logic_vector(7 downto 0);
    signal addr_ddm1 : std_logic_vector(11 downto 0);
    
    type symbol_long is array (0 to 15) of std_logic_vector(5 downto 0);
    signal aux_prod, xj_ddm1Bx : symbol_long;    
    
begin
    ------------------------------------------------------------------------------------------------------------------------------------------        

    d_dm1_module : d_dm_1
    port map(
        d => d,
        dm => dm,
        ddm1 => dm_aux
    );
    
    aux0 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx0, --(bx_i)
        alphaR => aux_prod(0)   
    );
    
    aux1 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx1, --(bx_i)
        alphaR => aux_prod(1)   
    );
    
    aux2 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx2, --(bx_i)
        alphaR => aux_prod(2)   
    );
    
    aux3 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx3, --(bx_i)
        alphaR => aux_prod(3)   
    );
    
    aux4 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx4, --(bx_i)
        alphaR => aux_prod(4)   
    );
    
    aux5 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx5, --(bx_i)
        alphaR => aux_prod(5)   
    );
    
    aux6 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx6, --(bx_i)
        alphaR => aux_prod(6)   
    );
    
    aux7 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx7, --(bx_i)
        alphaR => aux_prod(7)   
    );
    
    aux8 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx8, --(bx_i)
        alphaR => aux_prod(8)   
    );
    
    aux9 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx9, --(bx_i)
        alphaR => aux_prod(9)   
    );
    
    aux10 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx10, --(bx_i)
        alphaR => aux_prod(10)   
    );
    
    aux11 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx11, --(bx_i)
        alphaR => aux_prod(11)   
    );
    
    aux12 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx12, --(bx_i)
        alphaR => aux_prod(12)   
    );
    
    aux13 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx13, --(bx_i)
        alphaR => aux_prod(13)   
    );
    
    aux14 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx14, --(bx_i)
        alphaR => aux_prod(14)   
    );
    
    aux15 : prod_alpha
    port map(
        alphaA => dm_aux,
        alphaB => Bx15, --(bx_i)
        alphaR => aux_prod(15)   
    );
    
    -- negar
    menos1 <= "111110";
    --C1 
    menos_1 : sumador_nbits
    generic map( nbits => 6)
    port map(
        A => menos1,
        B => "000001",
        S => C1
    );
    --C2
    j_menos_1 : sumador_nbits
    generic map( nbits => 7)
    port map(
        A => "0" & j,
        B => C1,
        S => C2
    ); 
    
    xj_ddm1Bx_shift : symbol_shift_reg
    port map(
        clk => clk,
        rst => rst,
        hab => hab,
        shift => C2(5 downto 0),
        d0  => aux_prod(0),
        d1  => aux_prod(1),
        d2  => aux_prod(2),
        d3  => aux_prod(3),
        d4  => aux_prod(4),
        d5  => aux_prod(5),
        d6  => aux_prod(6),
        d7  => aux_prod(7),
        d8  => aux_prod(8),
        d9  => aux_prod(9),
        d10 => aux_prod(10),
        d11 => aux_prod(11),
        d12 => aux_prod(12),
        d13 => aux_prod(13),
        d14 => aux_prod(14),
        d15 => aux_prod(15),
        q0  => xj_ddm1Bx(0),
        q1  => xj_ddm1Bx(1),
        q2  => xj_ddm1Bx(2),
        q3  => xj_ddm1Bx(3),
        q4  => xj_ddm1Bx(4),
        q5  => xj_ddm1Bx(5),
        q6  => xj_ddm1Bx(6),
        q7  => xj_ddm1Bx(7),
        q8  => xj_ddm1Bx(8),
        q9  => xj_ddm1Bx(9),
        q10 => xj_ddm1Bx(10),
        q11 => xj_ddm1Bx(11),
        q12 => xj_ddm1Bx(12),
        q13 => xj_ddm1Bx(13),
        q14 => xj_ddm1Bx(14),
        q15 => xj_ddm1Bx(15),
        fin => fin
    );
    
    ------------------------------------------------------------------------------------------------------------------------------------------
    -- aux_Ax( bx_i ) = Ax( bx_i ) + ddm_1Bx( bx_i )
    A0  <= Ax0 xor xj_ddm1Bx(0);
    A1  <= Ax1 xor xj_ddm1Bx(1);
    A2  <= Ax2 xor xj_ddm1Bx(2);
    A3  <= Ax3 xor xj_ddm1Bx(3);
    A4  <= Ax4 xor xj_ddm1Bx(4);
    A5  <= Ax5 xor xj_ddm1Bx(5);
    A6  <= Ax6 xor xj_ddm1Bx(6);
    A7  <= Ax7 xor xj_ddm1Bx(7);
    A8  <= Ax8 xor xj_ddm1Bx(8);
    A9  <= Ax9 xor xj_ddm1Bx(9);
    A10 <= Ax10 xor xj_ddm1Bx(10);
    A11 <= Ax11 xor xj_ddm1Bx(11);
    A12 <= Ax12 xor xj_ddm1Bx(12);
    A13 <= Ax13 xor xj_ddm1Bx(13);
    A14 <= Ax14 xor xj_ddm1Bx(14);
    A15 <= Ax15 xor xj_ddm1Bx(15);
    
    
end Behavioral;

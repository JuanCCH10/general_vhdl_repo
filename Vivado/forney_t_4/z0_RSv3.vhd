----------------------------------------------------------------------------------
-- Modulo evaluador de z0 para el algoritmo de Forney. 
-- Otro enfoque para verificación de la evaluación de z0(x)
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Modulos_Genericos_Pkg.all;

entity z0_RSv3 is
    Port (
        clk     : in std_logic;
        rst     : in std_logic;
        hab     : in std_logic;
        t2      : in std_logic_vector(1 downto 0);
        s1      : in std_logic_vector(5 downto 0);
        s2      : in std_logic_vector(5 downto 0);
        s3      : in std_logic_vector(5 downto 0);
        s4      : in std_logic_vector(5 downto 0);
        s5      : in std_logic_vector(5 downto 0);
        s6      : in std_logic_vector(5 downto 0);
        s7      : in std_logic_vector(5 downto 0);
        s8      : in std_logic_vector(5 downto 0);
        sigma1  : in std_logic_vector(5 downto 0);
        sigma2  : in std_logic_vector(5 downto 0);
        sigma3  : in std_logic_vector(5 downto 0);
        sigma4  : in std_logic_vector(5 downto 0);
        sigma5  : in std_logic_vector(5 downto 0);
        sigma6  : in std_logic_vector(5 downto 0);
        sigma7  : in std_logic_vector(5 downto 0);
        beta0   : in std_logic_vector(5 downto 0);
        beta1   : in std_logic_vector(5 downto 0);
        beta2   : in std_logic_vector(5 downto 0);
        beta3   : in std_logic_vector(5 downto 0);
        beta4   : in std_logic_vector(5 downto 0);
        beta5   : in std_logic_vector(5 downto 0);
        beta6   : in std_logic_vector(5 downto 0);
        beta7   : in std_logic_vector(5 downto 0);
        beta8   : in std_logic_vector(5 downto 0);
        beta9   : in std_logic_vector(5 downto 0);
        beta10  : in std_logic_vector(5 downto 0);
        beta11  : in std_logic_vector(5 downto 0);
        beta12  : in std_logic_vector(5 downto 0);
        beta13  : in std_logic_vector(5 downto 0);
        beta14  : in std_logic_vector(5 downto 0);
        beta15  : in std_logic_vector(5 downto 0);
        beta16  : in std_logic_vector(5 downto 0);
        beta17  : in std_logic_vector(5 downto 0);
        beta18  : in std_logic_vector(5 downto 0);
        beta19  : in std_logic_vector(5 downto 0);
        beta20  : in std_logic_vector(5 downto 0);
        beta21  : in std_logic_vector(5 downto 0);
        beta22  : in std_logic_vector(5 downto 0);
        beta23  : in std_logic_vector(5 downto 0);
        beta24  : in std_logic_vector(5 downto 0);
        beta25  : in std_logic_vector(5 downto 0);
        beta26  : in std_logic_vector(5 downto 0);
        beta27  : in std_logic_vector(5 downto 0);
        beta28  : in std_logic_vector(5 downto 0);
        beta29  : in std_logic_vector(5 downto 0);
        beta30  : in std_logic_vector(5 downto 0);
        beta31  : in std_logic_vector(5 downto 0);
        beta32  : in std_logic_vector(5 downto 0);
        beta33  : in std_logic_vector(5 downto 0);
        beta34  : in std_logic_vector(5 downto 0);
        beta35  : in std_logic_vector(5 downto 0);
        z0      : out std_logic_vector(5 downto 0);
        z1      : out std_logic_vector(5 downto 0);
        z2      : out std_logic_vector(5 downto 0);
        z3      : out std_logic_vector(5 downto 0);
        z4      : out std_logic_vector(5 downto 0);
        z5      : out std_logic_vector(5 downto 0);
        z6      : out std_logic_vector(5 downto 0);
        z7      : out std_logic_vector(5 downto 0);
        z8      : out std_logic_vector(5 downto 0);
        z9      : out std_logic_vector(5 downto 0);
        z10     : out std_logic_vector(5 downto 0);
        z11     : out std_logic_vector(5 downto 0);
        z12     : out std_logic_vector(5 downto 0);
        z13     : out std_logic_vector(5 downto 0);
        z14     : out std_logic_vector(5 downto 0);
        z15     : out std_logic_vector(5 downto 0);
        z16     : out std_logic_vector(5 downto 0);
        z17     : out std_logic_vector(5 downto 0);
        z18     : out std_logic_vector(5 downto 0);
        z19     : out std_logic_vector(5 downto 0);
        z20     : out std_logic_vector(5 downto 0);
        z21     : out std_logic_vector(5 downto 0);
        z22     : out std_logic_vector(5 downto 0);
        z23     : out std_logic_vector(5 downto 0);
        z24     : out std_logic_vector(5 downto 0);
        z25     : out std_logic_vector(5 downto 0);
        z26     : out std_logic_vector(5 downto 0);
        z27     : out std_logic_vector(5 downto 0);
        z28     : out std_logic_vector(5 downto 0);
        z29     : out std_logic_vector(5 downto 0);
        z30     : out std_logic_vector(5 downto 0);
        z31     : out std_logic_vector(5 downto 0);
        z32     : out std_logic_vector(5 downto 0);
        z33     : out std_logic_vector(5 downto 0);
        z34     : out std_logic_vector(5 downto 0);
        z35     : out std_logic_vector(5 downto 0);
        fin     : out std_logic
    );
end z0_RSv3;

architecture Behavioral of z0_RSv3 is
    
    component z0_coef is
    Port (
        s1  : in std_logic_vector(5 downto 0);
        s2  : in std_logic_vector(5 downto 0);
        s3  : in std_logic_vector(5 downto 0);
        s4  : in std_logic_vector(5 downto 0);
        s5  : in std_logic_vector(5 downto 0);
        s6  : in std_logic_vector(5 downto 0);
        s7  : in std_logic_vector(5 downto 0);
        s8  : in std_logic_vector(5 downto 0);
        ax1  : in std_logic_vector(5 downto 0);
        ax2  : in std_logic_vector(5 downto 0);
        ax3  : in std_logic_vector(5 downto 0);
        ax4  : in std_logic_vector(5 downto 0);
        ax5  : in std_logic_vector(5 downto 0);
        ax6  : in std_logic_vector(5 downto 0);
        ax7  : in std_logic_vector(5 downto 0);
        coef1  : out std_logic_vector(5 downto 0);
        coef2  : out std_logic_vector(5 downto 0);
        coef3  : out std_logic_vector(5 downto 0);
        coef4  : out std_logic_vector(5 downto 0);
        coef5  : out std_logic_vector(5 downto 0);
        coef6  : out std_logic_vector(5 downto 0);
        coef7  : out std_logic_vector(5 downto 0);
        coef8  : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component prod_alpha is
    Port (
        alphaA : in std_logic_vector(5 downto 0);
        alphaB : in std_logic_vector(5 downto 0);
        alphaR : out std_logic_vector(5 downto 0)
    );
    end component;
    
    component FF_en is
        generic (Nbits : integer := 6); 
        Port (
            rst, clk, en : in std_logic;
            D : in std_logic_vector(Nbits-1 downto 0);
            Q : out std_logic_vector(Nbits-1 downto 0)
        );
    end component;
    
    type coef_array is array (1 to 8) of std_logic_vector(5 downto 0);
    signal coef : coef_array;
    
    type beta_array is array (0 to 35) of std_logic_vector(5 downto 0);
    signal beta, x2, x3, x4, x5, x6, x7, zt4, zt6, zt8 : beta_array;
    
    signal el_1t4, el_2t4, el_3t4 : beta_array;
    signal el_4t6, el_5t6 : beta_array;
    signal el_6t8, el_7t8, z_int: beta_array;

begin
    
    -- beta_k^-1
    beta(0 ) <= beta0 ;
    beta(1 ) <= beta1 ;
    beta(2 ) <= beta2 ;
    beta(3 ) <= beta3 ;
    beta(4 ) <= beta4 ;
    beta(5 ) <= beta5 ;
    beta(6 ) <= beta6 ;
    beta(7 ) <= beta7 ;
    beta(8 ) <= beta8 ;
    beta(9 ) <= beta9 ;
    beta(10) <= beta10;
    beta(11) <= beta11;
    beta(12) <= beta12;
    beta(13) <= beta13;
    beta(14) <= beta14;
    beta(15) <= beta15;
    beta(16) <= beta16;
    beta(17) <= beta17;
    beta(18) <= beta18;
    beta(19) <= beta19;
    beta(20) <= beta20;
    beta(21) <= beta21;
    beta(22) <= beta22;
    beta(23) <= beta23;
    beta(24) <= beta24;
    beta(25) <= beta25;
    beta(26) <= beta26;
    beta(27) <= beta27;
    beta(28) <= beta28;
    beta(29) <= beta29;
    beta(30) <= beta30;
    beta(31) <= beta31;
    beta(32) <= beta32;
    beta(33) <= beta33;
    beta(34) <= beta34;
    beta(35) <= beta35;
    
    z0_coef_evaluation : z0_coef
    port map(
            s1     => s1,
            s2     => s2,
            s3     => s3,
            s4     => s4,
            s5     => s5,
            s6     => s6,
            s7     => s7,
            s8     => s8,
            ax1    => sigma1,
            ax2    => sigma2,
            ax3    => sigma3,
            ax4    => sigma4,
            ax5    => sigma5,
            ax6    => sigma6,
            ax7    => sigma7,
            coef1  => coef(1),
            coef2  => coef(2),
            coef3  => coef(3),
            coef4  => coef(4),
            coef5  => coef(5),
            coef6  => coef(6),
            coef7  => coef(7),
            coef8  => coef(8)
    );
    
    x_n : for I in 0 to 35 generate
        pot2 : prod_alpha
        port map(
            alphaA => beta(I),
            alphaB => beta(I),
            alphaR => x2(I)
        );
        
        pot3 : prod_alpha
        port map(
            alphaA => x2(I),
            alphaB => beta(I),
            alphaR => x3(I)
        );
        --
        pot4 : prod_alpha
        port map(
            alphaA => x3(I),
            alphaB => beta(I),
            alphaR => x4(I)
        );
        
        pot5 : prod_alpha
        port map(
            alphaA => x4(I),
            alphaB => beta(I),
            alphaR => x5(I)
        );
        --
        pot6 : prod_alpha
        port map(
            alphaA => x5(I),
            alphaB => beta(I),
            alphaR => x6(I)
        );
        
        pot7 : prod_alpha
        port map(
            alphaA => x6(I),
            alphaB => beta(I),
            alphaR => x7(I)
        );
    
    end generate;
    
    
    
    z0t4 : for I in 0 to 35 generate
        prod1 : prod_alpha
        port map(
            alphaA => coef(2),
            alphaB => beta(I),
            alphaR => el_1t4(I)
        );
        
        prod2 : prod_alpha
        port map(
            alphaA => coef(3),
            alphaB => x2(I),
            alphaR => el_2t4(I)
        );
        
        prod3 : prod_alpha
        port map(
            alphaA => coef(4),
            alphaB => x3(I),
            alphaR => el_3t4(I)
        );
        
        prod4 : prod_alpha
        port map(
            alphaA => coef(5),
            alphaB => x4(I),
            alphaR => el_4t6(I)
        );
        
        prod5 : prod_alpha
        port map(
            alphaA => coef(6),
            alphaB => x5(I),
            alphaR => el_5t6(I)
        );
        
        prod6 : prod_alpha
        port map(
            alphaA => coef(7),
            alphaB => x6(I),
            alphaR => el_6t8(I)
        );
        
        prod7 : prod_alpha
        port map(
            alphaA => coef(8),
            alphaB => x7(I),
            alphaR => el_7t8(I)
        );
                                                                                                                                   
        zt4(I) <=  (others =>'0') when beta(I) = "000000" else (coef(1) xor el_1t4(I) xor el_2t4(I) xor el_3t4(I));                                                            --
        zt6(I) <=  (others =>'0') when beta(I) = "000000" else (coef(1) xor el_1t4(I) xor el_2t4(I) xor el_3t4(I) xor el_4t6(I) xor el_5t6(I));                                --
        zt8(I) <=  (others =>'0') when beta(I) = "000000" else (coef(1) xor el_1t4(I) xor el_2t4(I) xor el_3t4(I) xor el_4t6(I) xor el_5t6(I) xor el_6t8(I) xor el_7t8(I));    --
        
        z_int(I) <= zt4(I) when t2 = "00" else
                    zt6(I) when t2 = "01" else
                    zt8(I);
        
    end generate; 
    
    z0  <= z_int(0 );
    z1  <= z_int(1 );
    z2  <= z_int(2 );
    z3  <= z_int(3 );
    z4  <= z_int(4 );
    z5  <= z_int(5 );
    z6  <= z_int(6 );
    z7  <= z_int(7 );
    z8  <= z_int(8 );
    z9  <= z_int(9 );
    z10 <= z_int(10);
    z11 <= z_int(11);
    z12 <= z_int(12);
    z13 <= z_int(13);
    z14 <= z_int(14);
    z15 <= z_int(15);
    z16 <= z_int(16);
    z17 <= z_int(17);
    z18 <= z_int(18);
    z19 <= z_int(19);
    z20 <= z_int(20);
    z21 <= z_int(21);
    z22 <= z_int(22);
    z23 <= z_int(23);
    z24 <= z_int(24);
    z25 <= z_int(25);
    z26 <= z_int(26);
    z27 <= z_int(27);
    z28 <= z_int(28);
    z29 <= z_int(29);
    z30 <= z_int(30);
    z31 <= z_int(31);
    z32 <= z_int(32);
    z33 <= z_int(33);
    z34 <= z_int(34);
    z35 <= z_int(35);
    

end Behavioral;

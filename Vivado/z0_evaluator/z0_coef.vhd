library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z0_coef is
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
end z0_coef;

architecture Behavioral of z0_coef is

    component prod_alpha is
        Port (
            alphaA : in std_logic_vector(5 downto 0);
            alphaB : in std_logic_vector(5 downto 0);
            alphaR : out std_logic_vector(5 downto 0)
        );
    end component;

    type aux_array is array (0 to 27) of std_logic_vector(5 downto 0);
    signal aux : aux_array;

begin
-- coef1 = s1
    coef1 <= s1;
    --#########################################################################################################################################################################################################################
-- coef2 = (s2 + a1s1)    
    x1_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s1,
        alphaR => aux(0)
    );
    coef2 <= s2 xor aux(0);
    --#########################################################################################################################################################################################################################
-- coef3 = (s3 + a1s2 + a2s1)    
    x2_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s2,
        alphaR => aux(1)
    );
    x2_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s1,
        alphaR => aux(2)
    );
    coef3 <= s3 xor aux(1) xor aux(2);
    --#########################################################################################################################################################################################################################
-- coef4 = (s4 + a1s3 + a2s2 + a3s1)
    x3_1 : prod_alpha
    
    port map(
        alphaA => ax1,
        alphaB => s3,
        alphaR => aux(3)
    );
    x3_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s2,
        alphaR => aux(4)
    );
    x3_3 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s1,
        alphaR => aux(5)
    );
    coef4 <= s4 xor aux(3) xor aux(4) xor aux(5);
    --#############################################################################################################
-- coef5 = (s5 + a1s4 + a2s3 + a3s2 + a4s1)    
    x4_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s4,
        alphaR => aux(6)
    );
    x4_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s3,
        alphaR => aux(7)
    );
    x4_3 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s2,
        alphaR => aux(8)
    );
    x4_4 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s1,
        alphaR => aux(9)
    );
    coef5 <= s5 xor aux(6) xor aux(7) xor aux(8) xor aux(9);
    --###############################################################################################################
-- coef6 = (s6 + a1s5 + a2s4 + a3s3 + a4s2 + a5s1)    
    x5_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s5,
        alphaR => aux(10)
    );
    x5_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s4,
        alphaR => aux(11)
    );
    x5_3 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s3,
        alphaR => aux(12)
    );
    x5_4 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s2,
        alphaR => aux(13)
    );
    x5_5 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s1,
        alphaR => aux(14)
    );
    coef6 <= s6 xor aux(10) xor aux(11) xor aux(12) xor aux(13) xor aux(14);
    --################################################################################################################
-- coef7 = (s7 + a1s6 + a2s5 + a3s4 + a4s3 + a5s2 + a6s1)    
    x6_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s6,
        alphaR => aux(15)
    );
    x6_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s5,
        alphaR => aux(16)
    );
    x6_3 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s4,
        alphaR => aux(17)
    );
    x6_4 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s3,
        alphaR => aux(18)
    );
    x6_5 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s2,
        alphaR => aux(19)
    );
    x6_6 : prod_alpha
    port map(
        alphaA => ax6,
        alphaB => s1,
        alphaR => aux(20)
    );
    coef7 <= s7 xor aux(15) xor aux(16) xor aux(17) xor aux(18) xor aux(19) xor aux(20);
    --####################################################################################################################
-- coef8 = (s8 + a1s7 + a2s6 + a3s5 + a4s4 + a5s3 + a6s2 + a7s1)    
    x7_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s7,
        alphaR => aux(21)
    );
    x7_2 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s6,
        alphaR => aux(22)
    );
    x7_3 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s5,
        alphaR => aux(23)
    );
    x7_4 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s4,
        alphaR => aux(24)
    );
    x7_5 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s3,
        alphaR => aux(25)
    );
    x7_6 : prod_alpha
    port map(
        alphaA => ax6,
        alphaB => s2,
        alphaR => aux(26)
    );
    x7_7 : prod_alpha
    port map(
        alphaA => ax7,
        alphaB => s1,
        alphaR => aux(27)
    );
    coef8 <= s8 xor aux(21) xor aux(22) xor aux(23) xor aux(24) xor aux(25) xor aux(26) xor aux(27);
    
end Behavioral;
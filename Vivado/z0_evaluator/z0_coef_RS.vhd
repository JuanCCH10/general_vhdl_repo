library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z0_coef_RS is
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
end z0_coef_RS;

architecture Behavioral of z0_coef_RS is

    component prod_alpha is
        Port (
            alphaA : in std_logic_vector(5 downto 0);
            alphaB : in std_logic_vector(5 downto 0);
            alphaR : out std_logic_vector(5 downto 0)
        );
    end component;

    type long_val is array (0 to 16) of std_logic_vector(5 downto 0);
    type aux_array is array (0 to 119) of std_logic_vector(5 downto 0);
    signal val : long_val;
    signal aux : aux_array;

begin

    val(0) <= s1;
    --#########################################################################################################################################################################################################################
    val_1 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s1,
        alphaR => aux(0)
    );
    val(1) <= s2 xor aux(0);
    --#########################################################################################################################################################################################################################
    val_21 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s2,
        alphaR => aux(1)
    );
    val_22 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s1,
        alphaR => aux(2)
    );
    val(2) <= s3 xor aux(1) xor aux(2);
    --#########################################################################################################################################################################################################################
    val_31 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s3,
        alphaR => aux(3)
    );
    val_32 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s2,
        alphaR => aux(4)
    );
    val_33 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s1,
        alphaR => aux(5)
    );
    val(3) <= s4 xor aux(3) xor aux(4) xor aux(5);
    --#########################################################################################################################################################################################################################
    val_41 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s4,
        alphaR => aux(6)
    );
    val_42 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s3,
        alphaR => aux(7)
    );
    val_43 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s2,
        alphaR => aux(8)
    );
    val_44 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s1,
        alphaR => aux(9)
    );
    val(4) <= s5 xor aux(6) xor aux(7) xor aux(8) xor aux(9);
    --#########################################################################################################################################################################################################################
    val_51 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s5,
        alphaR => aux(10)
    );
    val_52 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s4,
        alphaR => aux(11)
    );
    val_53 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s3,
        alphaR => aux(12)
    );
    val_54 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s2,
        alphaR => aux(13)
    );
    val_55 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s1,
        alphaR => aux(14)
    );
    val(5) <= s6 xor aux(10) xor aux(11) xor aux(12) xor aux(13) xor aux(14);
    --#########################################################################################################################################################################################################################
    val_61 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s6,
        alphaR => aux(15)
    );
    val_62 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s5,
        alphaR => aux(16)
    );
    val_63 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s4,
        alphaR => aux(17)
    );
    val_64 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s3,
        alphaR => aux(18)
    );
    val_65 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s2,
        alphaR => aux(19)
    );
    val_66 : prod_alpha
    port map(
        alphaA => ax6,
        alphaB => s1,
        alphaR => aux(20)
    );
    val(6) <= s7 xor aux(15) xor aux(16) xor aux(17) xor aux(18) xor aux(19) xor aux(20);
    --#########################################################################################################################################################################################################################
    val_71 : prod_alpha
    port map(
        alphaA => ax1,
        alphaB => s7,
        alphaR => aux(21)
    );
    val_72 : prod_alpha
    port map(
        alphaA => ax2,
        alphaB => s6,
        alphaR => aux(22)
    );
    val_73 : prod_alpha
    port map(
        alphaA => ax3,
        alphaB => s5,
        alphaR => aux(23)
    );
    val_74 : prod_alpha
    port map(
        alphaA => ax4,
        alphaB => s4,
        alphaR => aux(24)
    );
    val_75 : prod_alpha
    port map(
        alphaA => ax5,
        alphaB => s3,
        alphaR => aux(25)
    );
    val_76 : prod_alpha
    port map(
        alphaA => ax6,
        alphaB => s2,
        alphaR => aux(26)
    );
    val_77 : prod_alpha
    port map(
        alphaA => ax7,
        alphaB => s1,
        alphaR => aux(27)
    );
    val(7) <= s8 xor aux(21) xor aux(22) xor aux(23) xor aux(24) xor aux(25) xor aux(26) xor aux(27);
    --#########################################################################################################################################################################################################################
    coef1  <= val(0);
    coef2  <= val(1);
    coef3  <= val(2);
    coef4  <= val(3);
    coef5  <= val(4);
    coef6  <= val(5);
    coef7  <= val(6);
    coef8  <= val(7);
end Behavioral;
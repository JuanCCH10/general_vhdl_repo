-- sintaxis no utilizada para conectar independientemente modulos de distancia de Hamming
--    signal est0_0 : std_logic_vector(3 downto 0) := "0000";
--    signal est0_1 : std_logic_vector(3 downto 0) := "1111";
--    signal est0_2 : std_logic_vector(3 downto 0) := "1100";
--    signal est0_3 : std_logic_vector(3 downto 0) := "0011";

--    signal est1_0 : std_logic_vector(3 downto 0) := "0100";
--    signal est1_1 : std_logic_vector(3 downto 0) := "1011";
--    signal est1_2 : std_logic_vector(3 downto 0) := "1000";
--    signal est1_3 : std_logic_vector(3 downto 0) := "0111";

--    signal est2_0 : std_logic_vector(3 downto 0) := "1101";
--    signal est2_1 : std_logic_vector(3 downto 0) := "0010";
--    signal est2_2 : std_logic_vector(3 downto 0) := "1000";
--    signal est2_3 : std_logic_vector(3 downto 0) := "1110";

--    signal est3_0 : std_logic_vector(3 downto 0) := "1001";
--    signal est3_1 : std_logic_vector(3 downto 0) := "0110";
--    signal est3_2 : std_logic_vector(3 downto 0) := "0101";
--    signal est3_3 : std_logic_vector(3 downto 0) := "1010";

-- conexiones para evluacion de est0
--    eval_est00 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est0_0,
--        peso_acc => val_acc,
--        peso_ai => val_est(0)
--    );
--    eval_est01 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est0_1,
--        peso_acc => val_acc,
--        peso_ai => val_est(1)
--    );
--    eval_est02 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est0_2,
--        peso_acc => val_acc,
--        peso_ai => val_est(2)
--    );
--    eval_est03 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est0_3,
--        peso_acc => val_acc,
--        peso_ai => val_est(3)
--    );



--    -- conexiones para veluación de est1
--    eval_est10 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est1_0,
--        peso_acc => val_acc,
--        peso_ai => val_est(4)
--    );
--    eval_est11 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est1_1,
--        peso_acc => val_acc,
--        peso_ai => val_est(5)
--    );
--    eval_est12 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est1_2,
--        peso_acc => val_acc,
--        peso_ai => val_est(6)
--    );
--    eval_est13 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est1_3,
--        peso_acc => val_acc,
--        peso_ai => val_est(7)
--    );


--    -- conexiones est2
--    eval_est20 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est2_0,
--        peso_acc => val_acc,
--        peso_ai => val_est(8)
--    );
--    eval_est21 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est2_1,
--        peso_acc => val_acc,
--        peso_ai => val_est(9)
--    );
--    eval_est22 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est2_2,
--        peso_acc => val_acc,
--        peso_ai => val_est(10)
--    );
--    eval_est23 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est2_3,
--        peso_acc => val_acc,
--        peso_ai => val_est(11)
--    );

--    -- conexiones est3
--    eval_est30 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est3_0,
--        peso_acc => val_acc,
--        peso_ai => val_est(12)
--    );
--    eval_est31 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est3_1,
--        peso_acc => val_acc,
--        peso_ai => val_est(13)
--    );
--    eval_est32 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est3_2,
--        peso_acc => val_acc,
--        peso_ai => val_est(14)
--    );
--    eval_est33 : modulo_A_VA
--    port map(
--        dato_rx => dibits_rx,
--        dato_est => est3_3,
--        peso_acc => val_acc,
--        peso_ai => val_est(15)
--    );

--    -- conexiones A-C
--    mC : mCmin_VA12
--    port map(
--        rst => rst,
--        clk => clk,
--        en_pulse => en_pulse,
--        p_est0 => val_est(0),
--        p_est1 => val_est(1),
--        p_est2 => val_est(2),
--        p_est3 => val_est(3),
--        est_sel => flag_est
--    );
--    est_r <= flag_est(1 downto 0);

--    acc_value <= val_est(0) when (flag_est(1 downto 0) = "00") else
--                val_est(1) when (flag_est(1 downto 0) = "01") else
--                val_est(2) when (flag_est(1 downto 0) = "10") else
--                val_est(3);

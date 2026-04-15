	component gemm_blocked_k8_power_unconstrained is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_BA0     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA1     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA2     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA3     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA4     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA5     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA6     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BA7     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB0     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB1     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB2     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB3     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB4     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB5     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB6     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_BB7     : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component gemm_blocked_k8_power_unconstrained;

	u0 : component gemm_blocked_k8_power_unconstrained
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_BA0     => CONNECTED_TO_in_BA0,     --     in_BA0.data
			in_BA1     => CONNECTED_TO_in_BA1,     --     in_BA1.data
			in_BA2     => CONNECTED_TO_in_BA2,     --     in_BA2.data
			in_BA3     => CONNECTED_TO_in_BA3,     --     in_BA3.data
			in_BA4     => CONNECTED_TO_in_BA4,     --     in_BA4.data
			in_BA5     => CONNECTED_TO_in_BA5,     --     in_BA5.data
			in_BA6     => CONNECTED_TO_in_BA6,     --     in_BA6.data
			in_BA7     => CONNECTED_TO_in_BA7,     --     in_BA7.data
			in_BB0     => CONNECTED_TO_in_BB0,     --     in_BB0.data
			in_BB1     => CONNECTED_TO_in_BB1,     --     in_BB1.data
			in_BB2     => CONNECTED_TO_in_BB2,     --     in_BB2.data
			in_BB3     => CONNECTED_TO_in_BB3,     --     in_BB3.data
			in_BB4     => CONNECTED_TO_in_BB4,     --     in_BB4.data
			in_BB5     => CONNECTED_TO_in_BB5,     --     in_BB5.data
			in_BB6     => CONNECTED_TO_in_BB6,     --     in_BB6.data
			in_BB7     => CONNECTED_TO_in_BB7      --     in_BB7.data
		);


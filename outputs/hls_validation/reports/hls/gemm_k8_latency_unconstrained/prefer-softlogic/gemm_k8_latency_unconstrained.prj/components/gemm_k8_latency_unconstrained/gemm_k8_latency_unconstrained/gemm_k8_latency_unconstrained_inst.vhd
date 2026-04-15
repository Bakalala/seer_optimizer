	component gemm_k8_latency_unconstrained is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_A0      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A1      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A2      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A3      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A4      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A5      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A6      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_A7      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B0      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B1      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B2      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B3      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B4      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B5      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B6      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_B7      : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component gemm_k8_latency_unconstrained;

	u0 : component gemm_k8_latency_unconstrained
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_A0      => CONNECTED_TO_in_A0,      --      in_A0.data
			in_A1      => CONNECTED_TO_in_A1,      --      in_A1.data
			in_A2      => CONNECTED_TO_in_A2,      --      in_A2.data
			in_A3      => CONNECTED_TO_in_A3,      --      in_A3.data
			in_A4      => CONNECTED_TO_in_A4,      --      in_A4.data
			in_A5      => CONNECTED_TO_in_A5,      --      in_A5.data
			in_A6      => CONNECTED_TO_in_A6,      --      in_A6.data
			in_A7      => CONNECTED_TO_in_A7,      --      in_A7.data
			in_B0      => CONNECTED_TO_in_B0,      --      in_B0.data
			in_B1      => CONNECTED_TO_in_B1,      --      in_B1.data
			in_B2      => CONNECTED_TO_in_B2,      --      in_B2.data
			in_B3      => CONNECTED_TO_in_B3,      --      in_B3.data
			in_B4      => CONNECTED_TO_in_B4,      --      in_B4.data
			in_B5      => CONNECTED_TO_in_B5,      --      in_B5.data
			in_B6      => CONNECTED_TO_in_B6,      --      in_B6.data
			in_B7      => CONNECTED_TO_in_B7       --      in_B7.data
		);


	component conv3x3_latency_under_lut is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_p00     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p01     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p02     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p10     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p11     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p12     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p20     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p21     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_p22     : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component conv3x3_latency_under_lut;

	u0 : component conv3x3_latency_under_lut
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_p00     => CONNECTED_TO_in_p00,     --     in_p00.data
			in_p01     => CONNECTED_TO_in_p01,     --     in_p01.data
			in_p02     => CONNECTED_TO_in_p02,     --     in_p02.data
			in_p10     => CONNECTED_TO_in_p10,     --     in_p10.data
			in_p11     => CONNECTED_TO_in_p11,     --     in_p11.data
			in_p12     => CONNECTED_TO_in_p12,     --     in_p12.data
			in_p20     => CONNECTED_TO_in_p20,     --     in_p20.data
			in_p21     => CONNECTED_TO_in_p21,     --     in_p21.data
			in_p22     => CONNECTED_TO_in_p22      --     in_p22.data
		);


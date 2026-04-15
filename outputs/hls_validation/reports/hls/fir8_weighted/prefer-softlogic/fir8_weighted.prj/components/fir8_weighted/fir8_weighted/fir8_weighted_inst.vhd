	component fir8_weighted is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_x0      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x1      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x2      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x3      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x4      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x5      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x6      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_x7      : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component fir8_weighted;

	u0 : component fir8_weighted
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_x0      => CONNECTED_TO_in_x0,      --      in_x0.data
			in_x1      => CONNECTED_TO_in_x1,      --      in_x1.data
			in_x2      => CONNECTED_TO_in_x2,      --      in_x2.data
			in_x3      => CONNECTED_TO_in_x3,      --      in_x3.data
			in_x4      => CONNECTED_TO_in_x4,      --      in_x4.data
			in_x5      => CONNECTED_TO_in_x5,      --      in_x5.data
			in_x6      => CONNECTED_TO_in_x6,      --      in_x6.data
			in_x7      => CONNECTED_TO_in_x7       --      in_x7.data
		);


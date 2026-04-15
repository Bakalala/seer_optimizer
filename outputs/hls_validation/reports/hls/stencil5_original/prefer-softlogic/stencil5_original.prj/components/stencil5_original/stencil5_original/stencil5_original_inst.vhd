	component stencil5_original is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_center  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_east    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_north   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_south   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_west    : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component stencil5_original;

	u0 : component stencil5_original
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_center  => CONNECTED_TO_in_center,  --  in_center.data
			in_east    => CONNECTED_TO_in_east,    --    in_east.data
			in_north   => CONNECTED_TO_in_north,   --   in_north.data
			in_south   => CONNECTED_TO_in_south,   --   in_south.data
			in_west    => CONNECTED_TO_in_west     --    in_west.data
		);


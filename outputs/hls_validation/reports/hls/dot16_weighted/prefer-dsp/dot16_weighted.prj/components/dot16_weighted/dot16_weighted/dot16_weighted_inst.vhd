	component dot16_weighted is
		port (
			clock      : in  std_logic                     := 'X';             -- clk
			resetn     : in  std_logic                     := 'X';             -- reset_n
			start      : in  std_logic                     := 'X';             -- valid
			busy       : out std_logic;                                        -- stall
			done       : out std_logic;                                        -- valid
			stall      : in  std_logic                     := 'X';             -- stall
			returndata : out std_logic_vector(31 downto 0);                    -- data
			in_a0      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a1      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a10     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a11     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a12     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a13     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a14     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a15     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a2      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a3      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a4      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a5      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a6      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a7      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a8      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_a9      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b0      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b1      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b10     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b11     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b12     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b13     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b14     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b15     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b2      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b3      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b4      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b5      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b6      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b7      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b8      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_b9      : in  std_logic_vector(31 downto 0) := (others => 'X')  -- data
		);
	end component dot16_weighted;

	u0 : component dot16_weighted
		port map (
			clock      => CONNECTED_TO_clock,      --      clock.clk
			resetn     => CONNECTED_TO_resetn,     --      reset.reset_n
			start      => CONNECTED_TO_start,      --       call.valid
			busy       => CONNECTED_TO_busy,       --           .stall
			done       => CONNECTED_TO_done,       --     return.valid
			stall      => CONNECTED_TO_stall,      --           .stall
			returndata => CONNECTED_TO_returndata, -- returndata.data
			in_a0      => CONNECTED_TO_in_a0,      --      in_a0.data
			in_a1      => CONNECTED_TO_in_a1,      --      in_a1.data
			in_a10     => CONNECTED_TO_in_a10,     --     in_a10.data
			in_a11     => CONNECTED_TO_in_a11,     --     in_a11.data
			in_a12     => CONNECTED_TO_in_a12,     --     in_a12.data
			in_a13     => CONNECTED_TO_in_a13,     --     in_a13.data
			in_a14     => CONNECTED_TO_in_a14,     --     in_a14.data
			in_a15     => CONNECTED_TO_in_a15,     --     in_a15.data
			in_a2      => CONNECTED_TO_in_a2,      --      in_a2.data
			in_a3      => CONNECTED_TO_in_a3,      --      in_a3.data
			in_a4      => CONNECTED_TO_in_a4,      --      in_a4.data
			in_a5      => CONNECTED_TO_in_a5,      --      in_a5.data
			in_a6      => CONNECTED_TO_in_a6,      --      in_a6.data
			in_a7      => CONNECTED_TO_in_a7,      --      in_a7.data
			in_a8      => CONNECTED_TO_in_a8,      --      in_a8.data
			in_a9      => CONNECTED_TO_in_a9,      --      in_a9.data
			in_b0      => CONNECTED_TO_in_b0,      --      in_b0.data
			in_b1      => CONNECTED_TO_in_b1,      --      in_b1.data
			in_b10     => CONNECTED_TO_in_b10,     --     in_b10.data
			in_b11     => CONNECTED_TO_in_b11,     --     in_b11.data
			in_b12     => CONNECTED_TO_in_b12,     --     in_b12.data
			in_b13     => CONNECTED_TO_in_b13,     --     in_b13.data
			in_b14     => CONNECTED_TO_in_b14,     --     in_b14.data
			in_b15     => CONNECTED_TO_in_b15,     --     in_b15.data
			in_b2      => CONNECTED_TO_in_b2,      --      in_b2.data
			in_b3      => CONNECTED_TO_in_b3,      --      in_b3.data
			in_b4      => CONNECTED_TO_in_b4,      --      in_b4.data
			in_b5      => CONNECTED_TO_in_b5,      --      in_b5.data
			in_b6      => CONNECTED_TO_in_b6,      --      in_b6.data
			in_b7      => CONNECTED_TO_in_b7,      --      in_b7.data
			in_b8      => CONNECTED_TO_in_b8,      --      in_b8.data
			in_b9      => CONNECTED_TO_in_b9       --      in_b9.data
		);


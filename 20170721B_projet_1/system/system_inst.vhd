	component system is
		port (
			audio_codec_external_interface_ADCDAT  : in    std_logic                     := 'X';             -- ADCDAT
			audio_codec_external_interface_ADCLRCK : in    std_logic                     := 'X';             -- ADCLRCK
			audio_codec_external_interface_BCLK    : in    std_logic                     := 'X';             -- BCLK
			audio_codec_external_interface_DACDAT  : out   std_logic;                                        -- DACDAT
			audio_codec_external_interface_DACLRCK : in    std_logic                     := 'X';             -- DACLRCK
			audio_config_external_interface_SDAT   : inout std_logic                     := 'X';             -- SDAT
			audio_config_external_interface_SCLK   : out   std_logic;                                        -- SCLK
			audio_pll_1_audio_clk_clk              : out   std_logic;                                        -- clk
			buttons_external_connection_export     : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			clk_clk                                : in    std_logic                     := 'X';             -- clk
			reset_reset_n                          : in    std_logic                     := 'X';             -- reset_n
			sseg_i_iv_external_connection_export   : out   std_logic_vector(31 downto 0);                    -- export
			sseg_v_vi_external_connection_export   : out   std_logic_vector(31 downto 0)                     -- export
		);
	end component system;

	u0 : component system
		port map (
			audio_codec_external_interface_ADCDAT  => CONNECTED_TO_audio_codec_external_interface_ADCDAT,  --  audio_codec_external_interface.ADCDAT
			audio_codec_external_interface_ADCLRCK => CONNECTED_TO_audio_codec_external_interface_ADCLRCK, --                                .ADCLRCK
			audio_codec_external_interface_BCLK    => CONNECTED_TO_audio_codec_external_interface_BCLK,    --                                .BCLK
			audio_codec_external_interface_DACDAT  => CONNECTED_TO_audio_codec_external_interface_DACDAT,  --                                .DACDAT
			audio_codec_external_interface_DACLRCK => CONNECTED_TO_audio_codec_external_interface_DACLRCK, --                                .DACLRCK
			audio_config_external_interface_SDAT   => CONNECTED_TO_audio_config_external_interface_SDAT,   -- audio_config_external_interface.SDAT
			audio_config_external_interface_SCLK   => CONNECTED_TO_audio_config_external_interface_SCLK,   --                                .SCLK
			audio_pll_1_audio_clk_clk              => CONNECTED_TO_audio_pll_1_audio_clk_clk,              --           audio_pll_1_audio_clk.clk
			buttons_external_connection_export     => CONNECTED_TO_buttons_external_connection_export,     --     buttons_external_connection.export
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			reset_reset_n                          => CONNECTED_TO_reset_reset_n,                          --                           reset.reset_n
			sseg_i_iv_external_connection_export   => CONNECTED_TO_sseg_i_iv_external_connection_export,   --   sseg_i_iv_external_connection.export
			sseg_v_vi_external_connection_export   => CONNECTED_TO_sseg_v_vi_external_connection_export    --   sseg_v_vi_external_connection.export
		);


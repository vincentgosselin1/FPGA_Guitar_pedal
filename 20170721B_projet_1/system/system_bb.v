
module system (
	audio_codec_external_interface_ADCDAT,
	audio_codec_external_interface_ADCLRCK,
	audio_codec_external_interface_BCLK,
	audio_codec_external_interface_DACDAT,
	audio_codec_external_interface_DACLRCK,
	audio_config_external_interface_SDAT,
	audio_config_external_interface_SCLK,
	audio_pll_1_audio_clk_clk,
	buttons_external_connection_export,
	clk_clk,
	reset_reset_n,
	sseg_i_iv_external_connection_export,
	sseg_v_vi_external_connection_export);	

	input		audio_codec_external_interface_ADCDAT;
	input		audio_codec_external_interface_ADCLRCK;
	input		audio_codec_external_interface_BCLK;
	output		audio_codec_external_interface_DACDAT;
	input		audio_codec_external_interface_DACLRCK;
	inout		audio_config_external_interface_SDAT;
	output		audio_config_external_interface_SCLK;
	output		audio_pll_1_audio_clk_clk;
	input	[3:0]	buttons_external_connection_export;
	input		clk_clk;
	input		reset_reset_n;
	output	[31:0]	sseg_i_iv_external_connection_export;
	output	[31:0]	sseg_v_vi_external_connection_export;
endmodule

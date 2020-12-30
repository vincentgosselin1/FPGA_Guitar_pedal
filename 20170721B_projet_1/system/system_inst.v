	system u0 (
		.audio_codec_external_interface_ADCDAT  (<connected-to-audio_codec_external_interface_ADCDAT>),  //  audio_codec_external_interface.ADCDAT
		.audio_codec_external_interface_ADCLRCK (<connected-to-audio_codec_external_interface_ADCLRCK>), //                                .ADCLRCK
		.audio_codec_external_interface_BCLK    (<connected-to-audio_codec_external_interface_BCLK>),    //                                .BCLK
		.audio_codec_external_interface_DACDAT  (<connected-to-audio_codec_external_interface_DACDAT>),  //                                .DACDAT
		.audio_codec_external_interface_DACLRCK (<connected-to-audio_codec_external_interface_DACLRCK>), //                                .DACLRCK
		.audio_config_external_interface_SDAT   (<connected-to-audio_config_external_interface_SDAT>),   // audio_config_external_interface.SDAT
		.audio_config_external_interface_SCLK   (<connected-to-audio_config_external_interface_SCLK>),   //                                .SCLK
		.audio_pll_1_audio_clk_clk              (<connected-to-audio_pll_1_audio_clk_clk>),              //           audio_pll_1_audio_clk.clk
		.clk_clk                                (<connected-to-clk_clk>),                                //                             clk.clk
		.reset_reset_n                          (<connected-to-reset_reset_n>)                           //                           reset.reset_n
	);


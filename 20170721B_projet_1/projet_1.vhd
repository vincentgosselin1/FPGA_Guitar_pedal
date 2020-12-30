--top level


library ieee;
use ieee.std_logic_1164.all;

entity projet_1 is 
	port(clock_50 : in std_logic;
		  hex0  : out std_logic_vector(6 downto 0);
		  hex1  : out std_logic_vector(6 downto 0);
		  hex2  : out std_logic_vector(6 downto 0);
		  hex3  : out std_logic_vector(6 downto 0); 
		  hex4  : out std_logic_vector(6 downto 0); 
		  hex5  : out std_logic_vector(6 downto 0);  
		  key : in std_logic_vector(3 downto 0);
		  
		  --for audio codec
		  --Where is AUD_XCK??
		  AUD_XCK :	out std_logic;
		  
		  AUD_ADCDAT	: in std_logic;
		  AUD_ADCLRCK 	: in std_logic;
		  AUD_BCLK		: in std_logic;
		  AUD_DACDAT	: out std_logic;
		  AUD_DACLRCK  : in std_logic;
		  FPGA_I2C_SDAT : inout std_logic; -- SDA connected to Audio chip.
		  FPGA_I2C_SCLK : out std_logic -- SCLK connected to Audio chip.
		  
		  
		 );
	end projet_1; 

architecture structural of projet_1 is	
	
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
			--buttons_external_connection_export     : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			clk_clk                                : in    std_logic                     := 'X';             -- clk
			reset_reset_n                          : in    std_logic                     := 'X'             -- reset_n
			--sseg_i_iv_external_connection_export   : out   std_logic_vector(31 downto 0);                    -- export
			--sseg_v_vi_external_connection_export   : out   std_logic_vector(31 downto 0)                     -- export
		);
	end component system;
	
	component pll_50_to_100m is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
	end component pll_50_to_100m;
	
	
signal clk_100m : std_logic;	

begin 
	nios_system : system
	port map ( clk_clk => clk_100m,
					-- pour Aud_xck, non fourni par Audio Core ...
				  audio_pll_1_audio_clk_clk => AUD_XCK,
					
				  audio_codec_external_interface_ADCDAT => AUD_ADCDAT,
				  audio_codec_external_interface_ADCLRCK => AUD_ADCLRCK,
				  audio_codec_external_interface_BCLK => AUD_BCLK,
				  audio_codec_external_interface_DACDAT => AUD_DACDAT,
				  audio_codec_external_interface_DACLRCK => AUD_DACLRCK,
				  audio_config_external_interface_SDAT => FPGA_I2C_SDAT,
				  audio_config_external_interface_SCLK => FPGA_I2C_SCLK,
	
				  --reset_reset_n => key(0),
				  reset_reset_n => '1'
				  --buttons_external_connection_export => key(3 downto 0),
				  --sseg_i_iv_external_connection_export(6 downto 0) =>  hex0,
				  --sseg_i_iv_external_connection_export(14 downto 8) => hex1,
				  --sseg_i_iv_external_connection_export(22 downto 16) => hex2,
				  --sseg_i_iv_external_connection_export(30 downto 24) => hex3,
				  --sseg_v_vi_external_connection_export(6 downto 0) =>  hex4,
				  --sseg_v_vi_external_connection_export(14 downto 8) => hex5
				);
				
	pll1 : pll_50_to_100m
	port map (
			refclk   => clock_50,
			rst      => '0',
			outclk_0 => clk_100m,
			locked   => open
		);
				
end structural;

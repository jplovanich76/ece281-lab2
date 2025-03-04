
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


entity top_basys3 is
	port(
		-- 7-segment display segments (cathodes CG ... CA)
		seg		:	out std_logic_vector(6 downto 0);  -- seg(6) = CG, seg(0) = CA

		-- 7-segment display active-low enables (anodes)
		an      :	out std_logic_vector(3 downto 0);

		-- Switches
		sw		:	in  std_logic_vector(3 downto 0);
		
		-- Buttons
		btnC	:	in	std_logic

	);
end top_basys3;

architecture top_basys3_arch of top_basys3 is 
	
  -- declare the component of your top-level design
  component sevenseg_decoder is
    port(
        i_Hex : in std_logic_vector(3 downto 0);
        o_seg_n : out std_logic_vector(6 downto 0)
        );
        end component;
 
      signal seg_output : std_logic_vector(6 downto 0);

  
begin

    -- Instantiate the sevenseg_decoder
    sevenseg_inst : sevenseg_decoder
    port map(
        i_Hex   => sw,          -- switches provide hex input
        o_seg_n => seg_output   -- decoder drives 7-segment cathodes
    );

    -- Pass segment output directly to 7-segment display (assuming active-low decoder output)
    seg <= seg_output;

    -- Control the anodes: only the rightmost digit lights up when the button is pressed
    an <= "1110" when btnC = '1' else "1111";  -- Active-low: 0 enables digit

end top_basys3_arch;

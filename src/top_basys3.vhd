library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_basys3 is
    Port (
        -- 7-segment display segments (cathodes CG ... CA)
        seg : out std_logic_vector(6 downto 0);  -- seg(6) = CG, ..., seg(0) = CA

        -- 7-segment display active-low enables (anodes)
        an : out std_logic_vector(3 downto 0);

        -- Switches (4-bit hex input)
        sw : in std_logic_vector(3 downto 0);

        -- Buttons
        btnC : in std_logic
    );
end top_basys3;

architecture top_basys3_arch of top_basys3 is

    -- Declare the 7-segment decoder component
    component sevenseg_decoder is
        Port (
            i_Hex   : in  STD_LOGIC_VECTOR (3 downto 0);
            o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    -- Internal signal for logically ordered segment outputs (A-G)
    signal seg_output : std_logic_vector(6 downto 0);
    signal w_7SD_EN_n : std_logic;

begin

    -- Instantiate the seven-segment decoder
    seg_decoder_inst : sevenseg_decoder
        port map (
            i_Hex   => sw,
            o_seg_n => seg_output
        );

    -- Manually map logical segments (A-G in order) to Basys3 physical order
    seg(0) <= seg_output(6);  -- A
    seg(1) <= seg_output(5);  -- B
    seg(2) <= seg_output(4);  -- C
    seg(3) <= seg_output(3);  -- D
    seg(4) <= seg_output(2);  -- E
    seg(5) <= seg_output(1);  -- F
    seg(6) <= seg_output(0);  -- G

    -- Control the anodes: only the rightmost digit is active when btnC is pressed
    w_7SD_EN_n  <= not btnC;

        an(0)   <= w_7SD_EN_n;
        an(1)   <= '1';
        an(2)   <= '1';
        an(3)   <= '1';

end top_basys3_arch;

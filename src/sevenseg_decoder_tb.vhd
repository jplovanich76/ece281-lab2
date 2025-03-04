library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder
        port (
            i_Hex : in std_logic_vector(3 downto 0);
            o_seg_n : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Signals to connect to UUT (Unit Under Test)
    signal i_Hex : std_logic_vector(3 downto 0);
    signal o_seg_n : std_logic_vector(6 downto 0);

begin

    -- Instantiate the unit under test (UUT)
    uut: sevenseg_decoder
        port map (
            i_Hex   => i_Hex,
            o_seg_n => o_seg_n
        );

    -- Test process that applies all 16 inputs and checks the output
    process
    begin
        -- Test all hex values 0 to F
        i_Hex <= "0000"; wait for 10 ns; assert o_seg_n = "1000000" report "Failed for input 0" severity error;
        i_Hex <= "0001"; wait for 10 ns; assert o_seg_n = "1111001" report "Failed for input 1" severity error;
        i_Hex <= "0010"; wait for 10 ns; assert o_seg_n = "0100100" report "Failed for input 2" severity error;
        i_Hex <= "0011"; wait for 10 ns; assert o_seg_n = "0110000" report "Failed for input 3" severity error;
        i_Hex <= "0100"; wait for 10 ns; assert o_seg_n = "0011001" report "Failed for input 4" severity error;
        i_Hex <= "0101"; wait for 10 ns; assert o_seg_n = "0010010" report "Failed for input 5" severity error;
        i_Hex <= "0110"; wait for 10 ns; assert o_seg_n = "0000010" report "Failed for input 6" severity error;
        i_Hex <= "0111"; wait for 10 ns; assert o_seg_n = "1111000" report "Failed for input 7" severity error;
        i_Hex <= "1000"; wait for 10 ns; assert o_seg_n = "0000000" report "Failed for input 8" severity error;
        i_Hex <= "1001"; wait for 10 ns; assert o_seg_n = "0011000" report "Failed for input 9" severity error;
        i_Hex <= "1010"; wait for 10 ns; assert o_seg_n = "0001000" report "Failed for input A" severity error;
        i_Hex <= "1011"; wait for 10 ns; assert o_seg_n = "0000011" report "Failed for input B" severity error;
        i_Hex <= "1100"; wait for 10 ns; assert o_seg_n = "0100111" report "Failed for input C" severity error;
        i_Hex <= "1101"; wait for 10 ns; assert o_seg_n = "0100001" report "Failed for input D" severity error;
        i_Hex <= "1110"; wait for 10 ns; assert o_seg_n = "0000110" report "Failed for input E" severity error;
        i_Hex <= "1111"; wait for 10 ns; assert o_seg_n = "0001110" report "Failed for input F" severity error;

        -- Report success if all assertions passed
        report "Testbench completed successfully!" severity note;
        wait;  -- Stop simulation
    end process;

end Behavioral;

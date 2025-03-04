
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is

begin

    with i_Hex select
        o_seg_n <=
            "0000001" when "0000",  -- 0
            "0000110" when "0001",  -- 1
            "1011011" when "0010",  -- 2
            "1001111" when "0011",  -- 3
            "1100110" when "0100",  -- 4
            "0110101" when "0101",  -- 5
            "1111101" when "0110",  -- 6
            "0000111" when "0111",  -- 7
            "1111111" when "1000",  -- 8
            "1100111" when "1001",  -- 9
            "1110111" when "1010",  -- A
            "1111100" when "1011",  -- B
            "1011000" when "1100",  -- C
            "1011110" when "1101",  -- D
            "1111001" when "1110",  -- E
            "1110001" when "1111",  -- F
            "1111111" when others;  -- All segments off (invalid input)
            
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Decoder3_8 is
    Port ( input : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder3_8;

architecture Behavioral of Decoder3_8 is

begin

with input select
		output <= "00000001" when "000",
			     "00000010" when "001",
			     "00000100" when "010",
			     "00001000" when "011",
			     "00010000" when "100",
			     "00100000" when "101",
			     "01000000" when "110",
			     "10000000" when others;
			     
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity Decoder_4_16 is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0));
end Decoder_4_16;

architecture Behavioral of Decoder_4_16 is

begin

with input1 select
		D <=    x"0001" when "0000",
			     x"0002" when "0001",
			     x"0004" when "0010",
			     x"0008" when "0011",
			     x"0010" when "0100",
			     x"0020" when "0101",
			     x"0040" when "0110",
			     x"0080" when "0111",
			     x"0100" when "1000",
			     x"0200" when "1001",
			     x"0400" when "1010",
			     x"0800" when "1011",
			     x"1000" when "1100",
			     x"2000" when "1101",
			     x"4000" when "1110",
			     x"8000" when "1111",
				  x"0000" when others;
end Behavioral;


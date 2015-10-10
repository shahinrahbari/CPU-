
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity DATA_BUS is
    Port ( MEM,IR,DR,AC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC,AR : in  STD_LOGIC_VECTOR (9 downto 0);
           SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0));
end DATA_BUS;

architecture Behavioral of DATA_BUS is

begin

with sel select
   F <=  "000000" & AR when "000",
         "000000" & PC when "001",
         DR when "010",
         AC when "011",
         IR when "100",
			MEM when "101",
			x"0000" when others;
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;



entity Register_16bit is
    Port ( D16 : in  STD_LOGIC_VECTOR (15 downto 0);
           Q16 : out  STD_LOGIC_VECTOR (15 downto 0);
           clk,clear,inc,load : in  STD_LOGIC);
end Register_16bit;

architecture Behavioral of Register_16bit is

begin

process(clk,clear)
begin
if(clear='1') then
	Q16<=x"0000";
	elsif(clk'event and clk='1') then
		if (inc='1' )then
			Q16<=D16 + 1;
		elsif(load='1' )then 
			Q16<=D16;
		end if;
	end if;
end process;

end Behavioral;


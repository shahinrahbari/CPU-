
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity Register_1bit is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           clk,clear,load : in  STD_LOGIC);
end Register_1bit;

architecture Behavioral of Register_1bit is

begin

process(clk,clear)
begin
if(clear='1') then
	Q<='0';
	elsif(clk'event and clk='1') then
		if (load='1')then
			Q<=D ;
		end if;
	end if;
end process;

end Behavioral;


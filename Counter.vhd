
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all; 



entity Counter is
    Port ( clk,rst,clear : in  STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is
begin

process(clk,rst)
begin

if (rst='1' or clear='1') then
	Q<="000";
	elsif(clk'event and clk='1') then 
		Q <= Q + 1;
end if;
end process;

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;

entity MEMORY is
port (
    enable   : in  std_logic;
    we      : in  std_logic;
    address : in  std_logic_vector(9 downto 0);
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end MEMORY;

architecture Behavioral of MEMORY is

type ram_type is array (0 to (2**7)-1) of std_logic_vector(15 downto 0);
    signal ram : ram_type :=  (0 =>"0010100000000001" 
   , 1=>"0000001000000001",
     2=>"0101000000001000",
   3=>"0000000000010011",
   4=>"0011000000000100" ,
   5=>"0100100000000000" ,
   6=>"0011000000000101",
   7=>"0011100000000110",
   8=>"0110000000100000" ,
 
 
 
 

	
    others =>(others =>'0'));
   
   
signal read_address : std_logic_vector(9 downto 0);

begin

RamProc: process(enable , we, address, datain) is

  begin
    if enable = '1' then
      if we = '1' then
        ram(to_integer(unsigned(address))) <= datain;
      end if;
      read_address <= address;
    end if;
  end process RamProc;

  dataout <= ram(to_integer(unsigned(read_address)));





end Behavioral;


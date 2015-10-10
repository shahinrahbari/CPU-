
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Dec_4_16tb IS
END Dec_4_16tb;
 
ARCHITECTURE behavior OF Dec_4_16tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder_4_16
    PORT(
         input1 : IN  std_logic_vector(3 downto 0);
         D : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_4_16 PORT MAP (
          input1 => input1,
          D => D
        );
input1<="0000","0001" after 10ns,"0010" after 20ns,"0011" after 30ns,"0100" after 40ns,"0101" after 50ns,
"0110" after 60ns,"0111" after 70ns,"1000" after 80ns,"1001" after 90ns,"1010" after 100ns,"1011" after 110ns,
"1100" after 120ns,"1101" after 130ns,"1110" after 140ns,"1111" after 150ns;






 End;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dec_3_8_tb IS
END dec_3_8_tb;
 
ARCHITECTURE behavior OF dec_3_8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder3_8
    PORT(
         input : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder3_8 PORT MAP (
          input => input,
          output => output
        );

input<="000","001" after 100ns,"010" after 200ns,"011" after 300ns,"100" after 400ns,"101" after 500ns,"110" after 600ns,"111" after 700ns;

END;

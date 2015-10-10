
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 


 
ENTITY reg_1tb IS
END reg_1tb;
 
ARCHITECTURE behavior OF reg_1tb IS 
 

 
    COMPONENT Register_1bit
    PORT(
         D : IN  std_logic;
         Q : OUT  std_logic;
         clk : IN  std_logic;
         clear : IN  std_logic;
         load : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal clk : std_logic := '0';
   signal clear : std_logic := '0';
   signal load : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_1bit PORT MAP (
          D => D,
          Q => Q,
          clk => clk,
          clear => clear,
          load => load
        );
		  
D<='1';
clear<='1','0' after 10ns;
load<='1';

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

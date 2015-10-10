
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY reg10_tb IS
END reg10_tb;
 
ARCHITECTURE behavior OF reg10_tb IS 
 
    
 
    COMPONENT Register_10bit
    PORT(
         D : IN  std_logic_vector(9 downto 0);
         Q : OUT  std_logic_vector(9 downto 0);
         clk1 : IN  std_logic;
         clear : IN  std_logic;
         load : IN  std_logic;
         inc : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(9 downto 0) := (others => '0');
   signal clk1 : std_logic := '0';
   signal clear : std_logic := '0';
   signal load : std_logic := '0';
   signal inc : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk1_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_10bit PORT MAP (
          D => D,
          Q => Q,
          clk1 => clk1,
          clear => clear,
          load => load,
          inc => inc
        );
		  
D<="1010101000";
clear<='1','0' after 10ns;
load<='1','0' after 20ns;
inc<='0','1' after 20ns;

   -- Clock process definitions
   clk1_process :process
   begin
		clk1 <= '0';
		wait for clk1_period/2;
		clk1 <= '1';
		wait for clk1_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk1_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

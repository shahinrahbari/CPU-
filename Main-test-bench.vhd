
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY main_tb IS
END main_tb;
 
ARCHITECTURE behavior OF main_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAIN
    PORT(
         CLK : IN  std_logic;
         Cin : IN  std_logic;
         reset_cnt : IN  std_logic;
         AC_OUT : OUT  std_logic_vector(15 downto 0);
         DR_OUT : OUT  std_logic_vector(15 downto 0);
         RAM_OUT : OUT  std_logic_vector(15 downto 0);
         IR_OUT : OUT  std_logic_vector(15 downto 0);
         PC_OUT : OUT  std_logic_vector(9 downto 0);
         AR_OUT : OUT  std_logic_vector(9 downto 0);
         E_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Cin : std_logic := '0';
   signal reset_cnt : std_logic := '0';

 	--Outputs
   signal AC_OUT : std_logic_vector(15 downto 0);
   signal DR_OUT : std_logic_vector(15 downto 0);
   signal RAM_OUT : std_logic_vector(15 downto 0);
   signal IR_OUT : std_logic_vector(15 downto 0);
   signal PC_OUT : std_logic_vector(9 downto 0);
   signal AR_OUT : std_logic_vector(9 downto 0);
   signal E_OUT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAIN PORT MAP (
          CLK => CLK,
          Cin => Cin,
          reset_cnt => reset_cnt,
          AC_OUT => AC_OUT,
          DR_OUT => DR_OUT,
          RAM_OUT => RAM_OUT,
          IR_OUT => IR_OUT,
          PC_OUT => PC_OUT,
          AR_OUT => AR_OUT,
          E_OUT => E_OUT
        );
Cin<='1';
reset_cnt<='1','0' after 10ps;

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

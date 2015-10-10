
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 

 
    COMPONENT CU
    PORT(
         D : IN  std_logic_vector(11 downto 0);
         d15 : IN  std_logic;
         DR : IN  std_logic_vector(15 downto 0);
         T : IN  std_logic_vector(6 downto 0);
         load_ac : OUT  std_logic;
         load_ar : OUT  std_logic;
         load_pc : OUT  std_logic;
         load_ir : OUT  std_logic;
         load_dr : OUT  std_logic;
         load_mem : OUT  std_logic;
         load_e : OUT  std_logic;
         clear_counter : OUT  std_logic;
         inc_ar : OUT  std_logic;
         inc_dr : OUT  std_logic;
         inc_pc : OUT  std_logic;
         S_alu : OUT  std_logic_vector(2 downto 0);
         S_bus : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(11 downto 0) := (others => '0');
   signal d15 : std_logic := '0';
   signal DR : std_logic_vector(15 downto 0) := (others => '0');
   signal T : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal load_ac : std_logic;
   signal load_ar : std_logic;
   signal load_pc : std_logic;
   signal load_ir : std_logic;
   signal load_dr : std_logic;
   signal load_mem : std_logic;
   signal load_e : std_logic;
   signal clear_counter : std_logic;
   signal inc_ar : std_logic;
   signal inc_dr : std_logic;
   signal inc_pc : std_logic;
   signal S_alu : std_logic_vector(2 downto 0);
   signal S_bus : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          D => D,
          d15 => d15,
          DR => DR,
          T => T,
          load_ac => load_ac,
          load_ar => load_ar,
          load_pc => load_pc,
          load_ir => load_ir,
          load_dr => load_dr,
          load_mem => load_mem,
          load_e => load_e,
          clear_counter => clear_counter,
          inc_ar => inc_ar,
          inc_dr => inc_dr,
          inc_pc => inc_pc,
          S_alu => S_alu,
          S_bus => S_bus
        );
D<="100010010111","000101010100" after 20ns;
d15<='1','0' after 20ns;
DR<=x"0000","1000111100011101" after 20ns;
T<="1111001","1001100" after 20ns; 

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:41 06/25/2015
-- Design Name:   
-- Module Name:   E:/science/xilinxproject/CPU/data_bus_tb.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATA_BUS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY data_bus_tb IS
END data_bus_tb;
 
ARCHITECTURE behavior OF data_bus_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATA_BUS
    PORT(
         MEM : IN  std_logic_vector(15 downto 0);
         IR : IN  std_logic_vector(15 downto 0);
         DR : IN  std_logic_vector(15 downto 0);
         AC : IN  std_logic_vector(15 downto 0);
         PC : IN  std_logic_vector(9 downto 0);
         AR : IN  std_logic_vector(9 downto 0);
         SEL : IN  std_logic_vector(2 downto 0);
         F : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MEM : std_logic_vector(15 downto 0) := (others => '0');
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal DR : std_logic_vector(15 downto 0) := (others => '0');
   signal AC : std_logic_vector(15 downto 0) := (others => '0');
   signal PC : std_logic_vector(9 downto 0) := (others => '0');
   signal AR : std_logic_vector(9 downto 0) := (others => '0');
   signal SEL : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATA_BUS PORT MAP (
          MEM => MEM,
          IR => IR,
          DR => DR,
          AC => AC,
          PC => PC,
          AR => AR,
          SEL => SEL,
          F => F
        );
MEM<=x"5467";
IR<=x"a76b";
DR<=x"2649";
AC<=x"abcd";
PC<="0000000000";
AR<="1111111111";
SEL<="000","001" after 100ns,"010" after 200ns,"011" after 300ns,"100" after 400ns,"101" after 500ns,"110" after 600ns,"111" after 700ns;
END;

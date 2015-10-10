
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity CU is
    Port ( D : in  STD_LOGIC_VECTOR (11 downto 0);
           d15,ir15 : in  STD_LOGIC;
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           T : in  STD_LOGIC_VECTOR (6 downto 0);
           load_ac,load_ar,load_pc,load_ir,load_dr,load_mem ,load_e: out  STD_LOGIC;
           clear_counter,inc_ar,inc_dr,inc_pc : out  STD_LOGIC;
           S_alu : out  STD_LOGIC_VECTOR (2 downto 0);
           S_bus : out  STD_LOGIC_VECTOR (2 downto 0));
end CU;

architecture Behavioral of CU is

begin

load_ar <= T(0) or T(2) or (not(d15)and ir15 and T(3));
load_ac <= (D(0) and T(5)) or (D(1) and T(5)) or (D(2) and T(5)) or (D(5) and T(5)) or (D(7) and T(4)) or (D(8) and T(4)) or (D(9) and T(4)) or (D(10) and T(4));
load_pc <= (D(3) and T(4)) or (D(11) and T(5));
load_ir <= T(1);
load_dr <= (D(0) and T(4)) or (D(1) and T(4)) or (D(2) and T(4)) or (D(4) and T(4)) or (D(5) and T(4));
load_mem <= (D(4) and T(6)) or (D(6) and T(4)) or (D(11) and T(4));
load_e <= (D(0) and T(5)) or (D(1) and T(5)) or (D(9) and T(4)) or (D(10) and T(4));

clear_counter <= (D(0) and T(6)) or (D(1) and T(6)) or (D(2) and T(6)) or (D(3) and T(6)) or (D(4) and T(6)) or (D(5) and T(6)) or (D(6) and T(5)) or (D(7) and T(5)) or (D(8) and T(5)) or (D(9) and T(5)) or (D(10) and T(5)) or (D(11) and T(5));

inc_ar <= (D(11) and T(4));
inc_dr <= D(4) and T(5);
inc_pc <= T(1) or (not(DR(0))and not(DR(1))and not(DR(2))and not(DR(3))and not(DR(4))and not(DR(4))and not(DR(6))and not(DR(7))and not(DR(8))and not(DR(9))and not(DR(10))and not(DR(11))and not(DR(12))and not(DR(13))and not(DR(14))and not(DR(15))  and D(4) and T(6));


S_alu(0) <= (D(1) and T(5)) or (D(7) and T(4)) or (D(9) and T(4)) or (D(5) and T(5));
S_alu(1) <= (D(2) and T(5)) or (D(7) and T(4)) or (D(10) and T(4)) or (D(5) and T(5));
S_alu(2) <= (D(8) and T(4)) or (D(9) and T(4)) or (D(10) and T(4))or (D(5) and T(5));

S_bus(0) <= T(0) or T(1) or (not(d15) and ir15 and T(3)) or (t(4) and (D(0) or D(1) or D(2) or D(4) or D(5) or D(6) or D(11))); 
S_bus(1) <= (D(4) and T(6))  or (D(6) and T(4));
S_bus(2) <= T(1) or T(2) or (not(d15) and ir15 and T(3)) or (t(4) and (D(0) or D(1) or D(2) or D(4) or D(5)));
end Behavioral;


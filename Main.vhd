
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MAIN is
    Port ( CLK , Cin,reset_cnt ,clear_pc : in  STD_LOGIC;
           AC_OUT,DR_OUT,RAM_OUT,IR_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           PC_OUT,AR_OUT : out  STD_LOGIC_VECTOR (9 downto 0);
           E_OUT : out  STD_LOGIC);
end MAIN;

architecture Behavioral of MAIN is


component ALU 
port ( A,B : in STD_LOGIC_VECTOR(15 downto 0);
		Cin : in STD_LOGIC;
		S : in STD_LOGIC_VECTOR(2 downto 0);
		F : out STD_LOGIC_VECTOR(15 downto 0);
		Cout : out STD_LOGIC 
		);
end component;

component DATA_BUS
Port ( MEM,IR,DR,AC : in  STD_LOGIC_VECTOR (15 downto 0);
           PC,AR : in  STD_LOGIC_VECTOR (9 downto 0);
           SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0));
end component;


component Counter
 Port ( clk,rst,clear : in  STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (2 downto 0));
end component;

component CU
Port ( D : in  STD_LOGIC_VECTOR (11 downto 0);
           d15,ir15 : in  STD_LOGIC;
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           T : in  STD_LOGIC_VECTOR (6 downto 0);
           load_ac,load_ar,load_pc,load_ir,load_dr,load_mem ,load_e: out  STD_LOGIC;
           clear_counter,inc_ar,inc_dr,inc_pc : out  STD_LOGIC;
           S_alu : out  STD_LOGIC_VECTOR (2 downto 0);
           S_bus : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component Decoder3_8
Port ( input : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Decoder_4_16
Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component MEMORY
port (
    enable   : in  std_logic;
    we      : in  std_logic;
    address : in  std_logic_vector(9 downto 0);
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end component;

component Register_10bit
Port ( D : in  STD_LOGIC_VECTOR (9 downto 0);
           Q : out  STD_LOGIC_VECTOR (9 downto 0);
           clk1,clear,load,inc : in  STD_LOGIC);
end component;

component Register_16bit
Port ( D16 : in  STD_LOGIC_VECTOR (15 downto 0);
           Q16 : out  STD_LOGIC_VECTOR (15 downto 0);
           clk,clear,inc,load : in  STD_LOGIC);
end component;

component Register_1bit 
Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           clk,clear,load : in  STD_LOGIC);
end component;


signal ld_ac,clear_ac,incr_ac: std_logic;
signal ld_ar,clear_ar,incr_ar:std_logic;
signal ld_pc,incr_pc:std_logic;
signal ld_ir,clear_ir,incr_ir:std_logic;
signal ld_dr,clear_dr,incr_dr:std_logic;
signal ld_mem,mem_en:std_logic;
signal ld_e,clear_e:std_logic;
signal clear_counter:std_logic;
signal cout_de: std_logic;

signal out_bus_in_reg:std_logic_vector(15 downto 0);
signal ac_out1,dr_out1,ir_out1,mem_out1:std_logic_vector(15 downto 0);
signal pc_out1,ar_out1:std_logic_vector(9 downto 0);

signal out_cnt:std_logic_vector(2 downto 0);
signal t: std_logic_vector(7 downto 0);
signal d:std_logic_vector(15 downto 0);
signal sel_alu: std_logic_vector(2 downto 0);
signal sel_bus: std_logic_vector(2 downto 0);
signal out_alu: std_logic_vector(15 downto 0);

begin
AC: Register_16bit port map(D16 => out_alu, Q16 => ac_out1, clk => CLK, clear => clear_ac, inc => incr_ac, load => ld_ac);
DR: Register_16bit port map(D16 => out_bus_in_reg, Q16 => dr_out1, clk => CLK, clear => clear_dr, inc => incr_dr, load => ld_dr);
IR: Register_16bit port map(D16 => out_bus_in_reg, Q16 => ir_out1, clk => CLK, clear => clear_ir, inc => incr_ir, load => ld_ir);
PC: Register_10bit port map(D => out_bus_in_reg(9 downto 0), Q => pc_out1, clk1 => CLK, clear => clear_pc, inc => incr_pc, load => ld_pc); 
AR: Register_10bit port map(D => out_bus_in_reg(9 downto 0), Q => ar_out1, clk1 => CLK, clear => clear_ar, inc => incr_ar, load => ld_ar);
E : Register_1bit port map( D => cout_de, Q => E_OUT, clk => CLK, clear => clear_e, load => ld_e); 

ALU1 : ALU port map( A => ac_out1, B => dr_out1, Cin => Cin, S => sel_alu, F => out_alu, Cout => cout_de);
RAM : MEMORY port map( enable => '1', we => ld_mem, address => ar_out1,datain => out_bus_in_reg, dataout => mem_out1);  
CNT : Counter port map(clk => CLK, rst => reset_cnt,clear => clear_counter  , Q => out_cnt);
dec3_8: Decoder3_8 port map(input => out_cnt, output=> t);
dec4_16:Decoder_4_16 port map(input1 => ir_out1(14 downto 11),D => d);
BUS_16bit: DATA_BUS port map(MEM => mem_out1,IR => ir_out1,DR => dr_out1, AC=> ac_out1,PC => pc_out1, AR => ar_out1, SEL =>sel_bus, F => out_bus_in_reg);
CU1: CU port map(D => d(11 downto 0), d15 => d(15), ir15 => ir_out1(15), DR => dr_out1, T => t(6 downto 0), 
						load_ac => ld_ac, load_ar => ld_ar, load_pc => ld_pc, load_ir => ld_ir, load_dr => ld_dr, load_mem => ld_mem ,load_e => ld_e,
						clear_counter => clear_counter, inc_ar => incr_ar, inc_dr => incr_dr, inc_pc => incr_pc,
						S_alu => sel_alu, S_bus => sel_bus);
AC_OUT <= ac_out1;
DR_OUT <= dr_out1; 
RAM_OUT <= mem_out1;
IR_OUT <= ir_out1;
PC_OUT <= pc_out1;
AR_OUT <= ar_out1;
end Behavioral;


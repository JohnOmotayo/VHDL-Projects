--Lab 3
--Circuit name: Lab 3 top
--Student Name: Titouan Delorme
--Student ID: 260775691
--Student Name: John Omotayo
--Student ID: 260740739

library IEEE; 
use IEEE.std_logic_1164.all;

entity g26_lab3 is
port (input_signal : in std_logic_vector(7 downto 0);
 clk, reset, enable, wr_reg, add_mode : in std_logic;
 d_out: out std_logic_vector(7 downto 0);
 d_outbit: out std_logic);
end g26_lab3;

architecture rtl of g26_lab3 is 
signal enable_0, enable_1, CARRY_OUT, BORROW_OUT, Overflow : std_logic;
signal dR0_out, dR1_out, dR2_out, dR3_out, SUM, DIFFERENCE, Operation: std_logic_vector(7 downto 0);

-- defining components
component lab3_adder is
port(a,b : in std_logic_vector(7 downto 0);
		sum : out std_logic_vector(7 downto 0);
		carry_out : out std_logic);
end component;

component lab3_subtractor is 
port (a,b : in std_logic_vector(7 downto 0);
		difference : out std_logic_vector(7 downto 0);
		borrow_out : out std_logic);
end component;

component lab3_register is 
port (d_in : in std_logic_vector(7 downto 0);
		CLK, RESET, enable: in std_logic;
		d_out : out std_logic_vector(7 downto 0));
end component;

begin
--enable for load registers
enable_0 <= enable and (not wr_reg);
enable_1 <= enable and wr_reg;

--all components of circuit
R0 : lab3_register port map(d_in => input_signal, enable =>enable_0,
RESET => reset, CLK => clk, d_out => dR0_out);
R1 : lab3_register port map(d_in => input_signal, enable =>enable_1, 
RESET => reset, CLK => clk, d_out => dR1_out);
R2 : lab3_register port map(d_in => Operation, enable=>enable,
RESET => reset, CLK => clk, d_out => dR2_out); 
R3 : lab3_register port map(d_in => "0000000"&Overflow, enable=>enable,
RESET => reset, CLK => clk, d_out => dR3_out);
Adder: lab3_adder port map (a => dR0_out, b=> dR1_out, sum => SUM,
carry_out => CARRY_OUT);
Subtractor : lab3_subtractor port map (a=> dR0_out, b=> dR1_out,
difference => DIFFERENCE, borrow_out => BORROW_OUT);

--determines if adder or subtractor is the output
process (add_mode) begin
	if add_mode = '1'then 
		Operation <= SUM;
		Overflow <= CARRY_OUT;
	else Operation <= DIFFERENCE;
		  Overflow <= BORROW_OUT; 
	end if;
end process;

d_out <= dR2_out;
d_outbit <= dR3_out(0);


end architecture rtl;
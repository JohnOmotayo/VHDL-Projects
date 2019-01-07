library ieee;
use ieee.std_logic_1164.all;
entity g26_lab4 is
port( clk,  reset, write_0, write_1, do_op : in std_logic;
			in_1: in std_logic_vector(7 downto 0);
		op_code: in std_logic_vector (1 downto 0);
	output : out std_logic_vector(8 downto 0);
	Ro, Ri : out std_logic_vector(7 downto 0));
end g26_lab4;
	  
architecture moore_mod of g26_lab4 is
type state_type is (s0,s1,s2,s3); -- Declare state types 
signal state : state_type;
signal internal : std_logic_vector (31 downto 0);
signal sum, diff1 ,diff2 : std_logic_vector (7 downto 0);
signal cout, bout1, bout2 : std_logic;
component lab4_adder is 
port ( a,b:in std_logic_vector (7 downto 0);
	sum: out std_logic_vector (7 downto 0);
	cout: out std_logic);
end component;

component lab4_subtractor is 
port ( a,b:in std_logic_vector (7 downto 0);
	diff: out std_logic_vector (7 downto 0);
	bout: out std_logic);
end component;
begin

add: lab4_adder port map (internal (7 downto 0), internal (15 downto 8), sum, cout);
sub1: lab4_subtractor port map( internal (7 downto 0), internal (15 downto 8), diff1, bout1);
sub2 :lab4_subtractor port map( internal (15 downto 8), internal (7 downto 0), diff2, bout2);

sample_state_process : process(clk, op_code, write_0, write_1, reset, do_op) --this will define a clocked process FSM
begin
	if reset='0' then
		state <= s0; -- reset the systemt to start state
	elsif rising_edge(clk) then --define risingn clock edge
		
		case state is --This is similar to high level language case statements
			when s0 => 
				if write_0='0' then --Test for condition to change state
   					state <= s1; 
				end if;
			when s1 => 
				if write_1='0' then
			    	state <= s2;
				end if;
			when s2 => 
				if do_op='0' then
			    	state <= s3;
				end if;
			when s3 => 
				if op_code="11" then
			    	state <= s0;
				end if;
 		end case; --All of the state transitions have been covered
	end if;
end process; --End of the FSM definition

output_sys : process(state, op_code, sum , cout, diff1, bout1, diff2,in_1, bout2) --The output is a function of the state only
begin
	case state is
		when s0 => 
			output <= "000000000"; --This is the output for the state s0.
			internal<= (others=>'0');
		when s1 => 
			internal (7 downto 0) <= in_1;
	    	output <= '0' & in_1;
		when s2 => 
			internal (15 downto 8) <=in_1;
		    output <= '0' & in_1;
		when s3 => 
			if internal(15 downto 0) = "0000000000000000" then
			internal (24 downto 16) <= "100000000";
			elsif op_code="00" then
			internal(23 downto 16)<=sum;
			internal (24)<=cout;
			output<= internal(24 downto 16);
			elsif op_code="01" then
			internal(23 downto 16)<=diff1;
			internal (24)<=bout1;
			output<= internal(24 downto 16);
			elsif op_code="10" then
			internal(23 downto 16)<=diff2;
			internal (24)<=bout2;
			output<= internal(24 downto 16);
			end if;
	end case;
end process;

Ro <= internal(7 downto 0);
Ri <= internal(15 downto 8);

end moore_mod;
--Lab 3
--Circuit name: Lab 3 Register

library IEEE; 
use IEEE.std_logic_1164.all;

entity lab3_register is
port (d_in : in std_logic_vector(7 downto 0);
		clk, reset, enable: in std_logic;
		d_out : out std_logic_vector(7 downto 0));
end lab3_register;

architecture example of lab3_register is 
signal internal : std_logic_vector(7 downto 0); begin 
process(clk, reset) begin 
if reset ='1' then  
--Asynchreset for data   
internal <="00000000"; 
elsif(rising_edge(clk)) 
	then if enable='1' 
		then internal <=d_in; 	
	end if;
end if;  
--signal updated at end of process end if; 
end process; 
d_out<= internal ; 
--update the output ports at the end of the process 
end example; 
--Lab 3
--Circuit name: Lab 3 Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab3_adder is
	port (a,b : in std_logic_vector(7 downto 0);
			sum : out std_logic_vector(7 downto 0);
			carry_out : out std_logic);
end lab3_adder;

architecture example of lab3_adder is
signal temp : std_logic_vector(8 downto 0);
begin
--adding both numbers
temp<=("0"&a)+b;
sum<=temp(7 downto 0);
carry_out<=temp(8);
end example;
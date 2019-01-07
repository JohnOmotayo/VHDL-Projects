--Lab 3
--Circuit name: Lab 3 Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab3_subtractor is
	port (a,b : in std_logic_vector(7 downto 0);
			difference : out std_logic_vector(7 downto 0);
			borrow_out : out std_logic);
end lab3_subtractor;

architecture example of lab3_subtractor is
signal temp : std_logic_vector(8 downto 0);
begin
--subtracting b from a
temp<=("1"&a)-b;
difference<=temp(7 downto 0);
borrow_out<= not temp(8);
end example;
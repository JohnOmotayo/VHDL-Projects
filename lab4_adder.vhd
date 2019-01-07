library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab4_adder is
	port (a,b : in std_logic_vector(7 downto 0);
			sum : out std_logic_vector(7 downto 0);
			cout : out std_logic);
end lab4_adder;

architecture example of lab4_adder is
signal temp : std_logic_vector(8 downto 0);
begin
temp<=("0"&a)+b;
sum<=temp(7 downto 0);
cout<=temp(8);
end example;
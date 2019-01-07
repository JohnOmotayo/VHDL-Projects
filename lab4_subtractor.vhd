library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab4_subtractor is
	port (a,b : in std_logic_vector(7 downto 0);
			diff : out std_logic_vector(7 downto 0);
			bout : out std_logic);
end lab4_subtractor;

architecture example of lab4_subtractor is
signal temp : std_logic_vector(8 downto 0);
begin
temp<=("1"&a)-b;
diff<=temp(7 downto 0);
bout<= not temp(8);
end example;
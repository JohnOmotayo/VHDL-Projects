-- ECSE 221-222 Lab #2 
-- 7 segment decoder
-- Student Name: Titouan Delorme 
-- Student ID: 260775691
-- Student Name: John Omotayo
-- Student ID: 260740739
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
entity g26_lab2 is 
port ( code : in std_logic_vector(3 downto 0);
		 mode : in std_logic;
		 segments_out: out std_logic_vector (6 downto 0)
		);
end g26_lab2;

architecture rt1 of g26_lab2 is 
Signal xcode : std_logic_vector (4 downto 0);

begin

xcode (4 downto 1) <= code; xcode(0) <= mode;
With xcode Select
segments_out <= 
"1000000" WHEN "00000", -- code = 0, mode = 0
"1111001" WHEN "00010", -- code = 1, mode = 0
"0100100" WHEN "00100", -- code = 2, mode = 0
"0110000" WHEN "00110", -- code = 3, mode = 0
"0011001" WHEN "01000", -- code = 4, mode = 0
"0010010" WHEN "01010", -- code = 5, mode = 0
"0000010" WHEN "01100", -- code = 6, mode = 0
"1111000" WHEN "01110", -- code = 7, mode = 0
"0000000" WHEN "10000", -- code = 8, mode = 0
"0010000" WHEN "10010", -- code = 9, mode = 0
"0001000" WHEN "10100", -- code = 10, mode = 0
"0000011" WHEN "10110", -- code = 11, mode = 0
"1000110" WHEN "11000", -- code = 12, mode = 0
"0100001" WHEN "11010", -- code = 13, mode = 0
"0000110" WHEN "11100", -- code = 14, mode = 0
"0001110" WHEN "11110", -- code = 15, mode = 0

"0001000" WHEN "00001", -- code = 0 mode = 1
"0010010" WHEN "00011", -- code = 1 mode = 1
"0100001" WHEN "00101", -- code = 2 mode = 1
"0001000" WHEN "00111", -- code = 3 mode = 1
"0001100" WHEN "01001", -- code = 4 mode = 1
"1001000" WHEN "01011", -- code = 5 mode = 1

"0111111" WHEN OTHERS; -- DEFAULT CASE

end rt1;
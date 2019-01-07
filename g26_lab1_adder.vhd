-- ECSE 221-222 Lab #1 
-- Lab 1 adder
-- Student Name: Titouan Delorme
-- Student ID: 260775691
-- Student Name: John Omotayo
-- Student ID: 260740739
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
-- these are typical libraries used 
entity g26_lab1_adder is
       port ( a,b,carry_in : in std_logic;
       sum,carry_out : out std_logic);
end g26_lab1_adder;
architecture rtl of g26_lab1_adder is
signal abxor, csop1, csop2, csop3 : std_logic;
begin
abxor <= a xor b;
sum <= abxor xor carry_in;
csop1 <= a and b;
csop2 <= b and carry_in;
csop3 <= a and carry_in;
carry_out <= csop1 or csop2 or csop3;
end rtl;

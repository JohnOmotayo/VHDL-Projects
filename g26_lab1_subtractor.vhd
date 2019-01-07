-- ECSE 221-222 Lab #1 
-- 1 bit subtrator
-- Student Name: Titouan Delorme
-- Student ID:260775691
-- Student Name: John Omotayo
-- Student ID:260740739
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
-- these are typical libraries used 
entity g26_lab1_subtractor is
       port ( a,b,borrow_in : in std_logic;
       difference,borrow_out : out std_logic);
end g26_lab1_subtractor;
architecture rtl of g26_lab1_subtractor is
-- Signals are internal connections 
-- You can use these as you wish or add more
signal abxor,nota, bsop1, bsop2, bsop3 : std_logic;
begin
-- Difference logic
 abxor <= a xor b ;
 difference <= borrow_in xor abxor;
-- Borrow_out logic
 nota <= not a;
 bsop1 <= b and nota;
 bsop2 <= nota and borrow_in;
 bsop3 <= b and borrow_in;
 borrow_out <= bsop1 or bsop2 or bsop3;
 end;
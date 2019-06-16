LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux2to1 IS

	PORT( a: in std_logic_vector(7 downto 0);
			b: in std_logic_vector(7 downto 0);
			c	:	in std_logic;
			s: out std_logic_vector(7 downto 0));
			
END Mux2to1;

ARCHITECTURE Multiplexador OF Mux2to1 IS
BEGIN

	s(0) <= (NOT(c) AND a(0)) OR (c AND b(0));
	s(1) <= (NOT(c) AND a(1)) OR (c AND b(1));
	s(2) <= (NOT(c) AND a(2)) OR (c AND b(2));
	s(3) <= (NOT(c) AND a(3)) OR (c AND b(3));
	s(4) <= (NOT(c) AND a(4)) OR (c AND b(4));
	s(5) <= (NOT(c) AND a(5)) OR (c AND b(5));
	s(6) <= (NOT(c) AND a(6)) OR (c AND b(6));
	s(7) <= (NOT(c) AND a(7)) OR (c AND b(7));

END Multiplexador;
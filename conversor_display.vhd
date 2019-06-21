LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY conversor_display IS
	PORT (
		s1, s2, s3, s4 : IN std_logic;
		a, b, c, d, e, f, g : OUT std_logic
	);
END conversor_display;

ARCHITECTURE comportamento OF conversor_display IS
	--DEFINING MY SIGNALS HERE (THE NUMBER BESIDES IS THE THEIR RESPECTIVE BINARY CODIFICATION)
	SIGNAL s0000 : std_logic;
	SIGNAL s0001 : std_logic;
	SIGNAL s0010 : std_logic;
	SIGNAL s0011 : std_logic;
	SIGNAL s0100 : std_logic;
	SIGNAL s0101 : std_logic;
	SIGNAL s0110 : std_logic;
	SIGNAL s0111 : std_logic;
	SIGNAL s1000 : std_logic;
	SIGNAL s1001 : std_logic;
	SIGNAL s1010 : std_logic;
	SIGNAL s1011 : std_logic;
	SIGNAL s1100 : std_logic;
	SIGNAL s1101 : std_logic;
	SIGNAL s1110 : std_logic;
	SIGNAL s1111 : std_logic;

BEGIN
	--naming my signals here;
	s0000 <= NOT(s1) AND NOT(s2) AND NOT(s3) AND NOT(s4);
	s0001 <= NOT(s1) AND NOT(s2) AND NOT(s3) AND s4;
	s0010 <= NOT(s1) AND NOT(s2) AND s3 AND NOT(s4);
	s0011 <= NOT(s1) AND NOT(s2) AND s3 AND s4;
	s0100 <= NOT(s1) AND s2 AND NOT(s3) AND NOT(s4);
	s0101 <= NOT(s1) AND s2 AND NOT(s3) AND s4;
	s0110 <= NOT(s1) AND s2 AND s3 AND NOT(s4);
	s0111 <= NOT(s1) AND s2 AND s3 AND s4;
	s1000 <= s1 AND NOT(s2) AND NOT(s3) AND NOT(s4);
	s1001 <= s1 AND NOT(s2) AND NOT(s3) AND s4;
	s1010 <= s1 AND NOT(s2) AND s3 AND NOT(s4);
	s1011 <= s1 AND NOT(s2) AND s3 AND s4;
	s1100 <= s1 AND s2 AND NOT(s3) AND NOT(s4);
	s1101 <= s1 AND s2 AND NOT(s3) AND s4;
	s1110 <= s1 AND s2 AND s3 AND NOT(s4);
	s1111 <= s1 AND s2 AND s3 AND s4;

	--the proper implementation of my signals here for each output of the seven-segment-display
	a <= (s0000) OR (s0010) OR (s0011) OR (s0101) OR (s0110) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1100) OR (s1110) OR (s1111);
	b <= (s0000) OR (s0001) OR (s0010) OR (s0011) OR (s0100) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1101);
	c <= (s0000) OR (s0001) OR (s0011) OR (s0100) OR (s0101) OR (s0110) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1101);
	d <= (s0000) OR (s0010) OR (s0011) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1011) OR (s1100) OR (s1101) OR (s1110);
	e <= (s0000) OR (s0010) OR (s0110) OR (s1000) OR (s1010) OR (s1011) OR (s1100) OR (s1101) OR (s1110) OR (s1111);
	f <= (s0000) OR (s0100) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1100) OR (s1110) OR (s1111);
	g <= (s0010) OR (s0011) OR (s0100) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1101) OR (s1110) OR (s1111);

END comportamento;

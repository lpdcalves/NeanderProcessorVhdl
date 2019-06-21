entity conversor_display is
	port(
		s1,s2,s3,s4 : IN bit;
		a,b,c,d,e,f,g : OUT bit
	);
end conversor_display;


architecture comportamento of conversor_display is
	--DEFINING MY SIGNALS HERE (THE NUMBER BESIDES IS THE THEIR RESPECTIVE BINARY CODIFICATION)
	signal s0000 : bit;
	signal s0001 : bit;
	signal s0010 : bit;
	signal s0011 : bit;
	signal s0100 : bit;
	signal s0101 : bit;
	signal s0110 : bit;
	signal s0111 : bit;
	signal s1000 : bit;
	signal s1001 : bit;
	signal s1010 : bit;
	signal s1011 : bit;
	signal s1100 : bit;
	signal s1101 : bit;
	signal s1110 : bit;
	signal s1111 : bit;
	
	begin
		--naming my signals here;
		 s0000  <= NOT(s1) and NOT(s2) and NOT(s3) and NOT(s4);
		 s0001  <= NOT(s1) and NOT(s2) and NOT(s3) and s4;
		 s0010  <= NOT(s1) and NOT(s2) and s3 and NOT(s4);
		 s0011  <= NOT(s1) and NOT(s2) and s3 and s4;
		 s0100  <= NOT(s1) and s2 and NOT(s3) and NOT(s4);
		 s0101  <= NOT(s1) and s2 and NOT(s3) and s4;
		 s0110  <= NOT(s1) and s2 and s3 and NOT(s4); 
		 s0111  <= NOT(s1) and s2 and s3 and s4;
		 s1000  <= s1 and NOT(s2) and NOT(s3) and NOT(s4);
		 s1001  <= s1 and NOT(s2) and NOT(s3) and s4;
		 s1010  <= s1 and NOT(s2) and s3 and NOT(s4);
		 s1011  <= s1 and NOT(s2) and s3 and s4;
		 s1100  <= s1 and s2 and NOT(s3) and NOT(s4);
		 s1101  <= s1 and s2 and NOT(s3) and s4;
		 s1110  <= s1 and s2 and s3 and NOT(s4);
		 s1111  <= s1 and s2 and s3 and s4;
		
		--the proper implementation of my signals here for each output of the seven-segment-display
		a <= (s0000) OR (s0010) OR (s0011) OR (s0101) OR (s0110) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1100) OR (s1110) OR (s1111);
		b <= (s0000) OR (s0001) OR (s0010) OR (s0011) OR (s0100) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1101);
		c <= (s0000) OR (s0001) OR (s0011) OR (s0100) OR (s0101) OR (s0110) OR (s0111) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1101);
		d <= (s0000) OR (s0010) OR (s0011) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1011) OR (s1100) OR (s1101) OR (s1110);
		e <= (s0000) OR (s0010) OR (s0110) OR (s1000) OR (s1010) OR (s1011) OR (s1100) OR (s1101) OR (s1110) OR (s1111);
		f <= (s0000) OR (s0100) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1100) OR (s1110) OR (s1111);
		g <= (s0010) OR (s0011) OR (s0100) OR (s0101) OR (s0110) OR (s1000) OR (s1001) OR (s1010) OR (s1011) OR (s1101) OR (s1110) OR (s1111);

end comportamento;



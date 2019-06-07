use ieee.std_logic_1164.all

entity ULA is 
port(
	X: in bit_VECTOR (7 downto 0);
	Y: in bit_VECTOR (7 downto 0);
	selULA: in bit_VECTOR (2 downto 0);
	
	out_ac:	out bit_VECTOR (7 downto 0);
	out_n:	out bit;
	out_z:	out bit;
	
end ULA;

architecture ckt of ULA is
--multiplexador
component mux4_in4bits is
port ( 
		am : in bit_VECTOR (4 downto 0); 
		bm : in bit_VECTOR (4 downto 0);
		cm : in bit_VECTOR (4 downto 0);
		dm : in bit_VECTOR (4 downto 0);
		em : in bit_VECTOR (4 downto 0);
		ch : in bit_VECTOR  (2 downto 0);
		saidam : out bit_VECTOR (4 downto 0));
end component;

--somador
component somador4bits is 
port ( 
		asum : in bit_VECTOR (3 downto 0); 
		bsum : in bit_VECTOR (3 downto 0); 
		cinsum : in bit; 
		ssum : out bit_VECTOR (3 downto 0); 
		coutsum : out bit);
end component;

component somador is 
port(a, b, cin : in bit;
	s, cout : out bit);
end component; 

component display7seg is 
port (xseg: in bit_VECTOR (3 downto 0);
		ctrl0: in bit;
		aseg,bseg,cseg,dseg,eseg,fseg,gseg : out bit);
end component;

--sinais do somador
signal CoutSomador: bit;
signal CinSomador: bit := '0';
signal Ysum: bit_vector(4 downto 0);

--sinais do display 7 segmentos
signal Yseg: bit_vector(3 downto 0);
signal ctrlZero: bit;

begin
	--somador
	instanciaSomador: somador4bits port map (	asum(0)=>x1(0), asum(1)=>x1(1), asum(2)=>x1(2), asum(3)=>x1(3),
															bsum(0)=>x2(0), bsum(1)=>x2(1), bsum(2)=>x2(2), bsum(3)=>x2(3),
															ssum(0)=>Ysum(0), ssum(1)=>Ysum(1),	ssum(2)=>Ysum(2),	ssum(3)=>Ysum(3),
															cinsum => CinSomador,
															coutsum => Ysum(4));

	--multiplexador
	--000 subtrator
	--001 somador
	--010 maiorque
	--011 menorque
	--100 inversor

	multiplexador: mux4_in4bits port map(	am(0) => not coutMenorQue and Ysb(0), am(1) => not coutMenorQue and Ysb(1), am(2) => not coutMenorQue and Ysb(2), am(3) => not coutMenorQue and Ysb(3), am(4) => Ysb(4),
														bm(0) => Ysum(0), bm(1) => Ysum(1), bm(2) => Ysum(2), bm(3) => Ysum(3), bm(4) => Ysum(4),
														cm(0) => '0', cm(1) => '0', cm(2) => '0', cm(3) => '0', cm(4) => coutMaiorQue,
														dm(0) => '0', dm(1) => '0', dm(2) => '0', dm(3) => '0', dm(4) => coutMenorQue,
														em(0) => Yin(0), em(1) => Yin(1), em(2) => Yin(2), em(3) => Yin(3), em(4) => '0',
														ch(0) => chave(0), ch(1) => chave(1), ch(2) => chave(2),
														--saidam(0) => saidaf(0) , saidam(1) => saidaf(1), saidam(2) => saidaf(2), saidam(3) => saidaf(3), saidam(4) => saidaf(4),
														saidam(0) => Yseg(0), saidam(1) => Yseg(1), saidam(2) => Yseg(2), saidam(3) => Yseg(3));
	
	--atribuindo a saida por questoes de debugging
	
	ctrlZero <= NOT(btnLigar) OR (NOT(chave(2)) and NOT(chave(1)) and NOT(chave(0)) and Ysb(4)) OR (NOT(chave(2)) and chave(1) and NOT(chave(0))) OR (NOT(chave(2)) and chave(1) and chave(0));
	--ctrl(1) <= '0';
	
	display7segmento: display7seg port map( 	xseg(0) => Yseg(0), xseg(1) => Yseg(1),xseg(2) => Yseg(2),xseg(3) => Yseg(3), 
															ctrl0 => ctrlZero,
															aseg => saidaDisplay(0), bseg => saidaDisplay(1), cseg => saidaDisplay(2), dseg => saidaDisplay(3), eseg => saidaDisplay(4), fseg => saidaDisplay(5), gseg => saidaDisplay(6));
	

--         						 COMBINACAO LOGICA DO SUBTRATOR PARA ACENDER O LED			   ||			COMBINACAO LOGICA DO SOMADOR PARA ACENDER O LED		  || 			COMBINACAO LOGICA DO MAIOR QUE PARA ACENDER O LED		   ||				COMBINACAO LOGICA DO MENOR QUE PARA ACENDER O LED
	c0 <= btnLigar AND(( NOT(chave(2)) and NOT(chave(1)) and NOT(chave(0))  and Ysb(4)) OR (NOT(chave(2)) and NOT(chave(1)) and chave(0) and Ysum(4)) OR (NOT(chave(2)) and chave(1) and NOT(chave(0)) and coutMaiorQue) OR (NOT(chave(2)) and chave(1) and chave(0) and coutMenorQue));
end ckt;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity somador8bits is 
	port ( 
	asum : in std_logic_vector (7 downto 0); 
	bsum : in std_logic_vector (7 downto 0); 
 	cinsum : in std_logic; 
 	ssum : out std_logic_vector (7 downto 0); 
 	coutsum : out std_logic); 
end somador8bits; 

architecture comportamento of somador8bits is

component somador is 
port(a, b, cin : in std_logic;
s, cout : out std_logic);
end component;

signal c: std_logic_vector(8 downto 0);

begin
	gen: for i in 0 to 7 generate 
		uut: somador port map (a => asum(i), b => bsum(i), cin => c(i), s => ssum(i), cout => c(i+1));
end generate;
c(0) <= cinsum;
coutsum <= c(8);

end comportamento;